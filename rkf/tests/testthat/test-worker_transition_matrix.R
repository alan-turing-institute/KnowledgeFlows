require(testthat)
context("worker transition matrix function")

test_that("the worker_transition_matrix function works", {


  piden <- sample(1:1000,1)
  result <- worker_transition_matrix(ashe_sic_5dig, piden = piden)

  expect_true(is.matrix(result))

  # There are 2 columns the result
  expect_equal(ncol(result), expected = 4)

  # There are at least a transition for this worker
  expect_more_than(nrow(result), 1)

  # make sure the transitions are well mapped.
  for (i in seq(2, nrow(result)-1, by = 2)){
    expect_equal(result[(nrow(result)-1)+i], result[i])
  }




})
