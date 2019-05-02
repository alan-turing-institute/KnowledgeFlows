#' Selection cut function for ASHE dataset
#'
#' TODO: Produce a empty matrix for all industry classification
#'
#' @param data
#' A data frame.
#' @param cut string
#' The selection cut requested.
#'
#' @return
#' A data frame.
#'
#' @examples
#' \dontrun{
#' selection_custs_ashe(ashe_sic_5dig, piden>1 && sex=="F")
#' }
#' @import httr
#' @export
selection_custs_ashe <- function(data, cut) {

  print ("Summary stats before cuts:")
  run_ashe_sample_summary(data)

  # subset the data
  data_subset <- subset(data,cut)

  run_ashe_sample_summary(data,paste0("selection/log_ashe_ashe_sic_5dig_",toString(cut)),toString(cut))

  return (data_subset)

}
