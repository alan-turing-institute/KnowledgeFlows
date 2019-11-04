#' Run all steps to create all the normalised worker matrices from the secure lab inputs
#'#'
#' @param the input path where all the secure lab outputs are
#' No input
#' @return
#' No output all the matrices get writen in the python/labour_flows_matrix/data/ directory
#'
#' @examples
#' \dontrun{
#' create_all_normalised_transition_matrix <- function(input_path)
#' }
#' @import httr
#' @export
#'
create_all_normalised_transition_matrix <- function(input_path ="") {


###### 10 YEAR MATRICES ###########################################

name_2009_2018_flows <- "Table1_Reduced_matrix_2009_2018_flows.csv"
dir_secure_lab <- "securelab_data_outputs/128770_2019_08_23/"
algorithm_flows <- "FLOWS"
reduced_matrix <- read.csv(paste0(input_path,dir_secure_lab,name_2009_2018_flows,sep=''))
normalised_output <- create_normalised_transition_matrix_from_reduced(reduced_matrix,-0.99,algorithm_flows)
write.csv(normalised_output,paste(input_path,"python/labour_flows_matrix/data/",name_2009_2018_flows,sep = ""))


name_2009_2018_connections <- "Table2_Reduced_matrix_2009_2018_connections.csv"
dir_secure_lab <- "securelab_data_outputs/128770_2019_08_23/"

algorithm_conn <- "CONN"
reduced_matrix <- read.csv(paste(input_path,dir_secure_lab,name_2009_2018_connections,sep=''))

normalised_output <- create_normalised_transition_matrix_from_reduced(reduced_matrix,-0.99,algorithm_conn)
write.csv(normalised_output,paste(input_path,"python/labour_flows_matrix/data/",name_2009_2018_connections,sep=''))


######  MATRICES 1997-2008 ###########################################

name_1997_2008_flows <- "Table1_Reduced_matrix_1997_2008_flows.csv"
dir_secure_lab <- 'securelab_data_outputs/128770_2019_08_29/'

algorithm_flows <- "FLOWS"

reduced_matrix <- read.csv(paste(input_path,dir_secure_lab,name_1997_2008_flows,sep=''))
normalised_output <- create_normalised_transition_matrix_from_reduced(reduced_matrix,-0.99,algorithm_flows,'sic03')
write.csv(normalised_output,paste(input_path,"python/labour_flows_matrix/data/",name_1997_2008_flows,sep=''))



name_1997_2008_connections <- "Table2_Reduced_matrix_1997_2008_connections.csv"
dir_secure_lab <- 'securelab_data_outputs/128770_2019_08_29/'
algorithm_conn <- "CONN"
reduced_matrix <- read.csv(paste(input_path,dir_secure_lab,name_1997_2008_connections,sep=''))

normalised_output <- create_normalised_transition_matrix_from_reduced(reduced_matrix,-0.99,algorithm_conn,'sic03')
write.csv(normalised_output,paste(input_path,"python/labour_flows_matrix/data/",name_1997_2008_connections,sep=''))


}
