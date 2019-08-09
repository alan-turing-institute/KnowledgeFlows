#' Run all steps to create a filled worker matrix
#'#'
#' @param reduced_matrix
#' A matrix
#' @param industry_data
#' A data frame wit the indusry classification.
#' @param ind_class
#' The label for the industry classification
#' @return
#' An updated matrix.
#'
#' @examples
#' \dontrun{
#' fill_industry_transition_matrix_from_reduced <- function(sample, cuts, cutsName,indClass)
#' }
#' @import httr
#' @export
fill_symetric_industry_transition_matrix_from_reduced <- function(reduced_matrix,algorithm) {

  # create initial empty transition matrix
  index1 <- reduced_matrix[['StartIndst']]
  index2 <- reduced_matrix[['FinalIndst']]

  index <- unique(c(index1,index2))

  # create the empty matrix
  transition_matrix <- matrix(0, nrow = length(index), ncol = length(index))
  # give the industry name as index for the empty matrix
  dimnames(transition_matrix) <- list(index, index)



  # loop by workers
  for (flow in 1:nrow(reduced_matrix)) {

    if (reduced_matrix[flow,1]=="0000"){
      next()
    }

    row_label <- toString(reduced_matrix[flow,1])
    column_label <- toString(reduced_matrix[flow,2])
    count1 <- reduced_matrix[flow,3]

    subset_reduced <- subset(reduced_matrix,reduced_matrix$FinalIndst==row_label)
    subset_reduced <- subset(subset_reduced,subset_reduced$StartIndst==column_label)

    count2 <- subset_reduced$Counts

    if (algorithm=='CONN'){

      if (nrow(subset_reduced)==0 || (row_label==column_label)){
        count2 <- 0
      }


      transition_matrix[row_label, column_label] <-  (count1+count2)
      transition_matrix[column_label, row_label] <-  (count1+count2)
    }
    else {
      transition_matrix[row_label, column_label] <-  (count1)

      transition_matrix[row_label, column_label] <-  (count1+count2)/2
      transition_matrix[column_label, row_label] <-  (count1+count2)/2

    }

  }

  # return filled matrix
  return (transition_matrix)

}
