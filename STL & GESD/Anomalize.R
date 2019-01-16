library(anomalize)
library(tidyverse)
##df=dataframe created from excel-file containing the data used in the study


ts=tibbletime::as_tbl_time(df,Datum)

remainder=time_decompose(ts,Belopp,frequency = "auto",
                         trend     = "auto", method="stl") 
remainder=anomalize(remainder, remainder, method="gesd", alpha = 0.2, max_anoms = 0.2) 
remainder=time_recompose(remainder)