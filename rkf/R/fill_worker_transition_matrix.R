#' Fill wotker transition matrix from a vector of worker transitions
#'
#' TODO: For a particular worker fill the transition matrix.
#'
#' @param workermatrix
#' A data frame.
#' @param transitionmatrix
#' The personal id of the worker.
#' @return
#' An updated matrix.
#'
#' @examples
#' \dontrun{
#' fill_worker_transition_matrix(transitionmatrix,workermatrix)
#' }
#' @import httr
#' @export
fill_worker_transition_matrix <- function(transitionmatrix, workermatrix) {

  filledmatrix <- transitionmatrix

  for(row in 1:nrow(workermatrix)) {

    if (nrow(workermatrix)<1){
      break
    }

    sic_index_col <- toString(workermatrix[row,1])[[1]]
    sic_index_row <- toString(workermatrix[row,2])[[1]]

    filledmatrix[[sic_index_row, sic_index_col]] <- filledmatrix[[sic_index_row,sic_index_col]] +1
  }

  return (filledmatrix)



}

