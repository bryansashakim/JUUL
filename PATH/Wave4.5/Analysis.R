# DROP NAs in curr_enp_user before tabulating:
wave4.5 = wave4.5[complete.cases(wave4.5[c("curr_enp_user")]),]

View(wave4.5 %>%
       group_by(curr_enp_user,grade) %>%
       summarise(n = n()) %>%
       mutate(percent = round((n / sum(n)), 3),
              cumpercent = round(cumsum(freq = n / sum(n)),3)))


## EVER ECIG USER
temp = wave4.5; temp = temp[complete.cases(temp[c("ever_used_ecig")]),]
# BREAKDOWN BY GRADE
temp = temp %>% filter(grade == "(2) 2 = 8th grade")
### WEIGHTED TABULATIONS ### THREE DIFFERENT METHODS
wtd.table(temp$ever_used_ecig,weights = temp$single_wave4_cohort,normwt=TRUE)
count(wave4.5, ever_used_ecig, wt = single_wave4_cohort)
fre(temp$ever_used_ecig,weight = temp$single_wave4_cohort)

## CURRENT ENP USER
temp = wave4.5; temp = temp[complete.cases(temp[c("curr_enp_user")]),]
# BREAKDOWN BY GRADE
temp = temp %>% filter(grade == "(6) 6 = Other (including not enrolled this year or last, home schooled, school not graded, 12th grade, college or vocational")
### WEIGHTED TABULATIONS ### THREE DIFFERENT METHODS
#wtd.table(wave4.5$curr_ecig_user,weights = wave4.5$single_wave4_cohort,normwt=TRUE)
#count(wave4.5, curr_ecig_user, wt = single_wave4_cohort)
fre(temp$curr_enp_user,weight = temp$single_wave4_cohort)

# LOOKING AT BRANDS 
temp = wave4.5
temp = temp %>% filter(curr_enp_user == 1);temp = temp[complete.cases(temp[c("brand_enp_usually_last")]),] # FILTER FOR current ENP users
fre(temp$brand_enp_usually_last,weight = temp$single_wave4_cohort)
