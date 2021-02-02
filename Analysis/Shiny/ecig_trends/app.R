library(shiny)
library(shinydashboard)
library(ggplot2)
library(dplyr)
library(haven)
#load data
# setwd("/Users/bryankim/Documents/DC/JUUL/Analysis/MTF analysis/Shiny/ecig_trends/")
# df1=read_dta("8th_all_yrs.dta")
# df2=read_dta("10th_all_yrs.dta")
# df3=read_dta("12th_all_yrs.dta")
# # df_r = rbind.fill(df1,df2,df3)
# df_r=read_dta("mtf_all_grades_plot.dta")

df1=read_dta("8th_all_yrs.dta")
df2=read_dta("10th_all_yrs.dta")
df3=read_dta("12th_all_yrs.dta")
df_r=read_dta("mtf_all_grades_plot.dta")

## ALL by school Grade 
df_gradeall = df_r %>% group_by(V1,grade) %>% 
    dplyr::summarize(m = weighted.mean(curr,V5)) %>% 
    filter(grade > 0)
df_gradeall$group[df_gradeall$grade==8]="8th Grade";df_gradeall$group[df_gradeall$grade==10]="10th Grade";df_gradeall$group[df_gradeall$grade==12]="12th Grade"

plotgrade1 = ggplot(df_gradeall,aes(x=V1,y=m,colour=group)) +
    geom_line(size=0.72) +
    scale_color_manual(values=c("red","green","blue")) +
    xlim(2014, 2019)+
    xlab("Year") +
    ylab("% current e-cigarette smoker") +
    ggtitle("All grades: current e-cigarette trends by grade") +
    theme_minimal()
# plotgrade1

# By race
## ALL by GRADES

df_rall = df_r %>% group_by(V1,race) %>% 
    dplyr::summarize(m = weighted.mean(curr,V5)) %>% 
    filter(race > 0)
df_rall$group[df_rall$race==1]="Black";df_rall$group[df_rall$race==2]="White";df_rall$group[df_rall$race==3]="Hispanic"

plotr1 = ggplot(df_rall,aes(x=V1,y=m,colour=group,shape=group)) +
    geom_line(size=0.72) +
    scale_color_manual(labels=c("Black","White","Hispanic"),values=c("red","green","blue")) +
    xlim(2014, 2019)+
    xlab("Year") +
    ylab("% current e-cigarette smoker") +
    ggtitle("All grades: current e-cigarette trends by race") +
    scale_y_continuous(labels = scales::percent,breaks=seq(0, .40, .05), limits=c(0, .40)) +
    theme_minimal()
# plotr1

# 8th Grade
df_r8 = df1 %>% group_by(V1,race) %>% 
    dplyr::summarize(m = weighted.mean(curr,V5)) %>% 
    filter(race > 0)
df_r8$group[df_r8$race==1]="Black";df_r8$group[df_r8$race==2]="White";df_r8$group[df_r8$race==3]="Hispanic"

plotr8 = ggplot(df_r8,aes(x=V1,y=m,colour=group,shape=group)) +
    geom_line(size=0.72) +
    scale_color_manual(values=c("red","green","blue")) +
    xlim(2014, 2019)+
    xlab("Year") +
    ylab("% current e-cigarette smoker") +
    ggtitle("8th grade: current e-cigarette trends by race") +
    scale_y_continuous(labels = scales::percent,breaks=seq(0, .40, .05), limits=c(0, .40)) +
    theme_minimal()
# plotr8

# 10th Grade
df_r10 = df2 %>% group_by(V1,race) %>% 
    dplyr::summarize(m = weighted.mean(curr,V5)) %>% 
    filter(race > 0)
df_r10$group[df_r10$race==1]="Black";df_r10$group[df_r10$race==2]="White";df_r10$group[df_r10$race==3]="Hispanic"

plotr10 = ggplot(df_r10,aes(x=V1,y=m,colour=group,shape=group)) +
    geom_line(size=0.72) +
    scale_color_manual(values=c("red","green","blue")) +
    xlim(2014, 2019)+
    xlab("Year") +
    ylab("% current e-cigarette smoker") +
    ggtitle("10th grade: current e-cigarette trends by race") +
    scale_y_continuous(labels = scales::percent,breaks=seq(0, .40, .05), limits=c(0, .40)) +
    theme_minimal()
# plotr10

# 12th Grade
df_r12 = df3 %>% group_by(V1,race) %>% 
    dplyr::summarize(m = weighted.mean(curr,V5)) %>% 
    filter(race > 0)
df_r12$group[df_r12$race==1]="Black";df_r12$group[df_r12$race==2]="White";df_r12$group[df_r12$race==3]="Hispanic"

