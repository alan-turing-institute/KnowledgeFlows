#' Convert worker transition matrix to a 3-column form
#'
#' @param transitionmatrix
#' A matrix.
#' @param min_counts
#' Minimum number of counts in the matrix to be considered
#' @return
#' An 3 column x N rows matrix (N is number of flows)
#'
#' @examples
#' \dontrun{
#' create_reduced_transition_matrix(transitionmatrix, min_counts)
#' }
#' @import httr
#' @export
create_reduced_transition_matrix <- function(transitionmatrix, min_counts) {

  # define empty dataframe
  reduced_matrix <- as.data.frame(matrix(ncol=3, nrow=0))
  colnames(reduced_matrix) <- c("StartIndst", "FinalIndst", "Counts") #no specific order predictable here

  # get all industries indexed in the initial matrix
  trans_matrix_column <- colnames(result)
  trans_matrix_rows <- rownames(result)

  c <- 1

  # start looping on the rows (starting industry in a flow)
  for(row in 1:length(trans_matrix_rows)) {

    row_name <- trans_matrix_column[row]

  # loop on the columns (final industry in a flow)
  for(column in 1:nrow(trans_matrix_column)) {

     col_name <- trans_matrix_column[column]

    # apply minimum cut
    if (transitionmatrix[row_name,col_name]<min_counts){
      next()

    }

    # fill new matrix with the flows and counts
    reduced_matrix[c,1] <- row_name
    reduced_matrix[c,2] <- col_name
    reduced_matrix[c,3] <- transitionmatrix[row_name,col_name]

    c <- c + 1

  }
  }

  # return reduced matrix
  return (reduced_matrix)



}
