library(data.table)
library(ggplot2)

evr_use8 = c(40.67, 35.73, 30.47, 29.12, 27.34, 26.44, 24.54, 21.04, 20.27, 20.59, 20.29, 18.14, 15.63, 14.69, 13.50, 13.31, 9.87, 9.45, 9.08, 9.41)
evr_use10 = c(54.89, 54.07, 46.69, 42.29, 41.35, 38.87, 35.50, 34.47, 32.33, 33.88, 32.67, 30.57, 27.69, 25.77, 22.43, 19.98, 17.52, 15.82, 16.12, 13.99) 
evr_use12 = c(61.28, 60.09, 55.98, 53.23, 50.96, 48.93, 47.93, 45.45, 43.18, 41.82, 42.28, 40.23, 39.46, 38.27, 34.61, 31.02, 28.05, 26.55, 23.83, 22.25)
year = 2000:2019
evr_use_df = data.table(year,evr_use8,evr_use10,evr_use12)
curr_use8 = c(14.0, 11.3, 10.5, 10.8, 8.7, 9.1, 8.7, 6.4, 6.4, 6.6, 7.5, 5.7, 4.9, 4.5, 4.0, 3.6, 2.6, 1.9, 2.2, 2.2)
curr_use10 = c(22.9, 22.0, 17.6, 16.5, 16.4, 15.1, 14.3, 14.0, 13.1, 13.6, 13.6, 11.8, 10.8, 9.1, 7.1, 6.3, 4.9, 5.0, 4.3, 3.4)
curr_use12 = c(31.36, 29.37, 26.60, 24.34, 24.84, 23.04, 21.70, 21.6, 20.5, 20.0, 19.2, 18.7, 17.1, 16.3, 13.7, 11.4, 10.4, 9.8, 7.6, 5.8) 
curr_use_df = data.table(year,curr_use8,curr_use10,curr_use12)

evr_use_df_melted=reshape2::melt(evr_use_df,id.var="year")
curr_use_df_melted=reshape2::melt(curr_use_df,id.var="year")

ggplot(evr_use_df_melted,aes(x=year,y=value,colour=variable,shape=variable)) +
  geom_line(size=0.42) +
  scale_color_manual(labels=c("8th Grade","10th Grade","12th Grade"),values=c("red","green","blue")) +
  xlim(2000, 2019)+
  xlab("Year") +
  ylab("% ever use cigarette") +
  ggtitle("% ever use cigarette by grade/year") +
  theme_bw() +
  theme(plot.title = element_text(hjust=0.50)) +
  scale_y_continuous(breaks=seq(0,100.0, 10.0))

ggplot(curr_use_df_melted,aes(x=year,y=value,colour=variable,shape=variable)) +
  geom_line(size=0.42) +
  scale_color_manual(labels=c("8th Grade","10th Grade","12th Grade"),values=c("red","green","blue")) +
  xlim(2000, 2019)+
  xlab("Year") +
  ylab("% ever use cigarette") +
  ggtitle("% ever use cigarette by grade/year") +
  theme_bw() +
  theme(plot.title = element_text(hjust=0.50)) +
  scale_y_continuous(breaks=seq(0,100.0, 10.0))
