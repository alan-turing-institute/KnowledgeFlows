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
check_ashe_bres_ratio <- function(ashe, bres, year) {

  unique_codes <- unique(substr(ashe[,'sic07'],1,4))

  #unique_regions <-  unique(ashe['wgor',])
  unique_regions <-  c("south east", "south west", "midderlands","north")

  all_ratios <- list()

  for (u in unique_codes){

    sub_ashe <- ashe[ashe$sic07==u,]
    count_ashe <- nrow(sub_ashe)

    sub_bres <- bres[bres$sic07==u,]
    count_bres <- sum(as.numeric(sub_bres$employment_ya), na.rm = TRUE)

    ratio <- count_ashe/count_bres

    entry_list <- c(u,count_ashe,count_bres,ratio)



    for (reg in unique_regions){

      sub_ashe_reg <- sub_ashe[sub_ashe$wgor==reg,]

      sub_bres_reg <- sub_bres[sub_bres$gor==reg,]

      count_ashe_reg <- nrow(sub_ashe_reg)
      count_bres_reg <- sum(as.numeric(sub_bres_reg$employment_ya), na.rm = TRUE)

      ratio_reg <- count_ashe_reg/count_bres_reg

      reg_list <- c(reg,count_ashe_reg,count_bres_reg,ratio_reg)

      entry_list <-c(unlist(entry_list),unlist(ratio_reg) )



    }

    print (entry_list)

    all_ratios <- rbind(all_ratios,entry_list)



      }


  return (all_ratios)
}

