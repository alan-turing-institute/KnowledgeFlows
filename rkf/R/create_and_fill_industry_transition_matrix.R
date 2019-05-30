#' Run all steps to create a filled worker matrix
#'
#' TODO: For a particular sample run cuts and fill the transition matrix.
#'
#' @param sample
#' A data frame.
#' @param cuts
#' The cuts to be applied to the sample
#' @return
#' An updated matrix.
#'
#' @examples
#' \dontrun{
#' create_and_fill_industry_transition_matrix <- function(sample, cuts, cutsString,indClass)
#' }
#' @import httr
#' @export
create_and_fill_industry_transition_matrix <- function(sample, cuts, cutsString,indClass) {

  # make cuts on inital sample
  selected_sample <- selection_cuts_ashe(sample,cuts,cutsString)

  print('test')
  # get all workers on selected sample
  unique_workers <- unique(selected_sample$piden)

  # create initial empty transition matrix
  transition_matrix <- empty_industry_transition_counts_matrix(selected_sample, colname = indClass)


  for (worker in unique_workers) {



    trans_matrix_worker <- worker_transition_matrix(selected_sample, piden = worker, colname=indClass)

    transition_matrix <- fill_worker_transition_matrix(transition_matrix,trans_matrix_worker)


  }

  return (transition_matrix)

}
