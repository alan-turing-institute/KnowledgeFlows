require(testthat)
context("test_create_and_fill_industry_transition_matrix function")

test_that("the create_and_fill_industry_transition_matrix function works", {

  sub_ashe_sample <- ashe_sic_5dig[1:10,]

  result <- create_and_fill_industry_transition_matrix(sub_ashe_sample,(sub_ashe_sample$piden>0),"sub_ashe_sample$piden>0","sic07")

  expect_true(dim(result)[1]>0)
  expect_true(dim(result)[2]>0)

  indexes <- c(8, 16, 24, 25, 32, 33, 40, 48, 49)

  index_test <- which(result>0)

  expect_equal(indexes,index_test)
  print (result)


})

