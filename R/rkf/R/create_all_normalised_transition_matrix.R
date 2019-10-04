#' Run all steps to create all the normalised worker matrices from the secure lab inputs
#'#'
#' @param the input path where all the secure lab outputs are
#' No input
#' @return
#' No output all the matrices get writen in the python/labour_flows_matrix/data/ directory
#'
#' @examples
#' \dontrun{
#' create_normalised_transition_matrix <- function(transition_matrix)
#' }
#' @import httr
#' @export
#'
create_all_normalised_transition_matrix <- function(input_path ="") {

dir.create(paste0(input_path,'python/labour_flows_matrix/data/'))

name_2009_2013_flows <- "secure_lab_outputs/128770_2019_08_05/Table1_Reduced_matrix_2009_2013_flows.csv"
algorithm_flows <- "FLOWS"

tryCatch({
  reduced_matrix <- read.csv(paste0(input_path,name_2009_2013_flows))
  normalised_output <- create_normalised_transition_matrix_from_reduced(reduced_matrix,-0.99,algorithm_flows)
  write.csv(normalised_output,paste0("python/labour_flows_matrix/data/",name_2009_2013_flows))

},
error=function(error_message){
  message(error_message)
}
  )


name_2009_2013_connections <- "secure_lab_outputs/128770_2019_08_05/Table2_Reduced_matrix_2009_2013_connections.csv"
algorithm_conn <- "CONN"
reduced_matrix <- read.csv(paste0(input_path,name_2009_2013_connections))

normalised_output <- create_normalised_transition_matrix_from_reduced(reduced_matrix,-0.99,algorithm_conn)
write.csv(normalised_output,paste0("/Users/crangelsmith/PycharmProjects/KnowledgeFlows/python/labour_flows_matrix/data/",name_2009_2013_connections))


name_2014_2018_flows <- "secure_lab_outputs/128770_2019_08_05/Table3_Reduced_matrix_2014_2018_flows.csv"
algorithm_flows <- "FLOWS"
reduced_matrix <- read.csv(paste0(input_path,name_2014_2018_flows))

normalised_output <- create_normalised_transition_matrix_from_reduced(reduced_matrix,-0.99,algorithm_flows)
write.csv(normalised_output,paste0("/Users/crangelsmith/PycharmProjects/KnowledgeFlows/python/labour_flows_matrix/data/",name_2014_2018_flows))


name_2014_2018_connections <- "Table4_Reduced_matrix_2014_2018_connections.csv"
algorithm_conn <- "CONN"
reduced_matrix <- read.csv(paste0('/Users/crangelsmith/PycharmProjects/KnowledgeFlows/secure_lab_outputs/128770_2019_08_05/',name_2014_2018_connections))

normalised_output <- create_normalised_transition_matrix_from_reduced(reduced_matrix,-0.99,algorithm_conn)
write.csv(normalised_output,paste0("/Users/crangelsmith/PycharmProjects/KnowledgeFlows/python/labour_flows_matrix/data/",name_2014_2018_connections))


###### 10 YEAR MATRICES ###########################################

name_2009_2018_flows <- "Table1_Reduced_matrix_2009_2018_flows.csv"
algorithm_flows <- "FLOWS"
reduced_matrix <- read.csv(paste0('/Users/camilarangelsmith/Code/KnowledgeFlows/secure_lab_outputs/128770_2019_08_23/',name_2009_2018_flows))

normalised_output <- create_normalised_transition_matrix_from_reduced(reduced_matrix,-0.99,algorithm_flows)
write.csv(normalised_output,paste0("/Users/camilarangelsmith/Code/KnowledgeFlows/python/labour_flows_matrix/data/",name_2009_2018_flows))


name_2009_2018_connections <- "Table2_Reduced_matrix_2009_2018_connections.csv"
algorithm_conn <- "CONN"
reduced_matrix <- read.csv(paste0('/Users/camilarangelsmith/Code/KnowledgeFlows/secure_lab_outputs/128770_2019_08_23/',name_2009_2018_connections))

normalised_output <- create_normalised_transition_matrix_from_reduced(reduced_matrix,-0.99,algorithm_conn)
write.csv(normalised_output,paste0("/Users/camilarangelsmith/Code/KnowledgeFlows/python/labour_flows_matrix/data/",name_2009_2018_connections))


###### 10 YEAR MATRICES 1997-2008 ###########################################

name_1997_2008_flows <- "Table1_Reduced_matrix_1997_2008_flows.csv"
algorithm_flows <- "FLOWS"
reduced_matrix <- read.csv(paste0('/Users/crangelsmith/PycharmProjects/KnowledgeFlows/secure_lab_outputs/128770_2019_08_29/',name_1997_2008_flows))

normalised_output <- create_normalised_transition_matrix_from_reduced(reduced_matrix,-0.99,algorithm_flows,'sic03')
write.csv(normalised_output,paste0("/Users/crangelsmith/PycharmProjects/KnowledgeFlows/python/labour_flows_matrix/data/",name_1997_2008_flows))


name_1997_2008_connections <- "Table2_Reduced_matrix_1997_2008_connections.csv"
algorithm_conn <- "CONN"
reduced_matrix <- read.csv(paste0('/Users/crangelsmith/PycharmProjects/KnowledgeFlows/secure_lab_outputs/128770_2019_08_29/',name_1997_2008_connections))

normalised_output <- create_normalised_transition_matrix_from_reduced(reduced_matrix,-0.99,algorithm_conn,'sic03')
write.csv(normalised_output,paste0("/Users/crangelsmith/PycharmProjects/KnowledgeFlows/python/labour_flows_matrix/data/",name_1997_2008_connections))


}
