#' Run all steps to create a reduced matrix
#'
#' @param input_path
#' Input path.
#' @param output_path
#' Input path.
#' @param colname
#' The name of the industry code column in the data.
#' @param cuts
#' The cuts to be applied to the sample
#' @param labelcuts
#' Labels to name the outputs
#' @param min_counts
#' Labels to name the outputs
#' @param log_path
#' Path to write output
#'
#' @return
#' Nothing
#'
#' @examples
#' \dontrun{
#' run_all(input_path, output_path, log_path, colname, cuts, labelcut, min_counts)
#' }
#' @import httr
#' @export
run_all <- function(selected_sample, output_path, colname, min_counts){


  # build matrix
  transitionmatrix <- create_and_fill_industry_transition_matrix(selected_sample,colname)

  # reduce matrix to 2D of source target
  reduced_matrix <- create_reduced_transition_matrix(transitionmatrix,min_counts)

  write.csv(reduced_matrix,output_path)

  return (0)

}
