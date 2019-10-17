#' Create a vector of worker conections
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
worker_conections_matrix <- function(data, id, colname) {

  # get datafram only for the explicit worker
  data_piden <- data[data$piden==id,][c("year",colname,"wpost","empsta","djob","wgor","ft","age","sex","piden")]

  # make sure the resulting dataframe is sorted in ascending order
  data_piden_combinations <- combn(nrow(data_piden),2)

  conections_lists <- list()

  # loop year by year and get transitions between industries into a matrix, record year of transitions.
  for (i in 1:ncol(data_piden_combinations)){

    index_i <- data_piden_combinations[,i][1]
    index_j <- data_piden_combinations[,i][2]

    source_df <- data_piden[index_i,]
    target_dfs <- data_piden[index_j,]

    source_df <- source_df[, ! names(source_df) %in% "sex", drop = F]

    names(source_df) <-c("year_inds_ini","inds_ini","wpost_inds_ini","start_date_inds_ini","double_job_ini","wgor_inds_ini","ft_inds_ini","age_init","piden")
    names(target_dfs) <-c("year_inds_final","inds_final","wpost_inds_final","start_date_inds_final","double_job_final","wgor_inds_final","ft_inds_final","age_final","sex","piden")

    conection_df <- merge(source_df, target_dfs, by = "piden")

    conections_lists <- rbind(conections_lists,conection_df)

  }


  return (conections_lists)

}

