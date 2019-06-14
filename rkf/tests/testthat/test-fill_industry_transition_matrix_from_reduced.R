require(testthat)
context("test_fill_industry_transition_matrix_from_reduced function")

test_that("the fill_industry_transition_matrix_from_reduced function works", {


  sub_ashe_sample <- ashe_sic_5dig

  transitionmatrix <- create_and_fill_industry_transition_matrix(sub_ashe_sample,(sub_ashe_sample$piden>0),"sub_ashe_sample$piden>0","sic07")

  min_counts <- 5
  reduced_matrix <- create_reduced_transition_matrix(transitionmatrix,min_counts)

  expanded_matrix <- fill_industry_transition_matrix_from_reduced(reduced_matrix,sic03_07_5dig,"sic07")


  expect_equal(expanded_matrix,transitionmatrix)

})
