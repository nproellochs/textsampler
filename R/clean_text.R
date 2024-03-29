#' Clean texts
#'
#' Performs text cleaning.
#'
#' @param text Text source. A character vector.
#' @return A character vector.
#' @export
clean_text <- function(text) {
  cleaned <- text
  cleaned <- textclean::replace_white(cleaned)
  cleaned <- textclean::replace_non_ascii(cleaned)
  cleaned <- textclean::replace_html(cleaned)
  cleaned <- textclean::replace_white(cleaned)
}