plotr12 = ggplot(df_r12,aes(x=V1,y=m,colour=group,shape=group)) +
    geom_line(size=0.72) +
    scale_color_manual(values=c("red","green","blue")) +
    xlim(2014, 2019)+
    xlab("Year") +
    ylab("% current e-cigarette smoker") +
    ggtitle("12th grade: current e-cigarette trends by race") +
    scale_y_continuous(labels = scales::percent,breaks=seq(0, .40, .05), limits=c(0, .40)) +
    theme_minimal()
# plotr12



# By sex

## ALL by Sex
df_sall = df_r %>% group_by(V1,sex) %>% 
    dplyr::summarize(m = weighted.mean(curr,V5)) %>% 
    filter(sex > 0)
df_sall$group[df_sall$sex==1]="Male";df_sall$group[df_sall$sex==2]="Female"

plots1 = ggplot(df_sall,aes(x=V1,y=m,colour=group,shape=group)) +
    geom_line(size=0.72) +
    scale_color_manual(values=c("red","green")) +
    xlim(2014, 2019)+
    xlab("Year") +
    ylab("% current e-cigarette smoker") +
    ggtitle("All grades: current e-cigarette trends by sex") +
    scale_y_continuous(labels = scales::percent,breaks=seq(0, .40, .05), limits=c(0, .40)) +
    theme_minimal()
# plots1

# 8th Grade
df_s8 = df1 %>% group_by(V1,sex) %>% 
    dplyr::summarize(m = weighted.mean(curr,V5)) %>% 
    filter(sex > 0)
df_s8$group[df_s8$sex==1]="Male";df_s8$group[df_s8$sex==2]="Female"

plots8 = ggplot(df_s8,aes(x=V1,y=m,colour=group,shape=group)) +
    geom_line(size=0.72) +
    scale_color_manual(values=c("red","green")) +
    xlim(2014, 2019)+
    xlab("Year") +
    ylab("% current e-cigarette smoker") +
    ggtitle("8th grade: current e-cigarette trends by sex") +
    scale_y_continuous(labels = scales::percent,breaks=seq(0, .40, .05), limits=c(0, .40)) +
    theme_minimal()
# plots8

# 10th Grade
df_s10 = df2 %>% group_by(V1,sex) %>% 
    dplyr::summarize(m = weighted.mean(curr,V5)) %>% 
    filter(sex > 0)
df_s10$group[df_s10$sex==1]="Male";df_s10$group[df_s10$sex==2]="Female"

plots10 = ggplot(df_s10,aes(x=V1,y=m,colour=group,shape=group)) +
    geom_line(size=0.72) +
    scale_color_manual(values=c("red","green")) +
    xlim(2014, 2019)+
    xlab("Year") +
    ylab("% current e-cigarette smoker") +
    ggtitle("10th grade: current e-cigarette trends by sex") +
    scale_y_continuous(labels = scales::percent,breaks=seq(0, .40, .05), limits=c(0, .40)) +
    theme_minimal()
# plots10

# 12th Grade
df_s12 = df3 %>% group_by(V1,sex) %>% 
    dplyr::summarize(m = weighted.mean(curr,V5)) %>% 
    filter(sex > 0)
df_s12$group[df_s12$sex==1]="Male";df_s12$group[df_s12$sex==2]="Female"

plots12 = ggplot(df_s12,aes(x=V1,y=m,colour=group,shape=group)) +
    geom_line(size=0.72) +
    scale_color_manual(values=c("red","green")) +
    xlim(2014, 2019)+
    xlab("Year") +
    ylab("% current e-cigarette smoker") +
    ggtitle("12th grade: current e-cigarette trends by sex") +
    scale_y_continuous(labels = scales::percent,breaks=seq(0, .40, .05), limits=c(0, .40)) +
    theme_minimal()
# plots12


# By geography

## ALL by geography
df_gall = df_r %>% group_by(V1,where_live_now) %>% 
    dplyr::summarize(m = weighted.mean(curr,V5)) %>% 
    filter(where_live_now > 0)
df_gall$group[df_gall$where_live_now==1]="Farm";df_gall$group[df_gall$where_live_now==2]="Country";df_gall$group[df_gall$where_live_now==3]="City"

plotg1 = ggplot(df_gall,aes(x=V1,y=m,colour=group,shape=group)) +
    geom_line(size=0.72) +
    scale_color_manual(values=c("red","green","blue")) +
    xlim(2014, 2019)+
    xlab("Year") +
    ylab("% current e-cigarette smoker") +
    ggtitle("All grades: current e-cigarette trends by where respondent's live") +
    scale_y_continuous(labels = scales::percent,breaks=seq(0, 0.45, .05), limits=c(0, 0.45)) +
    theme_minimal()
