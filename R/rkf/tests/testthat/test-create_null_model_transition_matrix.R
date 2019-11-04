require(testthat)
context("test_create_null_model_transition_matrix function")

test_that("the create_null_model_transition_matrix function works", {

  name_2009_2018_flows <- "Table1_Reduced_matrix_2009_2018_flows.csv"
  dir_secure_lab <- "../../securelab_data_outputs/128770_2019_08_23/"
  algorithm_flows <- "FLOWS"
  reduced_matrix <- read.csv(paste0(dir_secure_lab,name_2009_2018_flows,sep=''))

  transition_matrix <- fill_industry_transition_matrix_from_reduced(reduced_matrix,algorithm_flows)

  null_matrix <- create_null_model_transition_matrix(transition_matrix)

  expect_equal(dim(null_matrix),dim(transition_matrix))

  expect_equal(sum(null_matrix),sum(transition_matrix))



})

