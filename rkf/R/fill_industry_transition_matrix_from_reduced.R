#' Run all steps to create a filled worker matrix
#'#'
#' @param reduced_matrix
#' A matrix
#' @param industry_data
#' A data frame wit the indusry classification.
#' @param ind_class
#' The label for the industry classification
#' @return
#' An updated matrix.
#'
#' @examples
#' \dontrun{
#' fill_industry_transition_matrix_from_reduced <- function(sample, cuts, cutsName,indClass)
#' }
#' @import httr
#' @export
fill_industry_transition_matrix_from_reduced <- function(reduced_matrix,industry_data,ind_class) {

  # create initial empty transition matrix
  transition_matrix <- empty_industry_transition_counts_matrix(industry_data, ind_class)


  # loop by workers
  for (flow in 1:nrow(reduced_matrix)) {

    if (reduced_matrix[flow,1]=="0000"){
      next()
    }

    transition_matrix[[reduced_matrix[flow,1], reduced_matrix[flow,2]]] <-  reduced_matrix[flow,3]
  }

  # return filled matrix
  return (transition_matrix)

}
