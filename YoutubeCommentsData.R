#GETTING YOUTUBE DATA

install.packages("vosonSML")
library(vosonSML)
install.packages("writexl")
library("writexl")
library("readxl")
#GOOGLE DEVELOPER API KEY
apikey="AIzaSyAhyodeEEQ2_lAC28zFy_ZDn4hKdrDjafo"
key=Authenticate("youtube",apikey)

#COLLECT DATA USING YOUTUBE VIDEO IDs
video=c("wrBeFDNVJ-U")
ytdata=Collect(key,video)
str(ytdata)
write_xlsx(ytdata,"ytdata.xlsx")
dd=read_excel("D:/R/ytdata.xlsx")

#SENTIMENT ANALYSIS
install.packages("syuzhet")
library("syuzhet")
comments=iconv(dd$Comment)
s=get_nrc_sentiment(comments)
head(s)
s$neutral=ifelse(s$negative+s$positive==0,1,0)
head(s)
comments[5]

#bar plot of sentiment analysis
barplot(100*colSums(s)/sum(s),las=2,col = rainbow(10),ylab = 'percentage',main = 'sentiment scores for youtube comments')
