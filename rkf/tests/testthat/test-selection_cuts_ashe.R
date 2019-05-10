require(testthat)
context("test_selection_custs_ashe function")

test_that("the selection_custs_ashe function works", {

  result <- selection_cuts_ashe(ashe_sic_5dig,(ashe_sic_5dig$piden>0 & ashe_sic_5dig$year==2004),"ashe_sic_5dig$piden>0&ashe_sic_5dig$year==2004")

  expect_true(nrow(result)>0)

})
