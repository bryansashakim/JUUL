
# Plot code
weighted.mean(df2014_highsocial$curr,df2014_highsocial$V5)
weighted.mean(df2014_lowsocial$curr,df2014_lowsocial$V5)

View(df2014 %>% select(V1,V5,hrw_social_net,hrw_text,hrw_call,hrw_video_chat,fhrw_social_net,fhrw_text,fhrw_call,fhrw_video_chat,total_social,avg_social_media,V7614))
View(df2014_highsocial %>% select(V1,V5,hrw_social_net,hrw_text,hrw_call,hrw_video_chat,fhrw_social_net,fhrw_text,fhrw_call,fhrw_video_chat,total_social,avg_social_media,V7614,curr))
View(df2014_lowsocial %>% select(V1,V5,hrw_social_net,hrw_text,hrw_call,hrw_video_chat,fhrw_social_net,fhrw_text,fhrw_call,fhrw_video_chat,total_social,avg_social_media,V7614))


#temp example
df2014 = df2014 %>% mutate(curr = ifelse(V7614 %in% c(2,3,4,5,6),1,0))
df2015 = df2015 %>% mutate(curr = ifelse(V7614 %in% c(2,3,4,5,6),1,0))
df2016 = df2016 %>% mutate(curr = ifelse(V7614 %in% c(2,3,4,5,6),1,0))
df2017 = df2017 %>% mutate(curr = ifelse((V7651 %in% c(2,3,4,5,6,7)) | (V7657 %in% c(2,3,4,5,6,7)),1,0))
df2018 = df2018 %>% mutate(curr = ifelse((V7651 %in% c(2,3,4,5,6,7)) | (V7657 %in% c(2,3,4,5,6,7)),1,0))
df2019 = df2019 %>% mutate(curr = ifelse(V7763 %in% c(2,3,4,5,6),1,0))
weighted.mean(df2014$curr,df2014$V5)
weighted.mean(df2015$curr,df2015$V5)
weighted.mean(df2016$curr,df2016$V5)
weighted.mean(df2017$curr,df2017$V5)
weighted.mean(df2018$curr,df2018$V5)
weighted.mean(df2019$curr,df2019$V5)
df = rbind.fill(df2014,df2015,df2016,df2017,df2018,df2019)
df$group="group"
View(df %>% select(V1,V5,hrw_social_net,hrw_text,hrw_call,hrw_video_chat,fhrw_social_net,fhrw_text,fhrw_call,fhrw_video_chat,total_social,avg_social_media,V7614,curr,group))

#subset by group
df2 = df %>% group_by(V1) %>% dplyr::summarize(m = weighted.mean(curr,V5))
df2$group="group"

plot = ggplot(df2,aes(x=V1,y=m,colour=group,shape=group)) +
  geom_line(size=0.72) +
  scale_color_manual(labels=c("Group 1"),values=c("red")) +
  xlab("Year") +
  ylab("% current e-cigarette smokers") +
  ggtitle("Cumulative Cases: Scenarios 1 and 2") +
  theme_minimal()
plot