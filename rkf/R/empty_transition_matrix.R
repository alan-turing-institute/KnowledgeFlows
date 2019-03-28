#' Create an empty worker transition matrix
#'
#' TODO: description
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
#' empty_transition_matrix(ashe_sic_5dig, colname = "sic07")
#' }
#' @import httr
#' @export
empty_transition_matrix <- function(data, colname) {

  index <- unique(data[[colname]])

  mat <- matrix(0, nrow = length(index), ncol = length(index))
  dimnames(mat) <- list(index, index)

  return (mat)

}
