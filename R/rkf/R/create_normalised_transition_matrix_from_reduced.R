#' Run all steps to create a normalised worker matrix from an input raw count matrix
#'#'
#' @param transition_matrix
#' A matrix
#' @return
#' A matrix.
#'
#' @examples
#' \dontrun{
#' create_normalised_transition_matrix_from_reduced <- function(reduced_matrix,mincuts,algorithm,sic='sic07')
#' }
#' @import httr
#' @export
create_normalised_transition_matrix_from_reduced <- function(reduced_matrix,mincuts,algorithm,sic='sic07') {

  # from the raw count matrix build an adjacency matrix
  transition_matrix <- fill_industry_transition_matrix_from_reduced(reduced_matrix,algorithm)

  # create a null model from the adjacency matrix
  null_model_matrix <- create_null_model_transition_matrix(transition_matrix)

  # normalised matrix
  SR_normalised <- transition_matrix/null_model_matrix

  # normalised and transformed (centered)
  SR_normalised_transformed <- (SR_normalised-1)/(SR_normalised+1)

  # set names of normalised matrix
  rownames(SR_normalised_transformed) <- rownames(transition_matrix)
  colnames(SR_normalised_transformed) <- colnames(transition_matrix)

  # all diagonals must be 0
  diag(SR_normalised_transformed) <- 1

  # reduce adjacency matrix to a 3-column sample with source/target type
  new_reduced_matrix <- create_reduced_transition_matrix(SR_normalised_transformed,mincuts)

  # add labels to reduced matrix (activity labels)
  reduced_matrix_withlabels <- add_labels_to_reduced_matrix(new_reduced_matrix,reduced_matrix,sic)

  # add labels

  # return filled matrix
  return (reduced_matrix_withlabels)

}

