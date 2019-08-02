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
add_labels_to_reduced_matrix <- function(reduced_matrix,label_matrix) {

  # create initial empty transition matrix



  # loop by workers
  for (flow in 1:nrow(reduced_matrix)) {

   inds1 <- toString(reduced_matrix[flow,1])
   inds2 <- toString(reduced_matrix[flow,2])

   label1 <- toString(label_matrix[label_matrix$Code==inds1,]$Description)
   label2 <- toString(label_matrix[label_matrix$Code==inds2,]$Description)

   reduced_matrix[flow,"LabelStartIndst"] <- label1
   reduced_matrix[flow,"LabelFinalIndst"] <- label2

  }

  # return filled matrix
  return (reduced_matrix)

}
