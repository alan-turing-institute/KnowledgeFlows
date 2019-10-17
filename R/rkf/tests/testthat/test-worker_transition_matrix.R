require(testthat)
context("worker transition matrix function")

test_that("the worker_transition_matrix function works", {

  piden <- sample(1:1000,1)
  ashe_sic_5dig$sjd <- 2

  result <- worker_transition_matrix(ashe_sic_5dig, piden = piden,colname='sic07')

  # There are 2 columns the result
  expect_equal(ncol(result), expected = 6)

  # There are at least a transition for this worker
  expect_more_than(nrow(result), 1)

 sub_result <- result[c("inds_ini","inds_final")]
  # make sure the transitions are well mapped.
  for (i in seq(1, nrow(sub_result)-1, by = 1)){
    expect_equal(sub_result[i+1,"inds_ini"], sub_result[i,"inds_final"])
  }




})
