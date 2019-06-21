#' Run all steps to create a reduced matrix
#'
#' TODO: For a particular worker id, produce a vector of all transitions.
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
#' A data frame
#'
#' @examples
#' \dontrun{
#' run_all(ashe_sic_5dig, piden = 1)
#' }
#' @import httr
#' @export
run_all <- function(input_path, output_path, log_path, colname, cuts, labelcut, min_counts){

  sample_df <- read.csv(input_path)

  selected_sample <- selection_cuts_ashe(sample_df, cuts, labelcut, log_path)

  transitionmatrix <- create_and_fill_industry_transition_matrix(selected_sample,colname)

  reduced_matrix <- create_reduced_transition_matrix(transitionmatrix,min_counts)

  write.csv(reduced_matrix,output_path)

}
