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
  trans_matrix_column <- colnames(transitionmatrix)
  trans_matrix_rows <- rownames(transitionmatrix)


  # count remaining flows
  missing_flows <- 0

  index <- which(transitionmatrix>=(min_counts), arr.ind = TRUE)
  telliter <- 1000

  if (nrow(index)>0){
  # start looping on the rows (starting industry in a flow)
  for(i in 1:nrow(index)) {

    reduced_matrix[i,1] <- trans_matrix_rows[index[i,1]]
    reduced_matrix[i,2] <- trans_matrix_column[index[i,2]]
    reduced_matrix[i,3] <- transitionmatrix[trans_matrix_rows[index[i,1]],trans_matrix_column[index[i,2]]]

    if( i %% telliter == 0 ) cat(paste("iteration", i, "complete\n"))
  }
  }

  index_min <- which(transitionmatrix<min_counts, arr.ind = TRUE)

  missing_flows <- 0
  if (nrow(index_min)>0){

  missing_flows <- sum(transitionmatrix[index_min])

  }

  # fill new matrix with the flows and counts
  reduced_matrix[nrow(index)+1,1] <- "0000"
  reduced_matrix[nrow(index)+1,2] <- "0000"
  reduced_matrix[nrow(index)+1,3] <- missing_flows



  # return reduced matrix
  return (reduced_matrix)



}
