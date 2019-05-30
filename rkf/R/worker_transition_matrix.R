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
  flow_year_list <- list()

  index <- 0

  # loop year by year and get transitions between industries into a matrix, record year of transitions.
  for (i in 1:(nrow(data_piden)-1)){

    if ((nrow(data_piden))<=1){
      break
    }

    index <- index +1
    flow_list[index] <- data_piden[i,colname]
    flow_year_list[index] <- data_piden[i,"year"]

    index <- index +1
    flow_list[index] <- data_piden[i+1,colname]
    flow_year_list[index] <- data_piden[i+1,"year"]

    if ((data_piden[i,"year"]-data_piden[i+1,"year"])==0 && (data_piden[i,colname]!=data_piden[i+1,colname])){

      warning(paste("Warning: There is a flow ocurring in the same year ",data_piden[i,"year"]))

    }
    if ((data_piden[i+1,"year"]-data_piden[i,"year"])>1)
    {
      warning_message = paste0("Warning: There is a flow ocurring after worker absence in the data between years: ",data_piden[i,"year"])
      warning_message = paste0(warning_message," and ")

      warning(paste0(warning_message,data_piden[i+1,"year"]))

    }

  }

  # turn vector into a matrix of industry transitions for the worker, add years that the worker was last and first recorded in each industry
  flow_mat <- matrix(flow_list, ncol = 2, nrow = nrow(data_piden)-1,byrow = TRUE, dimnames = list(NULL, c("inds_ini","inda_final")))
  flow_year_mat <- matrix(flow_year_list, ncol = 2, nrow = nrow(data_piden)-1,byrow = TRUE, dimnames = list(NULL, c("year_inds_ini","year_inds_final")))

  final_mat <- cbind2(flow_mat,flow_year_mat)

  return (final_mat)

}

