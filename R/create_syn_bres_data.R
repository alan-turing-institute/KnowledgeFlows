library(rkf)

create_sync_bres_data <- function() {

  bres_df <- read.csv(file= "/Users/crangelsmith/Desktop/bres_labels.csv", sep = ",")

  bres_sic_5dig_new <- data.frame( matrix(NA,ncol = ncol(bres_df), nrow = 15000))
  colnames(bres_sic_5dig_new) =colnames(bres_df)

  sic07 <- unique(sic03_07_5dig[['SIC.2007_CODE']])



  for (i in 1:1000){



      sic07_value <- sample(sic07,1)
      sic03_value <- sic03_07_5dig[sic03_07_5dig$SIC.2007_CODE==sic07_value,]$SIC.2003_CODE


      if (length(sic03_value)>1){
        sic03_value<-sic03_value[1]
      }


      bres_sic_5dig_new[i,"sic2007"] <- sic07_value
      bres_sic_5dig_new[i,"sic2003"] <- sic03_value
      bres_sic_5dig_new[i,"employees"] <- sample(1000,1)






}

save(bres_sic_5dig_new, "bres_sic_5dig_new", file="data/bres_sic_5dig.rda")
}
