require(testthat)
context("test_run_all function")

test_that("the run_all function works", {

    input_path_file ="/Users/crangelsmith/PycharmProjects/KnowledgeFlows/rkf/data/ashe_sic_5dig.csv"
    output_path_file ="/Users/crangelsmith/PycharmProjects/KnowledgeFlows/rkf/data/reduced_matrix.csv"
    log_path ="/Users/crangelsmith/PycharmProjects/KnowledgeFlows/rkf/tests/testthat/log/"
    colname <- "sic07"
    labelcut <- "piden_morethan_0_and_sjd_not0"
    min_counts <- 1

    data <- read.csv(input_path_file)

    data <- selection_cuts_ashe(data, (data$piden>0 & data$year>2008), labelcut, log_path)

    run_all(data, output_path_file, colname, min_counts)

    expect_true(file.exists(output_path_file))

})
