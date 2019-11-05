require(testthat)
context("create_normalised_transition_matrix_from_reduced function")

test_that("the create_normalised_transition_matrix_from_reduced function works", {

  name_2009_2018_flows <- "Table1_Reduced_matrix_2009_2018_flows.csv"
  dir_secure_lab <- "../../../../securelab_data_outputs/128770_2019_08_23/"
  algorithm_flows <- "FLOWS"
  reduced_matrix <- read.csv(paste0(dir_secure_lab,name_2009_2018_flows,sep=''))
  normalised_output <- create_normalised_transition_matrix_from_reduced(reduced_matrix,-0.99,algorithm_flows)


  expect_equal(dim(normalised_output)[2],10)
  expect_equal(dim(normalised_output)[1],4342)

})

