#' GenerateS text corpus.
#'
#' Generates and tokenizes a text corpus.
#'
#' @param text A vector of character strings.
#' @param type Type of texts to be sampled. Possible values are texts, paragraphs, sentences, words, and characters.
#' @param sub_token A string specifying the text unit for filtering texts by length via \code{min_length} and \code{max_length}.
#' @param label A vector of labels.
#' @param clean If \code{true}, the texts are cleaned before text sampling. Default is \code{true}.
#' @import dplyr
#' @return Text corpus.
generate_corpus <- function(text, type, sub_token, label = NULL, clean = TRUE) {

  text <- clean_text(text)

  corpus <- data.frame(Id = 1:length(text), Text = text,
                              Lang = "en", Tok = type, stringsAsFactors = F)

  tokens <- corpus %>% tidytext::unnest_tokens(word, Text, token = type) %>% dplyr::mutate(Token_Id = row_number())
  tok_counts <- tokens %>% tidytext::unnest_tokens(sub, word, token = sub_token) %>% dplyr::group_by(Token_Id) %>% dplyr::summarize(N = n())

  corpus <- tokens %>% dplyr::select(Id = Id, Text = word, Lang = Lang, Tok = Tok, Token_Id)
  corpus <- dplyr::left_join(corpus, tok_counts, by = "Token_Id")

  return(corpus)
}
