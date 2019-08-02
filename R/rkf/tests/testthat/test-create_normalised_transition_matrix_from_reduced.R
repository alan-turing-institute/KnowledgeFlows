require(testthat)
context("test_create_normalised_transition_matrix function")

test_that("the create_normalised_transition_matrix_from_reduced function works", {


  reduced_matrix <- read.csv('data/reduced_matrix_4digits_random.csv')
  label_matrix <- read.csv('data/SIC-Code-List.csv')

  normalised_output <- create_normalised_transition_matrix_from_reduced(reduced_matrix,label_matrix,-0.5)

  expect_equal(dim(normalised_output),5)




})

