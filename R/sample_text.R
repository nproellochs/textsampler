#' Sample texts from a predefined text source
#'
#' Performs text sampling. Requires input data in the form of raw texts.
#'
#' @param n Number of texts to be sampled. \code{n} is an integer greater than 0. By default, \code{n} is set to 1.
#' @param source Text source. A vector of characters, a \code{data.frame}, or an object of type \code{\link[tm]{Corpus}}. Alternatively, one can
#' load a predefined dataset by specifiying a string. In the latter case, possible values are \code{imdb}, \code{amazon}, and \code{english_words}.
#' @param type Type of texts to be sampled. Possible values are texts, paragraphs, sentences, words, and characters.
#' @param sub_token A string specifying the text unit for filtering texts by length via \code{min_length} and \code{max_length}.
#' Possible values are texts, paragraphs, sentences, words, and characters.
#' @param max_length Maximum length of the texts to be sampled. \code{max_length} is an integer greater than 0. By default, \code{max_length} is set to 1.
#' @param min_length Minimum length of the texts to be sampled. \code{min_length} is an integer greater than 0. By default, \code{min_length} is set to 1.
#' @param word_list A word list.
#' @param shuffle If \code{true}, the text samples are returned in random order. Default is \code{true}.
#' @param input A string defining the column name of the raw text data in \code{source}. The value is ignored if \code{source} is not of type \code{dataframe}.
#' @param tbl If \code{true}, the output is returned as a tibble. Default: \code{true}.
#' @param clean If \code{true}, the texts are cleaned before text sampling. Default is \code{true}.
#' @param ... Additional parameters passed to function for e.g. preprocessing.
#' @return An object of class \code{data.frame}.
#' @examples
#' # Sample three sentences from Yelp reviews.
#' sample_text(n = 3, source = "yelp_sentences", type = "sentences")
#' @importFrom magrittr %>%
#' @export
"sample_text" <- function(n = 1, source = "yelp_sentences",
                          type = "sentences", sub_token = "words", max_length = 50, min_length = 1,
                          word_list = NULL,
                          shuffle = T, input = NULL, tbl = T, clean = T, ...) {
  UseMethod("sample_text", source)
}

#' @export
"sample_text.data.frame" <- function(n = 1, source = "yelp_sentences",
                                     type = "sentences", sub_token = "words", max_length = 50, min_length = 1,
                                     word_list = NULL,
                                     shuffle = T, input = NULL, tbl = T, clean = T, ...) {

  data_vec <- source[, c(input)] %>% unlist()

  sample_text(n, source = data_vec, type, sub_token, max_length, min_length, word_list, shuffle, input, tbl, clean, ...)
}

#' @export
"sample_text.character" <- function(n = 1, source = "yelp_sentences",
                                    type = "sentences", sub_token = "words", max_length = 50, min_length = 1,
                                    word_list = NULL,
                                    shuffle = T, input = NULL, tbl = T, clean = T, ...) {

  if (!int_greater_zero(n)) {
    stop("Argument 'n' should be an integer > 0.")
  }
  if (!(int_greater_zero(max_length) & int_greater_zero(min_length))) {
    stop("Arguments 'min_length' and 'max_length' must be integers > 0.")
  }
  if (!(is.character(type) && is.character(sub_token))) {
    stop("Arguments 'type' and 'sub_token' must be of type 'character'.")
  }

  ## Load corpus

  if(length(source) == 1) {
    corpus <- load_corpus(source, type = type, sub_token = sub_token)
  } else {
    corpus <- generate_corpus(text = source, type = type, sub_token = sub_token, clean = clean)
  }

  ## Filter corpus

  corpus_filtered <- subset_text(corpus, min_length = min_length, max_length = max_length, word_list = word_list)

  if (nrow(corpus_filtered) < n) {
    warning(paste0("The parameter 'n' exceeds the number of observations in the corpus. Generated ", nrow(corpus_filtered), " texts"))
  }

  ## Shuffle

  if (shuffle == TRUE) {
    out <- corpus_filtered %>% dplyr::sample_n(min(nrow(corpus_filtered), n))
  } else {
    out <- corpus_filtered %>% slice(1:min(nrow(corpus_filtered), n))
  }

  ## Select output format

  if(tbl == TRUE) {
    out <- out %>% dplyr::as_tibble() %>% dplyr::select(Id, Text, Length = N)

  } else {
    out <- out$Text[1:min(nrow(corpus_filtered), n)]
  }

  return(out)
}

#' @export
"sample_text.Corpus" <- function(n = 1, source = "yelp_sentences",
                                 type = "sentences", sub_token = "words", max_length = 50, min_length = 1,
                                 word_list = NULL,
                                 shuffle = T, input = NULL, tbl = T, clean = T, ...) {
  stop("Not yet implemented!")
}
