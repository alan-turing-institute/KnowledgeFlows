#' Read a reduced transition matrix and build an ND x ND adjacency matrix
#'#'
#' @param reduced_matrix
#' A matrix
#' @param algorithm
#' The algorithm used to build the matrix (in order to decide symetrisation strategy)
#' @return
#' An updated matrix.
#'
#' @examples
#' \dontrun{
#' fill_industry_transition_matrix_from_reduced <- function(reduced_matrix,algorithm)
#' }
#' @import httr
#' @export
fill_industry_transition_matrix_from_reduced <- function(reduced_matrix,algorithm) {

  # create initial empty transition matrix
  index1 <- reduced_matrix[['StartIndst']]
  index2 <- reduced_matrix[['FinalIndst']]

  index <- unique(c(index1,index2))

  # create the empty matrix
  transition_matrix <- matrix(0, nrow = length(index), ncol = length(index))
  # give the industry name as index for the empty matrix
  dimnames(transition_matrix) <- list(index, index)



  # loop by each industry
  for (flow in 1:nrow(reduced_matrix)) {

    # do not consider industry with "0000"
    if (reduced_matrix[flow,1]=="0000"){
      next()
    }

    # get the industry code for pair
    row_label <- toString(reduced_matrix[flow,1])
    column_label <- toString(reduced_matrix[flow,2])
    # get counts
    count1 <- reduced_matrix[flow,3]

    # check the symetrical case of target-source transitions
    subset_reduced <- subset(reduced_matrix,reduced_matrix$FinalIndst==row_label)
    subset_reduced <- subset(subset_reduced,subset_reduced$StartIndst==column_label)
    count2 <- subset_reduced$Counts

    # in case that only one direction of the flow is found, assume that the other is 10 (because of
    #the statistical disclosure control cuts at 10 counts)
    if (nrow(subset_reduced)==0){
      count2 <- 10
    }

    # different strategies for the FLOWS and CONN algorithm
    if (algorithm=='CONN'){

      # CONN should be sytemtric already, no need of assume the oposite transition
      if (row_label==column_label){
        count2 <- 0
      }
      # assign the counts to the adjacency matrix
      transition_matrix[row_label, column_label] <-  (count1+count2)
      transition_matrix[column_label, row_label] <-  (count1+count2)
    }
    else {

     # assign the counts to the adjacency matrix counts (this is the flow case)
      transition_matrix[row_label, column_label] <-  (count1)
      transition_matrix[column_label, row_label] <-  (count2)


    }

  }

  # return filled matrix
  return (transition_matrix)

}
