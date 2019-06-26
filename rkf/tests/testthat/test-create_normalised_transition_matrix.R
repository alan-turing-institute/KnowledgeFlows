require(testthat)
context("test_create_normalised_transition_matrix function")

test_that("the create_normalised_transition_matrix function works", {

  data <- ashe_sic_5dig[1:10,]
  data$sjd <- 2

  trans_matrix <- create_and_fill_industry_transition_matrix(data,"sic07")

  normalised_matrix <- create_normalised_transition_matrix(trans_matrix)

  expect_equal(dim(normalised_matrix),dim(trans_matrix))




})

