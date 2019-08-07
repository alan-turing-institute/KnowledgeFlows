require(testthat)
context("test_create_normalised_transition_matrix function")

test_that("the create_normalised_transition_matrix_from_reduced function works", {

  browser()
  reduced_matrix <- read.csv('/Users/crangelsmith/PycharmProjects/KnowledgeFlows/secure_lab_outputs/128770_2019_08_05/Table2_Reduced_matrix_2009_2013_connections.csv')

  normalised_output <- create_normalised_transition_matrix_from_reduced(reduced_matrix,-0.9,"CONN")

  expect_equal(dim(normalised_output),5)




})

