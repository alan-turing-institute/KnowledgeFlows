require(testthat)
context("test_create_and_fill_industry_transition_matrix function")

test_that("the create_and_fill_industry_transition_matrix function works", {


  sub_ashe_sample <- ashe_sic_5dig[1:10,]
  sub_ashe_sample$sjd <- sample(2, size = nrow(sub_ashe_sample), replace = TRUE)

  result <- create_and_fill_industry_transition_matrix(sub_ashe_sample,(sub_ashe_sample$piden>0),"sub_ashe_sample$piden>0","sic07")

  expect_true(dim(result)[1]>0)
  expect_true(dim(result)[2]>0)


  print (result)

})

