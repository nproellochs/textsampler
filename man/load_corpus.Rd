% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/load_corpus.R
\name{load_corpus}
\alias{load_corpus}
\title{Load text corpus}
\usage{
load_corpus(source, type, sub_token)
}
\arguments{
\item{source}{A string denoting the data source. Possible values are \code{imdb_sentences}, \code{amazon_sentences},
\code{yelp_sentences} and \code{english_words}.}

\item{type}{Type of texts to be sampled. Possible values are texts, paragraphs, sentences, words, and characters.}

\item{sub_token}{A string specifying the text unit for filtering texts by length via \code{min_length} and \code{max_length}.}
}
\value{
Text corpus.
}
\description{
Decides upon a text corpus.
}
