require(testthat)
context("test_create_reduced_transition_matrix function")

test_that("the create_reduced_transition_matrix function works", {


  sub_ashe_sample <- ashe_sic_5dig[1:1000,]

  transitionmatrix <- create_and_fill_industry_transition_matrix(sub_ashe_sample,(sub_ashe_sample$piden>0),"sub_ashe_sample$piden>0","sic07")

  min_counts <- 3
  reduced_matrix_func <- create_reduced_transition_matrix(transitionmatrix,min_counts)


  # create alternative matrix for test
  reduced_matrix <- as.data.frame(matrix(ncol=3, nrow=0))
  colnames(reduced_matrix) <- c("StartIndst", "FinalIndst", "Counts") #no specific order predictable here

  # get all industries indexed in the initial matrix
  trans_matrix_column <- colnames(transitionmatrix)
  trans_matrix_rows <- rownames(transitionmatrix)

  c <- 1
  # count remaining flows
  missing_flows <- 0
  # start looping on the rows (starting industry in a flow)
  for(row in 1:length(trans_matrix_rows)) {
    row_name <- trans_matrix_rows[row]

    # loop on the columns (final industry in a flow)
    for(column in 1:length(trans_matrix_column)) {
      col_name <- trans_matrix_column[column]

      # apply minimum cut
      if (transitionmatrix[row_name,col_name]<min_counts){
        # keep track of flows that could not be reported due to min counts
        missing_flows <- missing_flows+ transitionmatrix[row_name,col_name]
        next()
      }
      # fill new matrix with the flows and counts
      reduced_matrix[c,1] <- row_name
      reduced_matrix[c,2] <- col_name
      reduced_matrix[c,3] <- transitionmatrix[row_name,col_name]

      c <- c + 1
    }
  }

  # fill new matrix with the flows and counts
  reduced_matrix[c,1] <- "0000"
  reduced_matrix[c,2] <- "0000"
  reduced_matrix[c,3] <- missing_flows


  print (reduced_matrix_func)
  print (reduced_matrix)

  expect_equal(reduced_matrix,reduced_matrix_func)
  expect_equal(dim(reduced_matrix_func)[2],3)

})
