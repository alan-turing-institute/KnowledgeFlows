#' Create a vector of worker transitions
#'
#' TODO: For a particular worker id, produce a vector of all transitions.
#'
#' @param data
#' A data frame.
#' @param piden
#' The personal id of the worker.
#' @param colname
#' The name of the industry code column in the data.
#'
#' @return
#' An list of pairs.
#'
#' @examples
#' \dontrun{
#' worker_transition_matrix(ashe_sic_5dig, piden = 1)
#' }
#' @import httr
#' @export
worker_transition_matrix <- function(data, piden,colname) {

  # get datafram only for the explicit worker
  data_piden <- data[data$piden==piden,][c("year",colname)]

  # make sure the resulting dataframe is sorted in ascending order
  data_piden <- data_piden[order(data_piden$year),]

  flow_list <- list()
  index <- 0

  # loop year by year and get transitions between industries into a vector
  for (i in 1:(nrow(data_piden)-1)){

    if ((data_piden[i+1,"year"] - data_piden[i,"year"])==1){

    index <- index +1
    flow_list[index] <- data_piden[i,colname]

    index <- index +1
    flow_list[index] <- data_piden[i+1,colname]

    }
    else{
      next
    }

  }

  # turn vector into a matrix of industry transitions for the worker
  flow_mat <- matrix(flow_list, ncol = 2, nrow = nrow(data_piden)-1,byrow = TRUE)


  return (flow_mat)

}

