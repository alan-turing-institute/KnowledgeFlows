#' Run all steps to create a filled worker matrix
#'#'
#' @param transition_matrix
#' A matrix
#' @return
#' A matrix.
#'
#' @examples
#' \dontrun{
#' create_null_model_transition_matrix <- function(transition_matrix)
#' }
#' @import httr
#' @export
create_null_model_transition_matrix <- function(transition_matrix) {


  # get all industries indexed in the initial matrix
  n_trans_matrix_rows <- nrow(transition_matrix)
  n_trans_matrix_column <- ncol(transition_matrix)


  # define empty dataframe
  null_matrix <- as.data.frame(matrix(ncol=n_trans_matrix_column, nrow=n_trans_matrix_rows))


  # count remaining flows
  missing_flows <- 0

  summ_all <- sum(transition_matrix)

  # start looping on the rows (starting industry in a flow)
  for(i in 1:n_trans_matrix_rows) {

    term_1 <- sum(transition_matrix[i,])

    # loop on the columns (final industry in a flow)
    for(j in 1:n_trans_matrix_column) {

      term_2 <- sum(transition_matrix[,j])

      null_matrix[i,j] <- term_1*term_2/summ_all


    }
  }

  rownames(null_matrix) <- rownames(transition_matrix)
  colnames(null_matrix) <- colnames(transition_matrix)

  # return filled matrix
  return (null_matrix)

}
