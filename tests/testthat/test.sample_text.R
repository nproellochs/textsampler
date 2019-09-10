library(textsampler)
context("textsampler")

test_that("Text sampling works correctly", {
  set.seed(0)

  out <- sample_text(n = 3, source = c("This is a test. This is great.", "This is also a test."), type = "sentences", word_list = NULL, tbl = F, shuffle = F)
  expect_equal(out, c("this is a test.", "this is great.", "this is also a test."))

  expect_error(sample_text(n = 0))
  expect_error(sample_text(n = 1.5))
  expect_error(sample_text(n = -1))

  expect_error(sample_text(source = c(1, 4, 5)))

  expect_error(sample_text(clean = 1))
  expect_error(sample_text(tbl = 1))
  expect_error(sample_text(shuffle = 1))
  expect_error(sample_text(input = 1))

  expect_error(sample_text(sub_token = "abc"))

  expect_error(sample_text(word_list = 1))

  expect_error(sample_text(type = 1))

})
