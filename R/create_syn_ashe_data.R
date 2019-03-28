library(rkf)

create_sync_data <- function() {

  sic07 <- unique(sic03_07_5dig[['SIC.2007_CODE']])

  Year <- c(2004, 2005,2006,2007,2008,2009,2010,2011,2012,2013,2014,2015,2016,2017,2018)

  i <- 0
  for (y in Year){

  for (p in 1:1000){
    i <- i +1
    ashe_sic_5dig[i,"year"] <- y
    ashe_sic_5dig[i,"piden"] <- p

    sic07_value <- sample(sic07,1)
    sic03 <- sic03_07_5dig[sic03_07_5dig$SIC.2007_CODE==sic07_value,]$SIC.2003_CODE

    if (length(sic03)>1){
      sic03<-sic03[1]
    }

    ashe_sic_5dig[i,"sic07"] <- sic07_value
    ashe_sic_5dig[i,"sic03"] <- sic03

  }

  }




}

save(ashe_sic_5dig, "ashe_sic_5dig", file="data/ashe_sic_5dig.rda")
