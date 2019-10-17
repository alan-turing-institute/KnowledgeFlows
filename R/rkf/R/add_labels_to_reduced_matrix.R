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
add_labels_to_reduced_matrix <- function(reduced_matrix,old_matrix,sic='sic07') {

  if (sic=='sic07'){
    label_matrix <- read.csv('data/sic-industry-structure.csv')
  }
  else {
  label_matrix <- read.csv('data/sic03-industry-structure.csv')
  }

  # create initial empty transition matrix

  # loop by workers
  for (flow in 1:nrow(reduced_matrix)) {

   inds1 <- toString(reduced_matrix[flow,1])
   inds2 <- toString(reduced_matrix[flow,2])

   inds1_ <- sprintf("%04d",strtoi(reduced_matrix[flow,1]))
   inds2_ <- sprintf("%04d",strtoi(reduced_matrix[flow,2]))

   if (inds1=='0000'){
     next()
   }

   old_matrix_counts <- old_matrix[old_matrix$StartIndst==inds1,]
   old_count <- (old_matrix_counts[old_matrix_counts$FinalIndst==inds2,])

   if (nrow(old_count)==0){
     counts <- 10

   }
   else{
     counts <- old_count$Counts
   }

   label_subactivity1 <- toString(label_matrix[label_matrix$sic_code==inds1_,]$SubActivity)
   label_subactivity2 <- toString(label_matrix[label_matrix$sic_code==inds2_,]$SubActivity)

   label_mainactivity1 <- toString(label_matrix[label_matrix$sic_code==inds1_,]$MainActivity)
   label_mainactivity2 <- toString(label_matrix[label_matrix$sic_code==inds2_,]$MainActivity)

   label_mainindustry1 <- toString(label_matrix[label_matrix$sic_code==inds1_,]$MainIndustry)
   label_mainindustry2 <- toString(label_matrix[label_matrix$sic_code==inds2_,]$MainIndustry)

   reduced_matrix[flow,"SubActivity_StartIndst"] <- label_subactivity1
   reduced_matrix[flow,"SubActivity_FinalIndst"] <- label_subactivity2

   reduced_matrix[flow,"MainActivity_StartIndst"] <- label_mainactivity1
   reduced_matrix[flow,"MainActivity_FinalIndst"] <- label_mainactivity2

   reduced_matrix[flow,"MainIndustry_StartIndst"] <- label_mainindustry1
   reduced_matrix[flow,"MainIndustry_FinalIndst"] <- label_mainindustry2


   reduced_matrix[flow,"Counts"] <- counts
  }

  # return filled matrix
  return (reduced_matrix)

}
