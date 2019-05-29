require(testthat)
context("test_create_and_fill_industry_transition_matrix function")

test_that("the create_and_fill_industry_transition_matrix function works", {

  result <- create_and_fill_industry_transition_matrix(ashe_sic_5dig,(ashe_sic_5dig$piden>0 & ashe_sic_5dig$year==2004),"ashe_sic_5dig$piden>0&ashe_sic_5dig$year==2004","sic07")

  expect_true(nrow(result)>0)



})
