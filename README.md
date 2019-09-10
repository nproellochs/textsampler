<!-- README.md is generated from README.Rmd. Please edit that file -->
Text Sampling
=============

**Author:** [Nicolas Pröllochs](https://nproellochs.com)<br/>
**License:** [MIT](https://opensource.org/licenses/MIT)

The **textsampler** R-Package samples texts from a predefined text
source.

Installation
------------

You can easily install the latest version of **textsampler** with

``` r
# Install the development version from GitHub:
# install.packages("devtools")
devtools::install_github("nproellochs/textsampler")
```

Usage
-----

This section shows the basic functionality of how to sample text from a
predefined text source. First, load the corresponding package
**textsampler**.

``` r
library(textsampler)
```

### Quick demonstration

The following example shows how to sample sentences from a built-in
database of texts. The result is a dataframe containing five random
sentences.

``` r
# Sample five sentences
sample_text(n = 5, type = "sentences")
#> # A tibble: 5 x 6
#>      Id Text                                   Lang  Tok     Token_Id     N
#>   <int> <chr>                                  <chr> <chr>      <int> <int>
#> 1   897 the pizza selections are good.         en    senten~      912     5
#> 2   264 good service, very clean, and inexpen~ en    senten~      270     8
#> 3   368 would come back again if i had a sush~ en    senten~      377    13
#> 4   569 an hour... seriously?                  en    senten~      580     3
#> 5   904 and the drinks are weak, people!       en    senten~      920     6
```

### Example: Sampling text from built-in text source

The following example shows how to sample words from a built-in text
source (“english\_words”). The result is a dataframe containing five
random words.

``` r
# Sample five sentences from IMDB reviews
sample_text(n = 5, type = "words", source = "english_words")
#> # A tibble: 5 x 6
#>      Id Text        Lang  Tok   Token_Id     N
#>   <int> <chr>       <chr> <chr>    <int> <int>
#> 1  9440 cuisin      en    words     9440     1
#> 2 42046 trojan      en    words    42046     1
#> 3 44211 upper       en    words    44211     1
#> 4 30925 prediagnost en    words    30925     1
#> 5 29442 peter       en    words    29442     1
```

### Example: Sampling text from website

The **textsampler** R-package works with tidy tools and can easily be
combined with existing packages such as the rvest R-package. The
following example shows how to sample texts from a website.
Specifically, the example samples 15 famous quotes by Julius Ceasar.

``` r
library(rvest)
read_html("https://www.brainyquote.com/authors/julius-caesar-quotes/") %>%
  html_nodes(xpath = ".//a[contains(@class, 'b-qt qt_')]") %>%
  html_text() %>% 
  enframe() %>% 
  sample_text(n = 15, source = ., input = "value", min_length = 1, max_length = 40,
              shuffle = F, clean = T)
#> # A tibble: 15 x 6
#>       Id Text                                   Lang  Tok    Token_Id     N
#>    <int> <chr>                                  <chr> <chr>     <int> <int>
#>  1     1 experience is the teacher of all thin~ en    sente~        1     7
#>  2     2 it is easier to find men who will vol~ en    sente~        2    23
#>  3     3 it was the wont of the immortal gods ~ en    sente~        3    38
#>  4     4 cowards die many times before their a~ en    sente~        4     8
#>  5     5 if you must break the law, do it to s~ en    sente~        5    17
#>  6     7 i came, i saw, i conquered.            en    sente~        7     6
#>  7     8 it is not these well-fed long-haired ~ en    sente~        8    19
#>  8     9 i have lived long enough both in year~ en    sente~        9    11
#>  9    10 i had rather be first in a village th~ en    sente~       10    12
#> 10    11 i love the name of honor, more than i~ en    sente~       11    11
#> 11    12 no one is so brave that he is not dis~ en    sente~       12    13
#> 12    13 men willingly believe what they wish.  en    sente~       13     6
#> 13    14 i have lived long enough to satisfy b~ en    sente~       14    11
#> 14    15 i have always reckoned the dignity of~ en    sente~       15    16
#> 15    16 as a rule, men worry more about what ~ en    sente~       16    16
```

### Example: Sampling text from vector source

The **textsamplr** R-package can be used to sample text from a vector
source. The following example samples five random sentences from a book
downloaded by the **gutenbergr** R-Package.

``` r
library(gutenbergr)
full_text <- gutenberg_download(5314)

textsampler::sample_text(n = 5, source = full_text$text[1:1000], type = "sentences", shuffle = T)
#> # A tibble: 5 x 6
#>      Id Text                                    Lang  Tok    Token_Id     N
#>   <int> <chr>                                   <chr> <chr>     <int> <int>
#> 1    90 59 frederick and catherine (der friede~ en    sente~       84     9
#> 2   281 "thou wilt have, dear frog,\" said she~ en    sente~      279    13
#> 3   245 legend 4 poverty and humility lead to ~ en    sente~      239    14
#> 4   736 "\"one of this kind has never come my ~ en    sente~      927    10
#> 5   453 they set                                en    sente~      518     2
```

Contributing
------------

If you experience any difficulties with the package, or have
suggestions, or want to contribute directly, you have the following
options:

-   Contact the [maintainer](mailto:nicolas.proellochs@wi.jlug.de) by
    email.
-   Issues and bug reports: [File a GitHub
    issue](https://github.com/nproellochs/textsampler/issues).
-   Fork the source code, modify, and issue a [pull
    request](https://help.github.com/articles/creating-a-pull-request-from-a-fork/)
    through the [project GitHub
    page](https://github.com/nproellochs/textsampler).

License
-------

**texsampler** is released under the [MIT
License](https://opensource.org/licenses/MIT)

Copyright (c) 2019 Nicolas Pröllochs
