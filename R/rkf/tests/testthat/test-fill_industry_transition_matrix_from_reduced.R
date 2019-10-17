require(testthat)
context("test_fill_industry_transition_matrix_from_reduced function")

test_that("the fill_industry_transition_matrix_from_reduced function works", {

  sub_ashe_sample <- ashe_sic_5dig[1:1000,]
  sub_ashe_sample$sjd <- 2


  transitionmatrix <- create_and_fill_industry_transition_matrix(sub_ashe_sample,"sic07")

  min_counts <- 10
  reduced_matrix <- create_reduced_transition_matrix(transitionmatrix,min_counts)

  expanded_matrix <- fill_industry_transition_matrix_from_reduced(reduced_matrix,sic03_07_5dig,"SIC.2007_CODE")

  # make sure it is a matrix
  expect_true(is.matrix(expanded_matrix))

  index_initial <- which(transitionmatrix>=(min_counts), arr.ind = TRUE)
  index_expanded <- which(expanded_matrix>=(min_counts), arr.ind = TRUE)

  expect_equal(index_initial,index_expanded)

})
