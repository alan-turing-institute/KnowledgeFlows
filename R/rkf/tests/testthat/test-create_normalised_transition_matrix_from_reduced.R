require(testthat)
context("test_create_normalised_transition_matrix function")

test_that("the create_normalised_transition_matrix_from_reduced function works", {

  browser()

  name_2009_2013_flows <- "Table1_Reduced_matrix_2009_2013_flows.csv"
  algorithm_flows <- "FLOWS"
  reduced_matrix <- read.csv(paste0('/Users/crangelsmith/PycharmProjects/KnowledgeFlows/secure_lab_outputs/128770_2019_08_05/',name_2009_2013_flows))

  normalised_output <- create_normalised_transition_matrix_from_reduced(reduced_matrix,-0.99,algorithm_flows)
  write.csv(normalised_output,paste0("/Users/crangelsmith/PycharmProjects/KnowledgeFlows/python/labour_flows_matrix/data/",name_2009_2013_flows))


  name_2009_2013_connections <- "Table2_Reduced_matrix_2009_2013_connections.csv"
  algorithm_conn <- "CONN"
  reduced_matrix <- read.csv(paste0('/Users/crangelsmith/PycharmProjects/KnowledgeFlows/secure_lab_outputs/128770_2019_08_05/',name_2009_2013_connections))

  normalised_output <- create_normalised_transition_matrix_from_reduced(reduced_matrix,-0.99,algorithm_conn)
  write.csv(normalised_output,paste0("/Users/crangelsmith/PycharmProjects/KnowledgeFlows/python/labour_flows_matrix/data/",name_2009_2013_connections))


  name_2014_2018_flows <- "Table3_Reduced_matrix_2014_2018_flows.csv"
  algorithm_flows <- "FLOWS"
  reduced_matrix <- read.csv(paste0('/Users/crangelsmith/PycharmProjects/KnowledgeFlows/secure_lab_outputs/128770_2019_08_05/',name_2014_2018_flows))

  normalised_output <- create_normalised_transition_matrix_from_reduced(reduced_matrix,-0.99,algorithm_flows)
  write.csv(normalised_output,paste0("/Users/crangelsmith/PycharmProjects/KnowledgeFlows/python/labour_flows_matrix/data/",name_2014_2018_flows))


  name_2014_2018_connections <- "Table4_Reduced_matrix_2014_2018_connections.csv"
  algorithm_conn <- "CONN"
  reduced_matrix <- read.csv(paste0('/Users/crangelsmith/PycharmProjects/KnowledgeFlows/secure_lab_outputs/128770_2019_08_05/',name_2014_2018_connections))

  normalised_output <- create_normalised_transition_matrix_from_reduced(reduced_matrix,-0.99,algorithm_conn)
  write.csv(normalised_output,paste0("/Users/crangelsmith/PycharmProjects/KnowledgeFlows/python/labour_flows_matrix/data/",name_2014_2018_connections))




  expect_equal(dim(normalised_output),5)




})