# plotg1

# 8th Grade
df_g8 = df1 %>% group_by(V1,where_live_now) %>% 
    dplyr::summarize(m = weighted.mean(curr,V5)) %>% 
    filter(where_live_now > 0)
df_g8$group[df_g8$where_live_now==1]="Farm";df_g8$group[df_g8$where_live_now==2]="Country";df_g8$group[df_g8$where_live_now==3]="City"

plotg8 = ggplot(df_g8,aes(x=V1,y=m,colour=group,shape=group)) +
    geom_line(size=0.72) +
    scale_color_manual(values=c("red","green","blue")) +
    xlim(2014, 2019)+
    xlab("Year") +
    ylab("% current e-cigarette smoker") +
    ggtitle("8th grade: current e-cigarette trends by where respondent lives") +
    scale_y_continuous(labels = scales::percent,breaks=seq(0, 0.45, .05), limits=c(0, 0.45)) +
    theme_minimal()
# plotg8

# 10th Grade
df_g10 = df2 %>% group_by(V1,where_live_now) %>% 
    dplyr::summarize(m = weighted.mean(curr,V5)) %>% 
    filter(where_live_now > 0)
df_g10$group[df_g10$where_live_now==1]="Farm";df_g10$group[df_g10$where_live_now==2]="Country";df_g10$group[df_g10$where_live_now==3]="City"

plotg10 = ggplot(df_g10,aes(x=V1,y=m,colour=group,shape=group)) +
    geom_line(size=0.72) +
    scale_color_manual(values=c("red","green","blue")) +
    xlim(2014, 2019)+
    xlab("Year") +
    ylab("% current e-cigarette smoker") +
    ggtitle("10th grade: current e-cigarette trends by where respondent lives") +
    scale_y_continuous(labels = scales::percent,breaks=seq(0, 0.45, .05), limits=c(0, 0.45)) +
    theme_minimal()
# plotg10

# 12th Grade
df_g12 = df3 %>% group_by(V1,where_live_now) %>% 
    dplyr::summarize(m = weighted.mean(curr,V5)) %>% 
    filter(where_live_now > 0)
df_g12$group[df_g12$where_live_now==1]="Farm";df_g12$group[df_g12$where_live_now==2]="Country";df_g12$group[df_g12$where_live_now==3]="City"

plotg12 = ggplot(df_g12,aes(x=V1,y=m,colour=group,shape=group)) +
    geom_line(size=0.72) +
    scale_color_manual(values=c("red","green","blue")) +
    xlim(2014, 2019)+
    xlab("Year") +
    ylab("% current e-cigarette smoker") +
    ggtitle("12th grade: current e-cigarette trends by where respondent lives") +
    scale_y_continuous(labels = scales::percent,breaks=seq(0, 0.45, .05), limits=c(0, 0.45)) +
    theme_minimal()
# plotg12


## ALL by grade performancee
df_gpall = df_r %>% group_by(V1,grade_perf) %>% 
    dplyr::summarize(m = weighted.mean(curr,V5)) %>% 
    filter(grade_perf > 0)
df_gpall$group[df_gpall$grade_perf==1]="D";df_gpall$group[df_gpall$grade_perf==2]="C-";df_gpall$group[df_gpall$grade_perf==3]="C";df_gpall$group[df_gpall$grade_perf==4]="C+";df_gpall$group[df_gpall$grade_perf==5]="B-";df_gpall$group[df_gpall$grade_perf==6]="B";df_gpall$group[df_gpall$grade_perf==7]="B+";df_gpall$group[df_gpall$grade_perf==8]="A-";df_gpall$group[df_gpall$grade_perf==9]="A"

plotgp1 = ggplot(df_gpall,aes(x=V1,y=m,colour=group)) +
    geom_line(size=0.72) +
    scale_color_manual(values=c("red","green","blue","orange","pink","yellow","ivory","turquoise","purple")) +
    xlim(2014, 2019)+
    xlab("Year") +
    ylab("% current e-cigarette smoker") +
    ggtitle("All grades: current e-cigarette trends by high school grade performance") +
    scale_y_continuous(labels = scales::percent,breaks=seq(0, 0.45, .05), limits=c(0, 0.45)) +
    theme_minimal()
# plotgp1

# 8th Grade
df_gp8 = df1 %>% group_by(V1,grade_perf) %>% 
    dplyr::summarize(m = weighted.mean(curr,V5)) %>% 
    filter(grade_perf > 0)
