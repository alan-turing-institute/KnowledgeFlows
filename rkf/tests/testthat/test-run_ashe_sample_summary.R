require(testthat)
context("test_run_ashe_sample_summary function")

test_that("the run_ashe_sample_summary function works", {

  result <- run_ashe_sample_summary(ashe_sic_5dig,'log/log_test_ashe_ashe_sic_5dig',"nocuts")

  expect_equal(file.exists(result), expected = TRUE)

  expect_true(file.info(result)$size>0)

})
