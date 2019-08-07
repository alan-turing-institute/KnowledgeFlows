#' Run all steps to create a filled worker matrix
#'#'
#' @param transition_matrix
#' A matrix
#' @return
#' A matrix.
#'
#' @examples
#' \dontrun{
#' create_normalised_transition_matrix <- function(transition_matrix)
#' }
#' @import httr
#' @export
create_normalised_transition_matrix_from_reduced <- function(reduced_matrix,mincuts,algorithm) {

  transition_matrix <- fill_symetric_industry_transition_matrix_from_reduced(reduced_matrix,algorithm)

  # the null model
  null_model_matrix <- create_null_model_transition_matrix(transition_matrix)

  # normalised matrix
  SR_normalised <- transition_matrix/null_model_matrix

  # normalised and transformed (centered)
  SR_normalised_transformed <- (SR_normalised-1)/(SR_normalised+1)


  rownames(SR_normalised_transformed) <- rownames(transition_matrix)
  colnames(SR_normalised_transformed) <- colnames(transition_matrix)


  new_reduced_matrix <- create_reduced_transition_matrix(SR_normalised_transformed,mincuts)


  reduced_matrix_withlabels <- add_labels_to_reduced_matrix(new_reduced_matrix,reduced_matrix)

  # add labels

  # return filled matrix
  return (reduced_matrix_withlabels)

}

