library(rkf)

create_sync_data <- function() {

  ashe_sic_5dig_new <- data.frame( matrix(NA,ncol = ncol(ashe_sic_5dig), nrow = 15000))
  colnames(ashe_sic_5dig_new) <- colnames(ashe_sic_5dig)

  sic07 <- unique(sic03_07_5dig[['SIC.2007_CODE']])

  Year <- c(2004, 2005,2006,2007,2008,2009,2010,2011,2012,2013,2014,2015,2016,2017,2018)

  i <- 0

  for (p in 1:1000){

  for (y in Year){

    i <- i +1

    ran <- sample(1:10, 1)

    sic <-  ashe_sic_5dig_new[which(ashe_sic_5dig_new$piden==p),]

    ashe_sic_5dig_new[i,"year"] <- y
    ashe_sic_5dig_new[i,"piden"] <- p


    if (ran>7 && nrow(sic)>0){

    print('im here1')

    sic07_value <-  sic[sic$year==y-1,]$sic07
    sic03_value <-  sic[sic$year==y-1,]$sic03

    }
    else{

    sic07_value <- sample(sic07,1)
    sic03_value <- sic03_07_5dig[sic03_07_5dig$SIC.2007_CODE==sic07_value,]$SIC.2003_CODE


    if (length(sic03_value)>1){
      sic03_value<-sic03_value[1]
    }
    }

    ashe_sic_5dig_new[i,"sic07"] <- sic07_value
    ashe_sic_5dig_new[i,"sic03"] <- sic03_value



  }

  }




}

save(ashe_sic_5dig, "ashe_sic_5dig", file="data/ashe_sic_5dig.rda")
