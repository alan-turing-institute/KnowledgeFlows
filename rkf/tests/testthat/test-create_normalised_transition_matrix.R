require(testthat)
context("test_create_normalised_transition_matrix function")

test_that("the create_normalised_transition_matrix function works", {

  sub_ashe_sample <- ashe_sic_5dig[1:10,]

  trans_matrix <- create_and_fill_industry_transition_matrix(sub_ashe_sample,(sub_ashe_sample$piden>0),"sub_ashe_sample$piden>0","sic07")

  normalised_matrix <- create_normalised_transition_matrix(trans_matrix)

  expect_equal(dim(normalised_matrix),dim(trans_matrix))




})

