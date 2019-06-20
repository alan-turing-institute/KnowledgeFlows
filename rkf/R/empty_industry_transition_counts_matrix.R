#' Create an empty industry transition counts matrix
#'
#' TODO: Produce a empty matrix for all industry classification
#'
#' @param data
#' A data frame.
#' @param colname
#' The name of the industry code column in the data.
#'
#' @return
#' An empty matrix.
#'
#' @examples
#' \dontrun{
#' empty_industry_transition_counts_matrix(ashe_sic_5dig, colname = "sic07")
#' }
#' @import httr
#' @export
empty_industry_transition_counts_matrix <- function(data) {

  config <- config::get()

  colname <- config$industry_var
  # get the industry codes
  index <- unique(data[[colname]])

  # create the empty matrix
  mat <- matrix(0, nrow = length(index), ncol = length(index))
  # give the industry name as index for the empty matrix
  dimnames(mat) <- list(index, index)

  return (mat)

}
