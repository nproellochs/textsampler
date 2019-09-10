#' Subset texts.
#'
#' Subset texts.
#'
#' @param corpus Text corpus.
#' @param max_length Maximum length of the texts to be sampled. \code{max_length} is an integer greater than 0. By default, \code{max_length} is set to 1.
#' @param min_length Minimum length of the texts to be sampled. \code{min_length} is an integer greater than 0. By default, \code{min_length} is set to 1.
#' @param word_list A word list.
#' @return An object of class \code{data.frame}.
#' @import dplyr
#' @rdname subset_text
#' @export
subset_text <- function(corpus, min_length, max_length, word_list) {

  if (!(is.null(min_length) && is.null(max_length))){
    out <- corpus %>% dplyr::filter(N >= min_length, N <= max_length)
  } else {
    out <- corpus
  }

  if (!is.null(word_list)) {
    if(!is.character(word_list)) {
      stop("Invalid parameter: word_list.")
    }

    pattern <- paste(word_list, collapse = "|")
    corpus$In_word_list <- stringr::str_detect(test$Text, pattern)

    out <- out %>% dplyr::filter(In_word_list == TRUE)
  }

  return(out)
}
