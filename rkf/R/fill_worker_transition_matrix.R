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

  workermatrix <- subset(workermatrix, workermatrix$samejob_inds_final == 2)



  for(row in 1:nrow(workermatrix)) {

    if (nrow(workermatrix)<1){
      break
    }

    # starting industry
    sic_index_row <- toString(workermatrix[row,1])[[1]]

    # finish industry
    sic_index_col <- toString(workermatrix[row,2])[[1]]

    if ((sic_index_row!=sic_index_col) & (workermatrix[row,6][[1]]==1)){

      print ("Warning: conflicting information in flows.")
    }


    filledmatrix[[sic_index_row, sic_index_col]] <- filledmatrix[[sic_index_row,sic_index_col]] +1
  }

  return (filledmatrix)



}

