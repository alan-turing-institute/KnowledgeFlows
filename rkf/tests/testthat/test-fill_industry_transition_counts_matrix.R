require(testthat)
context("fill worker transition matrix function")

test_that("the fill_worker_transition_matrix function works", {

  piden <- sample(1:1000,1)

  empty_matrix <- empty_industry_transition_counts_matrix(ashe_sic_5dig, colname = "sic07")

  worker_matrix <- worker_transition_matrix(ashe_sic_5dig, piden = piden,colname='sic07')

  matrix_worker <- fill_worker_transition_matrix(empty_matrix,worker_matrix)

  expect_true(is.matrix(matrix_worker))
  expect_false(is.empty(matrix_worker))
  expect_true(nnzero(matrix_worker))




})
