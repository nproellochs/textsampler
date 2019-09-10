library(textsampler)
context("textsampler")

test_that("Text sampling works correctly", {
  set.seed(0)

  out <- sample_text(n = 3, source = c("This is a test. This is great.", "This is also a test."), type = "sentences", word_list = NULL, tbl = F)
  expect_equal(out, c("this is a test.", "this is also a test.", "this is great."))

  expect_error(sample_text(n = 0))
  expect_error(sample_text(n = 1.5))
  expect_error(sample_text(n = -1))

  expect_error(sample_text(source = c(1, 4, 5)))
})
