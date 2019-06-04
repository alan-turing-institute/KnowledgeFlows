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
create_and_fill_industry_transition_matrix <- function(sample, cuts, cuts_name, ind_class) {

  # make cuts on inital sample
  selected_sample <- selection_cuts_ashe(sample, cuts, cuts_name)

  print('test')
  # get all workers on selected sample
  unique_workers <- unique(selected_sample$piden)

  # create initial empty transition matrix
  transition_matrix <- empty_industry_transition_counts_matrix(selected_sample, ind_class)


  # loop by workers
  for (worker in unique_workers) {

    # create the transition matrix for a particular worker
    trans_matrix_worker <- worker_transition_matrix(selected_sample, piden = worker, ind_class)

    # fill  matrix with transitions from the worker
    transition_matrix <- fill_worker_transition_matrix(transition_matrix,trans_matrix_worker)

  }

  # return filled matrix
  return (transition_matrix)

}
