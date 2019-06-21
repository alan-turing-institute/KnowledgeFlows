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
selection_cuts_ashe <- function(sample_df, cut, cut_name,path ='') {


  print ("Summary stats before cuts:")
  run_ashe_sample_summary(data,paste0(path,"log_ashe_sample_"),"nocuts")

  # subset the data
  data_subset <- subset(sample_df,cut)
  print ("Summary stats after cuts:")
  run_ashe_sample_summary(data_subset,paste0(path,"log_ashe_sample_"),cut_name)

  return (data_subset)

}
