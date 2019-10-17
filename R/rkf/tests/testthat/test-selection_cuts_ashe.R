require(testthat)
context("test_selection_custs_ashe function")

test_that("the selection_custs_ashe function works", {

  data <- ashe_sic_5dig
  log_path ="/Users/crangelsmith/PycharmProjects/KnowledgeFlows/rkf/tests/testthat/log/"

  result <- selection_cuts_ashe(data,(data$piden>0 & data$year==2004),"ashe_sic_5dig$piden>0&ashe_sic_5dig$year==2004",log_path)

  expect_true(nrow(result)>0)

})
