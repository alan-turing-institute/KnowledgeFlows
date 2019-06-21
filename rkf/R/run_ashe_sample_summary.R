#' Sample summary values
#'
#' TODO: For a particular sample, get all general diagnostics.
#'
#' @param sample
#' A data frame.
#'
#' @return
#' A dictionary
#'
#' @examples
#' \dontrun{
#' run_ashe_sample_summary(sample)
#' }
#' @import httr
#' @export
run_ashe_sample_summary <- function(sample, name = '', selection_cuts = '') {


  # get total number of rows
  n_rows <- nrow(sample)
  print(paste0("Number of entries: ", n_rows))

  # unique workers
  unique_piden <-  nrow(unique(sample["piden"]))
  print(paste0("Number of unique workers: ", unique_piden))

  # entries without workers piden
  missing_piden <-  sum(is.na((sample$piden)))
  print(paste0("Number of entries with missing id for workers: ", missing_piden))

  # female ratio
  female_ratio <-  nrow(sample[sample$Sex==2,])/n_rows
  print(paste0("Ratio of female workers: ", female_ratio))


  # male ratio
  male_ratio <-  nrow(sample[sample$Sex==1,])/n_rows
  print(paste0("Ratio of male workers: ", male_ratio))


  # non declared sex ratio
  print(paste0("Ratio of workers with non-declared gender: ", 1-male_ratio-female_ratio))

  # full time ratio
  fulltime_ratio <-  nrow(sample[sample$Ft==1,])/n_rows
  print(paste0("Ratio of full time workers: ", fulltime_ratio))

  # part time ratio
  parttime_ratio <-  nrow(sample[sample$Ft==2,])/n_rows
  print(paste0("Ratio of part time workers: ", parttime_ratio))


  # non declared full/part time ratio
  print(paste0("Ratio of workers with non-declared full or part time: ", 1-fulltime_ratio-parttime_ratio))

  # permanent work ratio
  permanent_ratio <-  nrow(sample[sample$Pt==1,])/n_rows
  print(paste0("Ratio of full time workers: ", permanent_ratio))

  # temp work ratio
  temp_ratio <-  nrow(sample[sample$Pt==2,])/n_rows
  print(paste0("Ratio of temporary workers: ", temp_ratio))

  # non declared full/part time ratio
  print(paste0("Ratio of workers with non-declared temporary or permanent work: ", 1-permanent_ratio-temp_ratio))

  # unique industries 03
  unique_sic03 <-  nrow(unique(sample["sic03"]))
  print(paste0("Number of unique industries for sic03: ", unique_sic03))

  # unique industries 07
  unique_sic07 <-  nrow(unique(sample["sic07"]))
  print(paste0("Number of unique industries for sic07: ", unique_sic07))

  # unique occupaciones 90
  unique_occ90 <-  nrow(unique(sample["occ90"]))
  print(paste0("Number of unique industries for occ90: ", unique_occ90))

  # unique occupaciones 00
  unique_occ00 <-  nrow(unique(sample["occ00"]))
  print(paste0("Number of unique industries for occ00: ", unique_occ00))

  # unique occupaciones 10
  unique_occ10 <-  nrow(unique(sample["occ10"]))
  print(paste0("Number of unique industries for occ10: ", unique_occ10))

  # Years covered
  years <-  nrow(unique(sample["year"]))
  print(paste0("Number of years covered: ", years))
  print(paste0("From: ", min(sample["year"])))
  print(paste0("to: ", max(sample["year"])))

  # Ratio of workers with more than 1 job
  ratio_more1job <-  nrow(sample[sample$Djob==1,])/n_rows
  print(paste0("Ratio of workers with more than 1 job: ", ratio_more1job))


  # Ratio of workers apprentices
  ratio_app <-  nrow(sample[sample$App==1,])/n_rows
  print(paste0("Ratio of apprentices: ", ratio_app))

#  file_name <- paste0(getwd(),"/log/")
#  file_name <- paste0(file_name,name)
  file_name <- paste0(name,selection_cuts)
  file_name <- paste0(file_name,".txt")

  print(file_name)
  log_con <- file(file_name, 'w')

  cat(format(Sys.time(), "%a %b %d %X %Y"), file = log_con, append=TRUE, sep = "\n")
  cat(paste0('Cuts previously applied to the sample: ',selection_cuts), file = log_con, append=TRUE, sep = "\n")
  cat(paste0("Number of entries: ", n_rows), file = log_con, append=TRUE, sep = "\n")
  cat(paste0("Number of unique workers: ", unique_piden), file = log_con, append=TRUE, sep = "\n")
  cat(paste0("Number of entries with missing id for workers: ", missing_piden), file = log_con, append=TRUE, sep = "\n")
  cat(paste0("Ratio of female workers: ", female_ratio), file = log_con, append=TRUE, sep = "\n")
  cat(paste0("Ratio of male workers: ", male_ratio), file = log_con, append=TRUE, sep = "\n")
  cat(paste0("Ratio of full time workers: ", fulltime_ratio), file = log_con, append=TRUE, sep = "\n")
  cat(paste0("Ratio of part time workers: ", parttime_ratio), file = log_con, append=TRUE, sep = "\n")
  cat(paste0("Ratio of workers with non-declared full or part time: ", 1-fulltime_ratio-parttime_ratio), file = log_con, append=TRUE, sep = "\n")
  cat(paste0("Ratio of full time workers: ", permanent_ratio), file = log_con, append=TRUE, sep = "\n")
  cat(paste0("Ratio of temporary workers: ", temp_ratio), file = log_con, append=TRUE, sep = "\n")
  cat(paste0("Ratio of workers with non-declared temporary or permanent work: ", 1-permanent_ratio-temp_ratio), file = log_con, append=TRUE, sep = "\n")
  cat(paste0("Number of unique industries for sic03: ", unique_sic03), file = log_con, append=TRUE, sep = "\n")
  cat(paste0("Number of unique industries for sic07: ", unique_sic07), file = log_con, append=TRUE, sep = "\n")
  cat(paste0("Number of unique industries for occ90: ", unique_occ90), file = log_con, append=TRUE, sep = "\n")
  cat(paste0("Number of unique industries for occ00: ", unique_occ00), file = log_con, append=TRUE, sep = "\n")
  cat(paste0("Number of unique industries for occ10: ", unique_occ10), file = log_con, append=TRUE, sep = "\n")
  cat(paste0("Number of years covered: ", years), file = log_con, append=TRUE)
  cat(paste0(" from: ", min(sample["year"])), file = log_con, append=TRUE)
  cat(paste0(" to: ", max(sample["year"])), file = log_con, append=TRUE, sep = "\n")
  cat(paste0("Ratio of workers with more than 1 job: ", ratio_more1job), file = log_con, append=TRUE, sep = "\n")
  cat(paste0("Ratio of apprentices: ", ratio_app), file = log_con, append=TRUE, sep = "\n")
  cat(paste0("Ratio of workers with more than 1 job: ", ratio_more1job), file = log_con, append=TRUE, sep = "\n")

  on.exit(close(log_con))

  return(file_name)
}

