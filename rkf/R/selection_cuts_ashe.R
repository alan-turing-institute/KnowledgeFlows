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
selection_cuts_ashe <- function(data, cut, cut_name, path_log) {

  file_path <- paste0(path_log,"log_ashe_sample_")

  print ("Summary stats before cuts:")
  run_ashe_sample_summary(data,file_path,"nocuts")

  # subset the data
  data_subset <- subset(data,cut)

  print ("Summary stats after cuts:")
  run_ashe_sample_summary(data_subset,file_path,cut_name)

  return (data_subset)

}
