require(testthat)
context("test_create_reduced_transition_matrix function")

test_that("the create_reduced_transition_matrix function works", {


  sub_ashe_sample <- ashe_sic_5dig[1:1000,]

  result <- create_and_fill_industry_transition_matrix(sub_ashe_sample,(sub_ashe_sample$piden>0),"sub_ashe_sample$piden>0","sic07")

  min_counts <- 6
  reduced_matrix <- create_reduced_transition_matrix(result,min_counts)

  expect_equal(dim(reduced_matrix)[2],3)
  print (reduced_matrix)
  expect_equal(which(reduced_matrix['Counts']<min_counts,integer(0)))

})
