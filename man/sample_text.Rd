% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/sample_text.R
\name{sample_text}
\alias{sample_text}
\title{Sample texts from a predefined text source}
\usage{
sample_text(n = 1, source = "yelp_sentences", type = "sentences",
  sub_token = "words", max_length = 50, min_length = 1,
  word_list = NULL, shuffle = T, input = NULL, tbl = T,
  clean = T, ...)
}
\arguments{
\item{n}{Number of texts to be sampled. \code{n} is an integer greater than 0. By default, \code{n} is set to 1.}

\item{source}{Text source. A vector of characters, a \code{data.frame}, or an object of type \code{\link[tm]{Corpus}}. Alternatively, one can
load a predefined dataset by specifiying a string. In the latter case, possible values are \code{imdb_sentences}, \code{amazon_sentences},
\code{yelp_sentences} and \code{english_words}.}

\item{type}{Type of texts to be sampled. Possible values are texts, paragraphs, sentences, words, and characters.}

\item{sub_token}{A string specifying the text unit for filtering texts by length via \code{min_length} and \code{max_length}.
Possible values are texts, paragraphs, sentences, words, and characters.}

\item{max_length}{Maximum length of the texts to be sampled. \code{max_length} is an integer greater than 0. By default, \code{max_length} is set to 1.}

\item{min_length}{Minimum length of the texts to be sampled. \code{min_length} is an integer greater than 0. By default, \code{min_length} is set to 1.}

\item{word_list}{A word list.}

\item{shuffle}{If \code{true}, the text samples are returned in random order. Default is \code{true}.}

\item{input}{A string defining the column name of the raw text data in \code{source}. The value is ignored if \code{source} is not of type \code{dataframe}.}

\item{tbl}{If \code{true}, the output is returned as a tibble. Default: \code{true}.}

\item{clean}{If \code{true}, the texts are cleaned before text sampling. Default is \code{true}.}

\item{...}{Additional parameters passed to function for e.g. preprocessing.}
}
\value{
An object of class \code{data.frame}.
}
\description{
Performs text sampling. Requires input data in the form of raw texts.
}
\examples{
# Sample three sentences from Yelp reviews.
sample_text(n = 3, source = "yelp_sentences", type = "sentences")
}
