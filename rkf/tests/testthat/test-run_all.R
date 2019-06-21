require(testthat)
context("test_run_all function")

test_that("the run_all function works", {

    input_path_file ="/Users/crangelsmith/PycharmProjects/KnowledgeFlows/rkf/data/ashe_sic_5dig.csv"
    output_path_file ="/Users/crangelsmith/PycharmProjects/KnowledgeFlows/rkf/data/reduced_matrix.csv"
    log_path ="/Users/crangelsmith/PycharmProjects/KnowledgeFlows/rkf/log/"

    colname <- "sic07"
    labelcut <- "piden_morethan_0_and_sjd_not0"
    min_counts <- 6

    sample_df <- read.csv(input_path_file)
    #cuts <- sample$piden>0 & sample$sjd!=0

    # make cuts on inital sample
    selected_sample <- selection_cuts_ashe(ashe_sic_5dig,(ashe_sic_5dig$piden>0 & ashe_sic_5dig$year==2004), labelcut,path)

    run_all(input_path_file,output_path_file,log_path,colname, sample_df["piden"]>0 & sample_df["year"]==2004, labelcut, min_counts)


})
