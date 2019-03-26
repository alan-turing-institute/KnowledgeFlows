require(testthat)
context("empty_transition_matrix function")

test_that("the empty_transition_matrix function works", {

  result <- empty_transition_matrix(ashe_sic_5dig, colname = "sic07")

  expect_true(is.matrix(result))

  # There are 728 unique sic07 codes in the fixture.
  expect_equal(length(unique(ashe_sic_5dig[["sic07"]])), expected = 728)
  expect_equal(nrow(result), expected = 728)
})
