require(testthat)
context("test_fill_industry_transition_matrix_from_reduced function")

test_that("the fill_industry_transition_matrix_from_reduced function works", {


  min_counts <- 10
  name_2009_2018_flows <- "Table1_Reduced_matrix_2009_2018_flows.csv"
  dir_secure_lab <- "../../../../securelab_data_outputs/128770_2019_08_23/"
  algorithm_flows <- "FLOWS"
  reduced_matrix <- read.csv(paste0(dir_secure_lab,name_2009_2018_flows,sep=''))
  expanded_matrix <- fill_industry_transition_matrix_from_reduced(reduced_matrix,algorithm_flows)


  # make sure it is a matrix
  expect_true(is.matrix(expanded_matrix))

  # create initial empty transition matrix
  index1 <- reduced_matrix[['StartIndst']]
  index2 <- reduced_matrix[['FinalIndst']]

  index <- unique(c(index1,index2))

  expect_equal(length(index),nrow(expanded_matrix))




})
