require(testthat)
context("fill worker transition matrix function")

test_that("the fill_worker_transition_matrix function works", {

  piden <- sample(1:1000,1)

  empty_matrix <- empty_industry_transition_counts_matrix(ashe_sic_5dig, colname = "sic07")

  worker_matrix <- worker_transition_matrix(ashe_sic_5dig, piden = piden,colname='sic07')

  matrix_worker <- fill_worker_transition_matrix(empty_matrix,worker_matrix)

  expect_true(is.matrix(matrix_worker))

  transition <- sample(1:nrow(worker_matrix),1)

  sic_index_col <- toString(worker_matrix[transition,1])[[1]]
  sic_index_row <- toString(worker_matrix[transition,2])[[1]]

  value <- matrix_worker[[sic_index_row, sic_index_col]]

  expect_true(value>0)




})
