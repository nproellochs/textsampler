#' Load text corpus
#'
#' Decides upon a text corpus.
#'
#' @param source A string denoting the data source. Possible values are \code{imdb_sentences}, \code{amazon_sentences},
#' \code{yelp_sentences} and \code{english_words}.
#' @param type Type of texts to be sampled. Possible values are texts, paragraphs, sentences, words, and characters.
#' @param sub_token A string specifying the text unit for filtering texts by length via \code{min_length} and \code{max_length}.
#' @return Text corpus.
load_corpus <- function(source, type, sub_token) {
  if (source == "yelp_sentences") {
    return(load_yelp_sentences(type, sub_token))
  }
  if (source == "imdb_sentences") {
    return(load_imdb_sentences(type, sub_token))
  }
  if (source == "amazon_sentences") {
    return(load_amazon_sentences(type, sub_token))
  }
  if (source == "twenty_newsgroups") {
    return(load_twenty_newsgroups(type, sub_token))
  }
  if (source == "english_words") {
    return(load_english_words(type, sub_token))
  }

  stop("Name of corpus not recognized. Corresponding argument has an invalid value.")
}

#' Loads yelp sentences
#'
#' @param type Type of texts to be sampled. Possible values are texts, paragraphs, sentences, words, and characters.
#' @param sub_token A string specifying the text unit for filtering texts by length via \code{min_length} and \code{max_length}.
#' @return Text corpus.
load_yelp_sentences <- function(type, sub_token) {

  data(yelp_labeled, envir=environment())

  data <- generate_corpus(text = yelp_labeled$Sentence, label = yelp_labeled$Label, type = type, sub_token = sub_token)

  return(data)
}

#' Loads IMDB sentences
#'
#' @param type Type of texts to be sampled. Possible values are texts, paragraphs, sentences, words, and characters.
#' @param sub_token A string specifying the text unit for filtering texts by length via \code{min_length} and \code{max_length}.
#' @return Text corpus.
load_imdb_sentences <- function(type, sub_token) {

  data(imdb_labeled, envir=environment())

  data <- generate_corpus(text = imdb_labeled$Sentence, label = imdb_labeled$Label, type = type, sub_token = sub_token)

  return(data)
}

#' Loads amazon sentences
#'
#' @param type Type of texts to be sampled. Possible values are texts, paragraphs, sentences, words, and characters.
#' @param sub_token A string specifying the text unit for filtering texts by length via \code{min_length} and \code{max_length}.
#' @return Text corpus.
load_amazon_sentences <- function(type, sub_token) {

  data(amazon_labeled, envir=environment())

  data <- generate_corpus(text = amazon_labeled$Sentence, label = amazon_labeled$Label, type = type, sub_token = sub_token)

  return(data)
}

#' Loads 20 newsgroups
#'
#' @param type Type of texts to be sampled. Possible values are texts, paragraphs, sentences, words, and characters.
#' @param sub_token A string specifying the text unit for filtering texts by length via \code{min_length} and \code{max_length}.
#' @return Text corpus.
load_twenty_newsgroups <- function(type, sub_token) {

  data(twenty_newsgroups, envir=environment())

  data <- generate_corpus(text = twenty_newsgroups$Text, label = twenty_newsgroups$Label, type = type, sub_token = sub_token)

  return(data)
}

#' Loads english words
#'
#' @param type Type of texts to be sampled. Possible values are texts, paragraphs, sentences, words, and characters.
#' @param sub_token A string specifying the text unit for filtering texts by length via \code{min_length} and \code{max_length}.
#' @return Text corpus.
load_english_words <- function(type, sub_token) {

  data(english_words, envir=environment())

  data <- generate_corpus(text = english_words, label = rep(0, length(english_words)), type = type, sub_token = sub_token)

  return(data)
}
