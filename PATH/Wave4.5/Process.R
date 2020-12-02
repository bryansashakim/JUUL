### Required packages ###
library(ggplot2); library(dplyr); library(tidyr);library(haven);library(readstata13);library(foreign);library(data.table);library(questionr);library(expss)
#############################
##### Variables to Keep #####   
#############################
wave4.5_vars = c("CASEID","PERSONID","X04R_Y_EVR_ECIG","X04R_Y_EVR_EPRODS","X04R_Y_CUR_EPRODS","X04R_Y_YM0018_V2","X04_YV1945","X04_YV1048_BRAND")
wt4.5_vars = c("CASEID","PERSONID","VARPSU","VARSTRAT","X04_Y_S04WGT")
col_names4.5 = c("CASEID","PERSONID","ever_used_ecig","ever_used_enp","curr_enp_user","grade","brand_enp_usually","brand_enp_usually_last")
col_names_wt4.5 = c("CASEID","PERSONID","VARPSU","VARSTRAT","single_wave4_cohort")
## PROCESS
path = load("/Users/bryankim/Documents/DC/JUUL/PATH/Wave4.5_DATA/DS1002/37786-1002-Data.rda"); weights = load("/Users/bryankim/Documents/DC/JUUL/PATH/Wave4.5_weights/wave4_singlewave/37786-1222-Data.rda")
wave4.5 = data.frame(da37786.1002); rm(da37786.1002)
wt4.5 = data.frame(da37786.1222); rm(da37786.1222)
# Get only variables we want to keep
wave4.5 = wave4.5[,wave4.5_vars]; wt4.5 = wt4.5[,wt4.5_vars]
setnames(wave4.5,new = col_names4.5);setnames(wt4.5,new = col_names_wt4.5)
wave4.5 = full_join(wave4.5,wt4.5,by = "PERSONID")
wave4.5$curr_enp_user = ifelse(wave4.5$curr_enp_user == "(1) 1 = Yes",1,0)
## ADD curr_ecig_user variable
#wave4.5 = wave4.5 %>% mutate(curr_ecig_user = ifelse(Past30_num_ecigs %in% seq(1:30),1,0))

wave4.5 = wave4.5 %>% as.data.table()
write.dta(wave4.5,"/Users/bryankim/Documents/DC/JUUL/PATH/Analysis/wave4point5.dta")
test=read_dta("/Users/bryankim/Documents/DC/JUUL/PATH/Analysis/wave4point5.dta")






