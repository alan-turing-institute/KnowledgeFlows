#' Run all steps to create a filled worker matrix
#'#'
#' @param sample
#' A data frame.
#' @param cuts
#' The cuts to be applied to the sample
#' @return
#' An updated matrix.
#'
#' @examples
#' \dontrun{
#' create_and_fill_industry_transition_matrix <- function(sample, cuts, cutsName,indClass)
#' }
#' @import httr
#' @export
fill_industry_transition_matrix_from_reduced <- function(reduced_matrix,industry_data,ind_class) {

  # create initial empty transition matrix
  transition_matrix <- empty_industry_transition_counts_matrix(industry_data, ind_class)


  # loop by workers
  for (flow in 1:nrows(reduced_matrix)) {

    row_index <- reduced_matrix[flow,1]
    col_index <- reduced_matrix[flow,2]
    value <-    reduced_matrix[flow,3]

    transition_matrix[[row_index, col_index]] <- value



  }

  # return filled matrix
  return (transition_matrix)

}