df_gp8$group[df_gp8$grade_perf==1]="D";df_gp8$group[df_gp8$grade_perf==2]="C-";df_gp8$group[df_gp8$grade_perf==3]="C";df_gp8$group[df_gp8$grade_perf==4]="C+";df_gp8$group[df_gp8$grade_perf==5]="B-";df_gp8$group[df_gp8$grade_perf==6]="B";df_gp8$group[df_gp8$grade_perf==7]="B+";df_gp8$group[df_gp8$grade_perf==8]="A-";df_gp8$group[df_gp8$grade_perf==9]="A"

plotgp8 = ggplot(df_gp8,aes(x=V1,y=m,colour=group,shape=group)) +
    geom_line(size=0.72) +
    scale_color_manual(values=c("red","green","blue","orange","pink","yellow","ivory","turquoise","purple")) +
    xlim(2014, 2019)+
    xlab("Year") +
    ylab("% current e-cigarette smoker") +
    ggtitle("8th grade: current e-cigarette trends by high school grade performance") +
    scale_y_continuous(labels = scales::percent,breaks=seq(0, 0.45, .05), limits=c(0, 0.45)) +
    theme_minimal()
# plotgp8

# 10th Grade
df_gp10 = df2 %>% group_by(V1,grade_perf) %>% 
    dplyr::summarize(m = weighted.mean(curr,V5)) %>% 
    filter(grade_perf > 0)
df_gp10$group[df_gp10$grade_perf==1]="D";df_gp10$group[df_gp10$grade_perf==2]="C-";df_gp10$group[df_gp10$grade_perf==3]="C";df_gp10$group[df_gp10$grade_perf==4]="C+";df_gp10$group[df_gp10$grade_perf==5]="B-";df_gp10$group[df_gp10$grade_perf==6]="B";df_gp10$group[df_gp10$grade_perf==7]="B+";df_gp10$group[df_gp10$grade_perf==8]="A-";df_gp10$group[df_gp10$grade_perf==9]="A"

plotgp10 = ggplot(df_gp10,aes(x=V1,y=m,colour=group,shape=group)) +
    geom_line(size=0.72) +
    scale_color_manual(values=c("red","green","blue","orange","pink","yellow","ivory","turquoise","purple")) +
    xlim(2014, 2019)+
    xlab("Year") +
    ylab("% current e-cigarette smoker") +
    ggtitle("10th grade: current e-cigarette trends by high school grade performance") +
    scale_y_continuous(labels = scales::percent,breaks=seq(0, 0.45, .05), limits=c(0, 0.45)) +
    theme_minimal()
# plotgp10

# 12th Grade
df_gp12 = df3 %>% group_by(V1,grade_perf) %>% 
    dplyr::summarize(m = weighted.mean(curr,V5)) %>% 
    filter(grade_perf > 0)
df_gp12$group[df_gp12$grade_perf==1]="D";df_gp12$group[df_gp12$grade_perf==2]="C-";df_gp12$group[df_gp12$grade_perf==3]="C";df_gp12$group[df_gp12$grade_perf==4]="C+";df_gp12$group[df_gp12$grade_perf==5]="B-";df_gp12$group[df_gp12$grade_perf==6]="B";df_gp12$group[df_gp12$grade_perf==7]="B+";df_gp12$group[df_gp12$grade_perf==8]="A-";df_gp12$group[df_gp12$grade_perf==9]="A"

plotgp12 = ggplot(df_gp12,aes(x=V1,y=m,colour=group,shape=group)) +
    geom_line(size=0.72) +
    scale_color_manual(values=c("red","green","blue","orange","pink","yellow","ivory","turquoise","purple")) +
    xlim(2014, 2019)+
    xlab("Year") +
    ylab("% current e-cigarette smoker") +
    ggtitle("12th grade: current e-cigarette trends by high school grade performance") +
    scale_y_continuous(labels = scales::percent,breaks=seq(0, 0.45, .05), limits=c(0, 0.45)) +
    theme_minimal()
# plotgp12


## ALL by meduc 
df_meducall = df_r %>% group_by(V1,meduc) %>% 
    dplyr::summarize(m = weighted.mean(curr,V5)) %>% 
    filter(meduc > 0)
df_meducall$group[df_meducall$meduc==1]="Grade School";df_meducall$group[df_meducall$meduc==2]="Some HS";df_meducall$group[df_meducall$meduc==3]="HS Grad";df_meducall$group[df_meducall$meduc==4]="Some college";df_meducall$group[df_meducall$meduc==5]="College Grad";df_meducall$group[df_meducall$meduc==6]="Grad School"

