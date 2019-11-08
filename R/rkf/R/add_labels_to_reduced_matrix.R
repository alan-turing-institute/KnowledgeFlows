#' Augment a reduced matrix with label information and transition counts from original dataset
#'
#' @param reduced_matrix
#' A matrix with 3 columns from industry transitions
#' @param previous_matrix
#' A data frame with the raw counts transition daya
#' @param ind_class
#' The label for the industry classification
#' @return
#' An updated matrix.
#'
#' @examples
#'
#' add_labels_to_reduced_matrix(reduced_matrix,old_matrix,'sic07')
#'
#' @import httr
#' @export
add_labels_to_reduced_matrix <- function(reduced_matrix,previous_matrix,ind_class='sic07') {

  # depending on the industry classification code, choose different industry structure data
  if (ind_class=='sic07'){
    label_matrix <- read.csv('data/sic-industry-structure.csv')
  }
  else {
  label_matrix <- read.csv('data/sic03-industry-structure.csv')
  }

  # loop by each entry in the reduced matrix
  for (flow in 1:nrow(reduced_matrix)) {

   # get source, target industries
   inds1 <- toString(reduced_matrix[flow,1])
   inds2 <- toString(reduced_matrix[flow,2])

   # make sure industries code are 4-digit classification
   inds1_ <- sprintf("%04d",strtoi(reduced_matrix[flow,1]))
   inds2_ <- sprintf("%04d",strtoi(reduced_matrix[flow,2]))

   # in case we get the 0000 code, do nothing
   if (inds1=='0000'){
     next()
   }

   # get counts from the original raw transition data set
   old_matrix_counts <- previous_matrix[previous_matrix$StartIndst==inds1,]
   old_count <- (old_matrix_counts[old_matrix_counts$FinalIndst==inds2,])

   # symetrisize in case only one flow direction exists.
   if (nrow(old_count)==0){
     counts <- 10
   }
   else{
     counts <- old_count$Counts

   }

   # find labels for that entry (subactivity, activity, etc)
   label_subactivity1 <- toString(label_matrix[label_matrix$sic_code==inds1_,]$SubActivity)
   label_subactivity2 <- toString(label_matrix[label_matrix$sic_code==inds2_,]$SubActivity)

   label_mainactivity1 <- toString(label_matrix[label_matrix$sic_code==inds1_,]$MainActivity)
   label_mainactivity2 <- toString(label_matrix[label_matrix$sic_code==inds2_,]$MainActivity)

   label_mainindustry1 <- toString(label_matrix[label_matrix$sic_code==inds1_,]$MainIndustry)
   label_mainindustry2 <- toString(label_matrix[label_matrix$sic_code==inds2_,]$MainIndustry)

   # assign labels to entry
   reduced_matrix[flow,"SubActivity_StartIndst"] <- label_subactivity1
   reduced_matrix[flow,"SubActivity_FinalIndst"] <- label_subactivity2

   reduced_matrix[flow,"MainActivity_StartIndst"] <- label_mainactivity1
   reduced_matrix[flow,"MainActivity_FinalIndst"] <- label_mainactivity2

   reduced_matrix[flow,"MainIndustry_StartIndst"] <- label_mainindustry1
   reduced_matrix[flow,"MainIndustry_FinalIndst"] <- label_mainindustry2

    # assing counts to the entry
   reduced_matrix[flow,"Counts"] <- counts
  }

  # return filled matrix
  return (reduced_matrix)

}
