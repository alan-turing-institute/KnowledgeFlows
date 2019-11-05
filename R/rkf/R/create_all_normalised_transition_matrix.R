#' Run all steps to create all the normalised worker matrices from the Secure Lab inputs
#'
#' @param input_path
#' The input path where all the secure lab outputs are
#' @param output_path
#' The path where to write the datasets
#' @return
#' No output, all the matrices gets writen in the output directory
#'
#' @examples
#'
#' create_all_normalised_transition_matrix('inputdirectory/','data/')
#'
#' @import httr
#' @export
#'
create_all_normalised_transition_matrix <- function(input_path ="../../",output_path='') {


###### 10 YEAR MATRICES ###########################################

name_2009_2018_flows <- "Table1_Reduced_matrix_2009_2018_flows.csv"
dir_secure_lab <- "securelab_data_outputs/128770_2019_08_23/"
algorithm_flows <- "FLOWS"
reduced_matrix <- read.csv(paste0(input_path,dir_secure_lab,name_2009_2018_flows,sep=''))
normalised_output <- create_normalised_transition_matrix_from_reduced(reduced_matrix,-0.99,algorithm_flows)
write.csv(normalised_output,paste(output_path,name_2009_2018_flows,sep = ""))


name_2009_2018_connections <- "Table2_Reduced_matrix_2009_2018_connections.csv"
dir_secure_lab <- "securelab_data_outputs/128770_2019_08_23/"

algorithm_conn <- "CONN"
reduced_matrix <- read.csv(paste(input_path,dir_secure_lab,name_2009_2018_connections,sep=''))

normalised_output <- create_normalised_transition_matrix_from_reduced(reduced_matrix,-0.99,algorithm_conn)
write.csv(normalised_output,paste(output_path,name_2009_2018_connections,sep=''))


######  MATRICES 1997-2008 ###########################################

name_1997_2008_flows <- "Table1_Reduced_matrix_1997_2008_flows.csv"
dir_secure_lab <- 'securelab_data_outputs/128770_2019_08_29/'

algorithm_flows <- "FLOWS"

reduced_matrix <- read.csv(paste(input_path,dir_secure_lab,name_1997_2008_flows,sep=''))
normalised_output <- create_normalised_transition_matrix_from_reduced(reduced_matrix,-0.99,algorithm_flows,'sic03')
write.csv(normalised_output,paste(output_path,name_1997_2008_flows,sep=''))


name_1997_2008_connections <- "Table2_Reduced_matrix_1997_2008_connections.csv"
dir_secure_lab <- 'securelab_data_outputs/128770_2019_08_29/'
algorithm_conn <- "CONN"
reduced_matrix <- read.csv(paste(input_path,dir_secure_lab,name_1997_2008_connections,sep=''))

normalised_output <- create_normalised_transition_matrix_from_reduced(reduced_matrix,-0.99,algorithm_conn,'sic03')
write.csv(normalised_output,paste(output_path,name_1997_2008_connections,sep=''))


}