plotmeduc1 = ggplot(df_meducall,aes(x=V1,y=m,colour=group)) +
    geom_line(size=0.72) +
    scale_color_manual(values=c("red","green","blue","orange","pink","yellow")) +
    xlim(2014, 2019)+
    xlab("Year") +
    ylab("% current e-cigarette smoker") +
    ggtitle("All grades: current e-cigarette trends by mother's education") +
    scale_y_continuous(labels = scales::percent,breaks=seq(0, .40, .05), limits=c(0, .40)) +
    theme_minimal()
# plotmeduc1

# 8th Grade
df_meduc8 = df1 %>% group_by(V1,meduc) %>% 
    dplyr::summarize(m = weighted.mean(curr,V5)) %>% 
    filter(meduc > 0)
df_meduc8$group[df_meduc8$meduc==1]="Grade School";df_meduc8$group[df_meduc8$meduc==2]="Some HS";df_meduc8$group[df_meduc8$meduc==3]="HS Grad";df_meduc8$group[df_meduc8$meduc==4]="Some college";df_meduc8$group[df_meduc8$meduc==5]="College Grad";df_meduc8$group[df_meduc8$meduc==6]="Grad School"

plotmeduc8 = ggplot(df_meduc8,aes(x=V1,y=m,colour=group,shape=group)) +
    geom_line(size=0.72) +
    scale_color_manual(values=c("red","green","blue","orange","pink","yellow")) +
    xlim(2014, 2019)+
    xlab("Year") +
    ylab("% current e-cigarette smoker") +
    ggtitle("8th grade: current e-cigarette trends by mother's education") +
    scale_y_continuous(labels = scales::percent,breaks=seq(0, .40, .05), limits=c(0, .40)) +
    theme_minimal()
# plotmeduc8

# 10th Grade
df_meduc10 = df2 %>% group_by(V1,meduc) %>% 
    dplyr::summarize(m = weighted.mean(curr,V5)) %>% 
    filter(meduc > 0)
df_meduc10$group[df_meduc10$meduc==1]="Grade School";df_meduc10$group[df_meduc10$meduc==2]="Some HS";df_meduc10$group[df_meduc10$meduc==3]="HS Grad";df_meduc10$group[df_meduc10$meduc==4]="Some college";df_meduc10$group[df_meduc10$meduc==5]="College Grad";df_meduc10$group[df_meduc10$meduc==6]="Grad School"

plotmeduc10 = ggplot(df_meduc10,aes(x=V1,y=m,colour=group,shape=group)) +
    geom_line(size=0.72) +
    scale_color_manual(values=c("red","green","blue","orange","pink","yellow")) +
    xlim(2014, 2019)+
    xlab("Year") +
    ylab("% current e-cigarette smoker") +
    ggtitle("10th grade: current e-cigarette trends by mother's education") +
    scale_y_continuous(labels = scales::percent,breaks=seq(0, .40, .05), limits=c(0, .40)) +
    theme_minimal()
# plotmeduc10

# 12th Grade
df_meduc12 = df3 %>% group_by(V1,meduc) %>% 
    dplyr::summarize(m = weighted.mean(curr,V5)) %>% 
    filter(meduc > 0)
df_meduc12$group[df_meduc12$meduc==1]="Grade School";df_meduc12$group[df_meduc12$meduc==2]="Some HS";df_meduc12$group[df_meduc12$meduc==3]="HS Grad";df_meduc12$group[df_meduc12$meduc==4]="Some college";df_meduc12$group[df_meduc12$meduc==5]="College Grad";df_meduc12$group[df_meduc12$meduc==6]="Grad School"

plotmeduc12 = ggplot(df_meduc12,aes(x=V1,y=m,colour=group,shape=group)) +
    geom_line(size=0.72) +
    scale_color_manual(values=c("red","green","blue","orange","pink","yellow")) +
    xlim(2014, 2019)+
    xlab("Year") +
    ylab("% current e-cigarette smoker") +
    ggtitle("12th grade: current e-cigarette trends by mother's education") +
    scale_y_continuous(labels = scales::percent,breaks=seq(0, .40, .05), limits=c(0, .40)) +
    theme_minimal()
# plotmeduc12


## ALL by feduc 
df_feducall = df_r %>% group_by(V1,feduc) %>% 
    dplyr::summarize(m = weighted.mean(curr,V5)) %>% 
    filter(feduc > 0)
df_feducall$group[df_feducall$feduc==1]="Grade School";df_feducall$group[df_feducall$feduc==2]="Some HS";df_feducall$group[df_feducall$feduc==3]="HS Grad";df_feducall$group[df_feducall$feduc==4]="Some college";df_feducall$group[df_feducall$feduc==5]="College Grad";df_feducall$group[df_feducall$feduc==6]="Grad School"

