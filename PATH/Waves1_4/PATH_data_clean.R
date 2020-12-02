library(data.table);library(dplyr);library(haven);library(plyr);library(readstata13);library(foreign)

filenames <- list.files("/Users/bryankim/Documents/DC/E-cigarettes/JUUL/PATH", pattern="*1Data.dta", full.names=TRUE)
df_list=lapply(filenames, read_dta)
for (wave in 1) {
  temp = assign(paste("df_","wave",wave,sep=""),df_list[[wave]]);assign(paste("df_","wave",wave,sep=""),temp[,get(eval(paste("wave",wave,"_vars",sep = "")))])
  setnames(get(eval(paste("df_","wave",wave,sep=""))), new = col_names1)
} 
filenames <- list.files("/Users/bryankim/Documents/DC/E-cigarettes/JUUL/PATH", pattern="*2Data.dta", full.names=TRUE)
df_list=lapply(filenames, read_dta)
for (wave in 2) {
  temp = assign(paste("df_","wave",wave,sep=""),df_list[[wave-1]]);assign(paste("df_","wave",wave,sep=""),temp[,get(eval(paste("wave",wave,"_vars",sep = "")))])
  setnames(get(eval(paste("df_","wave",wave,sep=""))), new = col_names2)
} 
filenames <- list.files("/Users/bryankim/Documents/DC/E-cigarettes/JUUL/PATH", pattern="*3Data.dta", full.names=TRUE)
df_list=lapply(filenames, read_dta)
for (wave in 3:4) {
  temp = assign(paste("df_","wave",wave,sep=""),df_list[[wave-2]]);assign(paste("df_","wave",wave,sep=""),temp[,get(eval(paste("wave",wave,"_vars",sep = "")))])
  setnames(get(eval(paste("df_","wave",wave,sep=""))), new = col_names34)
}

# Merge weights for wave 3 and wave 4 (waves 1 & 2 already have weights)
filenames <- list.files("/Users/bryankim/Documents/DC/E-cigarettes/JUUL/PATH/wave34_weights", pattern="*Data.dta", full.names=TRUE)
df_list=lapply(filenames, read_dta)
temp = df_list[[1]]; temp = temp[,c("CASEID","VARPSU","VARSTRAT","R03_Y_SWGT")];df_wave3 = full_join(temp,df_wave3,by = "CASEID")
temp = df_list[[2]]; temp = temp[,c("CASEID","VARPSU","VARSTRAT","R04_Y_C04WGT")]; df_wave4 = full_join(temp,df_wave4,by = "CASEID")

# For wave 2 and 3 and 4 question for ever used e-cig changed, so, create the Ever_Used column using the "ever used electronic nicotine product" questions and "used e-cig" follow up question.
df_wave2$temp = df_wave2$Ever_Used; df_wave3$temp = df_wave3$Ever_Used; df_wave4$temp = df_wave4$Ever_Used # creating temp column equal to "ever used e-cigs"
df_wave2$temp[df_wave2$Ever_Used_Elec_Nic == 2] = 2; df_wave3$temp[df_wave3$Ever_Used_Elec_Nic == 2] = 2; df_wave4$temp[df_wave4$Ever_Used_Elec_Nic == 2] = 2 # replacing people who said no to ever using ENP to "No"
df_wave3$temp[df_wave3$use_12m == 2] = 2; df_wave4$temp[df_wave4$use_12m == 2] = 2 # replacing people who said no to ever use in past 12 months to "No"
df_wave2$temp[df_wave2$heard_ecigs == 2] = 2; df_wave3$temp[df_wave3$heard_ecigs == 2] = 2; df_wave4$temp[df_wave4$heard_ecigs == 2] = 2 # replacing people who said no to ever using ENP to "No"

#df_wave3$temp[df_wave3$Ever_Used_Elec_Nic == -1] = -1; df_wave4$temp[df_wave4$Ever_Used_Elec_Nic == -1] = -1 # replacing people who are inapplicable in "ever used ENP" question to inapplicable
df_wave2$temp[df_wave2$Ever_Used == 2] = 2; df_wave3$temp[df_wave3$Ever_Used == 2] = 2; df_wave4$temp[df_wave4$Ever_Used == 2] = 2 # replacing people said no to ever using e-cig to no.
df_wave2$temp[df_wave2$Ever_Used == -1] = 2; df_wave3$temp[df_wave3$Ever_Used == -1] = 2; df_wave4$temp[df_wave4$Ever_Used == -1] = 2 # replacing people said no to ever using ENP to no.
colnames(df_wave2)[length(colnames(df_wave2))] = "Ever_Used_ECIGS"; colnames(df_wave3)[length(colnames(df_wave3))] = "Ever_Used_ECIGS"; colnames(df_wave4)[length(colnames(df_wave4))] = "Ever_Used_ECIGS"

# Changing -9 to NA as per the codebook
df_wave1[df_wave1 == -1] = NA;df_wave2[df_wave2 == -1] = NA;df_wave3[df_wave3 == -1] = NA;df_wave4[df_wave4 == -1] = NA

# SAVE .DTA FILES
write.dta(df_wave1, "/Users/bryankim/Documents/DC/E-cigarettes/JUUL/PATH/Analysis/wave1.dta")
write.dta(df_wave2, "/Users/bryankim/Documents/DC/E-cigarettes/JUUL/PATH/Analysis/wave2.dta")
write.dta(df_wave3, "/Users/bryankim/Documents/DC/E-cigarettes/JUUL/PATH/Analysis/wave3.dta")
write.dta(df_wave4, "/Users/bryankim/Documents/DC/E-cigarettes/JUUL/PATH/Analysis/wave4.dta")
df = rbind.fill(df_wave1,df_wave2,df_wave3,df_wave4)

# POOL "USE E-CIGS BECAUSE:"... variables
df_wave1$reason = 99
df_wave1$reason[df_wave1$`Use e-cigarettes because: They are affordable` == 1] = 1
df_wave1$reason[df_wave1$`Use e-cigarettes because: They can be used in places where smoking cigarettes is not allowed` == 1] = 2
df_wave1$reason[df_wave1$`Use e-cigarettes because: They might be less harmful to me than cigarettes` == 1] = 3











