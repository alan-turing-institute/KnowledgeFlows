require(testthat)
context("test_create_and_fill_industry_transition_matrix function")

test_that("the create_and_fill_industry_transition_matrix function works", {


  data <- ashe_sic_5dig[1:10,]
  data$sjd <- sample(2, size = nrow(data), replace = TRUE)

  result <- create_and_fill_industry_transition_matrix(data,"sic07")

  expect_true(dim(result)[1]>0)
  expect_true(dim(result)[2]>0)


  print (result)

})