plotfeduc1 = ggplot(df_feducall,aes(x=V1,y=m,colour=group)) +
    geom_line(size=0.72) +
    scale_color_manual(values=c("red","green","blue","orange","pink","yellow")) +
    xlim(2014, 2019)+
    xlab("Year") +
    ylab("% current e-cigarette smoker") +
    ggtitle("All grades: current e-cigarette trends by mother's education") +
    scale_y_continuous(labels = scales::percent,breaks=seq(0, .40, .05), limits=c(0, .40)) +
    theme_minimal()
# plotfeduc1

# 8th Grade
df_feduc8 = df1 %>% group_by(V1,feduc) %>% 
    dplyr::summarize(m = weighted.mean(curr,V5)) %>% 
    filter(feduc > 0)
df_feduc8$group[df_feduc8$feduc==1]="Grade School";df_feduc8$group[df_feduc8$feduc==2]="Some HS";df_feduc8$group[df_feduc8$feduc==3]="HS Grad";df_feduc8$group[df_feduc8$feduc==4]="Some college";df_feduc8$group[df_feduc8$feduc==5]="College Grad";df_feduc8$group[df_feduc8$feduc==6]="Grad School"

plotfeduc8 = ggplot(df_feduc8,aes(x=V1,y=m,colour=group,shape=group)) +
    geom_line(size=0.72) +
    scale_color_manual(values=c("red","green","blue","orange","pink","yellow")) +
    xlim(2014, 2019)+
    xlab("Year") +
    ylab("% current e-cigarette smoker") +
    ggtitle("8th grade: current e-cigarette trends by father's education") +
    scale_y_continuous(labels = scales::percent,breaks=seq(0, .40, .05), limits=c(0, .40)) +
    theme_minimal()
# plotfeduc8

# 10th Grade
df_feduc10 = df2 %>% group_by(V1,feduc) %>% 
    dplyr::summarize(m = weighted.mean(curr,V5)) %>% 
    filter(feduc > 0)
df_feduc10$group[df_feduc10$feduc==1]="Grade School";df_feduc10$group[df_feduc10$feduc==2]="Some HS";df_feduc10$group[df_feduc10$feduc==3]="HS Grad";df_feduc10$group[df_feduc10$feduc==4]="Some college";df_feduc10$group[df_feduc10$feduc==5]="College Grad";df_feduc10$group[df_feduc10$feduc==6]="Grad School"

plotfeduc10 = ggplot(df_feduc10,aes(x=V1,y=m,colour=group,shape=group)) +
    geom_line(size=0.72) +
    scale_color_manual(values=c("red","green","blue","orange","pink","yellow")) +
    xlim(2014, 2019)+
    xlab("Year") +
    ylab("% current e-cigarette smoker") +
    ggtitle("10th grade: current e-cigarette trends by father's education") +
    scale_y_continuous(labels = scales::percent,breaks=seq(0, .40, .05), limits=c(0, .40)) +
    theme_minimal()
# plotfeduc10

# 12th Grade
df_feduc12 = df3 %>% group_by(V1,feduc) %>% 
    dplyr::summarize(m = weighted.mean(curr,V5)) %>% 
    filter(feduc > 0)
df_feduc12$group[df_feduc12$feduc==1]="Grade School";df_feduc12$group[df_feduc12$feduc==2]="Some HS";df_feduc12$group[df_feduc12$feduc==3]="HS Grad";df_feduc12$group[df_feduc12$feduc==4]="Some college";df_feduc12$group[df_feduc12$feduc==5]="College Grad";df_feduc12$group[df_feduc12$feduc==6]="Grad School"

plotfeduc12 = ggplot(df_feduc12,aes(x=V1,y=m,colour=group,shape=group)) +
    geom_line(size=0.72) +
    scale_color_manual(values=c("red","green","blue","orange","pink","yellow")) +
    xlim(2014, 2019)+
    xlab("Year") +
    ylab("% current e-cigarette smoker") +
    ggtitle("12th grade: current e-cigarette trends by father's education") +
    scale_y_continuous(labels = scales::percent,breaks=seq(0, .40, .05), limits=c(0, .40)) +
    theme_minimal()
# plotfeduc12


## ALL by school region 
df_schoolregall = df_r %>% group_by(V1,school_region) %>% 
    dplyr::summarize(m = weighted.mean(curr,V5)) %>% 
    filter(school_region > 0)
