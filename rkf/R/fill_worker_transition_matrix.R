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
#' fill_worker_transition_matrix(ashe_sic_5dig, piden = 1)
#' }
#' @import httr
#' @export
fill_worker_transition_matrix <- function(transitionmatrix, workermatrix) {

  filledmatrix <- transitionmatrix

  for(row in 1:nrow(filledmatrix)) {

    sic_index_col <- workermatrix[row,1]
    sic_index_row <- workermatrix[row,2]

    print (sic_index_col)
    print (sic_index_row)

    filledmatrix[sic_index_row,sic_index_col] <- filledmatrix[sic_index_row,sic_index_col] +1

  }

  return (filledmatrix)



}