df_schoolregall$group[df_schoolregall$school_region==1]="Northeast";df_schoolregall$group[df_schoolregall$school_region==2]="North Central";df_schoolregall$group[df_schoolregall$school_region==3]="South";df_schoolregall$group[df_schoolregall$school_region==4]="West"

plotschool_region1 = ggplot(df_schoolregall,aes(x=V1,y=m,colour=group)) +
    geom_line(size=0.72) +
    scale_color_manual(values=c("red","green","blue","orange")) +
    xlim(2014, 2019)+
    xlab("Year") +
    ylab("% current e-cigarette smoker") +
    ggtitle("All grades: current e-cigarette trends by mother's education") +
    scale_y_continuous(labels = scales::percent,breaks=seq(0, .40, .05), limits=c(0, .40)) +
    theme_minimal()
# plotschool_region1

# 8th Grade
df_school_region8 = df1 %>% group_by(V1,school_region) %>% 
    dplyr::summarize(m = weighted.mean(curr,V5)) %>% 
    filter(school_region > 0)
df_school_region8$group[df_school_region8$school_region==1]="Northeast";df_school_region8$group[df_school_region8$school_region==2]="North Central";df_school_region8$group[df_school_region8$school_region==3]="South";df_school_region8$group[df_school_region8$school_region==4]="West"

plotschool_region8 = ggplot(df_school_region8,aes(x=V1,y=m,colour=group,shape=group)) +
    geom_line(size=0.72) +
    scale_color_manual(values=c("red","green","blue","orange")) +
    xlim(2014, 2019)+
    xlab("Year") +
    ylab("% current e-cigarette smoker") +
    ggtitle("8th grade: current e-cigarette trends by school region") +
    scale_y_continuous(labels = scales::percent,breaks=seq(0, .40, .05), limits=c(0, .40)) +
    theme_minimal()
# plotschool_region8

# 10th Grade
df_school_region10 = df2 %>% group_by(V1,school_region) %>% 
    dplyr::summarize(m = weighted.mean(curr,V5)) %>% 
    filter(school_region > 0)
df_school_region10$group[df_school_region10$school_region==1]="Northeast";df_school_region10$group[df_school_region10$school_region==2]="North Central";df_school_region10$group[df_school_region10$school_region==3]="South";df_school_region10$group[df_school_region10$school_region==4]="West"

plotschool_region10 = ggplot(df_school_region10,aes(x=V1,y=m,colour=group,shape=group)) +
    geom_line(size=0.72) +
    scale_color_manual(values=c("red","green","blue","orange")) +
    xlim(2014, 2019)+
    xlab("Year") +
    ylab("% current e-cigarette smoker") +
    ggtitle("10th grade: current e-cigarette trends by school region") +
    scale_y_continuous(labels = scales::percent,breaks=seq(0, .40, .05), limits=c(0, .40)) +
    theme_minimal()
# plotschool_region10

# 12th Grade
df_school_region12 = df3 %>% group_by(V1,school_region) %>% 
    dplyr::summarize(m = weighted.mean(curr,V5)) %>% 
    filter(school_region > 0)
df_school_region12$group[df_school_region12$school_region==1]="Northeast";df_school_region12$group[df_school_region12$school_region==2]="North Central";df_school_region12$group[df_school_region12$school_region==3]="South";df_school_region12$group[df_school_region12$school_region==4]="West"

plotschool_region12 = ggplot(df_school_region12,aes(x=V1,y=m,colour=group,shape=group)) +
    geom_line(size=0.72) +
    scale_color_manual(values=c("red","green","blue","orange")) +
    xlim(2014, 2019)+
    xlab("Year") +
    ylab("% current e-cigarette smoker") +
    ggtitle("12th grade: current e-cigarette trends by school region") +
    scale_y_continuous(labels = scales::percent,breaks=seq(0, .40, .05), limits=c(0, .40)) +
    theme_minimal()
# plotschool_region12



# # 8th Grade, all years
# plot8th = read_dta("/homes/nber/kimcwa/bulk/8th_all_yrs.dta")
# # 10th Grade, all years
# plot10th = read_dta("/homes/nber/kimcwa/bulk/10th_all_yrs.dta")
# # 12th Grade, all years
# plot12th = read_dta("/homes/nber/kimcwa/bulk/12th_all_yrs.dta")


body <- dashboardBody(
    fluidRow(
        mainPanel(
            tabsetPanel(
                tabPanel("All Grades", plotOutput("selected_graph"))
            ))
    ))


sidebar<- dashboardSidebar(width = 350,
                           sidebarMenu(id="tabs",
                                       menuItem("Home page", tabName="dashboard", selected=TRUE)),
                           selectInput(inputId = "category", 
                                       label = "choose the categorical variable you want to filter by", 
                                       choices = c("Grade","Race", "Sex", 
                                                   "Where the individual lives",
                                                   "Grade Performance",
                                                   "Mother's education level",
                                                   "Father's education level",
                                                   "School Region"),
                           ),
                           selectInput(inputId = "dataset", 
                                       label = "Plot by all grades or by each grade level", 
                                       choices = c("All grades aggregated",
                                                   "By grade"),
                           ),
                           selectInput(inputId = "grade", 
                                       label = "If by grade, choose grade level you wish to view", 
                                       choices = c("8th Grade",
                                                   "10th Grade",
                                                   "12th Grade"),
                           ))

ui <- dashboardPage(
    skin = "yellow",
    dashboardHeader(title = "E-cigarette Trends",titleWidth = 350),
    sidebar,
    body,
)

server <- function(input, output) {
    
    plotgrade2 <- reactive({
        plotgrade1
    })
    plotr2 <- reactive({
        plotr1
    })
    plots2 <- reactive({
        plots1
    })
    plotg2 <- reactive({
        plotg1
    })
    plotgp2 <- reactive({
        plotgp1
    })
    plotmeduc2 <- reactive({
        plotmeduc1
    })
    plotfeduc2 <- reactive({
        plotfeduc1
    })
    plotschool_region2 <- reactive({
        plotschool_region1
    })
    
    # plots by grade
    plotr8th <- reactive({
        plotr8
    })
    plotr10th <- reactive({
        plotr10
    })
    plotr12th <- reactive({
        plotr12
    })
    plots8th <- reactive({
        plots8
    })
    plots10th <- reactive({
        plots10
    })
    plots12th <- reactive({
        plots12
    })
    plotg8th <- reactive({
        plotg8
    })
    plotg10th <- reactive({
        plotg10
    })
    plotg12th <- reactive({
        plotg12
    })
    plotgp8th <- reactive({
        plotgp8
    })
    plotgp10th <- reactive({
        plotgp10
    })
    plotgp12th <- reactive({
        plotgp12
    })
    plotmeduc8th <- reactive({
        plotmeduc8
    })
    plotmeduc10th <- reactive({
        plotmeduc10
    })
    plotmeduc12th <- reactive({
        plotmeduc12
    })
    plotfeduc8th <- reactive({
        plotfeduc8
    })
    plotfeduc10th <- reactive({
        plotfeduc10
    })
    plotfeduc12th <- reactive({
        plotfeduc12
    })
    plotschool_region8th <- reactive({
        plotschool_region8
    })
    plotschool_region10th <- reactive({
        plotschool_region10
    })
    plotschool_region12th <- reactive({
        plotschool_region12
    })
    
    # return requested graph
    graphInput <- reactive({
        which_data = input$dataset
        if (which_data == "All grades aggregated") {
            switch(input$category,
                   "Grade"=plotgrade2(),"Race"=plotr2(), "Sex"=plots2(), 
                   "Where the individual lives"=plotg2(),
                   "Grade Performance"=plotgp2(),
                   "Mother's education level"=plotmeduc2(),
                   "Father's education level"=plotfeduc2(),
                   "School Region"=plotschool_region2()
            )
        }
        else if (which_data == "By grade") {
            grade_level = input$grade
            if (grade_level == "8th Grade") {
                switch(input$category,
                       "Race"=plotr8th(),"Sex"=plots8th(),"Where the individual lives"=plotg8th(),
                       "Grade Performance"=plotgp8th(),"Mother's education level"=plotmeduc8th(),
                       "Father's education level"=plotfeduc8th(),
                       "School Region"=plotschool_region8th()
                )
            }
            else if (grade_level == "10th Grade") {
                switch(input$category,
                       "Race"=plotr10th(),"Sex"=plots10th(),"Where the individual lives"=plotg10th(),
                       "Grade Performance"=plotgp10th(),"Mother's education level"=plotmeduc10th(),
                       "Father's education level"=plotfeduc10th(),
                       "School Region"=plotschool_region10th()
                )
            }
            else {
                # 12th grade
                switch(input$category,
                       "Race"=plotr12th(),"Sex"=plots12th(),"Where the individual lives"=plotg12th(),
                       "Grade Performance"=plotgp12th(),"Mother's education level"=plotmeduc12th(),
                       "Father's education level"=plotfeduc12th(),
                       "School Region"=plotschool_region12th()
                )
            }
        }
    })
    
    
    output$selected_graph <- renderPlot({ 
        graphInput()
    },height = 600, width = 900)
    
}


shinyApp(ui,server)
