#Reading csv file
project<-read.csv(file.choose(), header = T)
project

#popular product in the store 
pop_product<-project[which.max(project$Quantity),]
data.frame(pop_product$Description)

#top 5 products in the store
top <- project[order(project$Quantity,decreasing = T)[1:5],]
data.frame(top$Description)

#popular product in each country
library(data.table)
DT<-data.table(project)
DT[,list(Quantity = max(Quantity)),by=Country]
EachCountry<-DT[,.SD[which.max(Quantity)],by=Country]
data.frame(EachCountry$Country, EachCountry$Description)

#analysing monthly transactions
#unique(project$Year, incomparables = FALSE, MARGIN = 1,fromLast = FALSE)
year<-c(length(which(project$Year  == "111")),length(which(project$Year  == "211")),length(which(project$Year  == "311")),length(which(project$Year  == "411")),length(which(project$Year  == "511")),length(which(project$Year  == "611")),length(which(project$Year  == "711")),length(which(project$Year  == "811")),length(which(project$Year  == "911")),length(which(project$Year  == "1011")),length(which(project$Year  == "1111")),length(which(project$Year  == "1211")))
month1<-c("January","February","March","April","May","June","July","August","September","October","November","December")
pct <- round(year/sum(year)*100)
month1<- paste(month1, pct)
month1 <- paste(month1,"%",sep="")
pie(year,labels = month1, col=rainbow(length(month1)),
         main="Pie Chart of monthly transactions") 








#barplot(year,xlab = "Year",ylab = "sales" , horiz = FALSE,names.arg = c("12-2010", "1-2011", "2-2011", "3-2011", "4-2011", "5-2011", "6-2011", "7-2011", "8-2011", "9-2011", "10-2011","11-2011", "12-2011"))

#popular product in each month
library(data.table)
DT<-data.table(project)
DT[,list(Quantity = max(Quantity)),by=Year]
EachMonth<-DT[,.SD[which.max(Quantity)],by=Year]
data.frame(EachMonth$Year, EachMonth$Description)
#analysing sales for next 12 months
months<-aggregate(Quantity ~ Year,project,function(x) sum(x))
library(ggplot2)
df <- data.frame(months=1:13, crime= months)
ggplot(df, aes(x=months, y=crime)) + geom_point() + geom_smooth(method="lm", fullrange=T) + xlim(1,23)

#how are the sales at each time shown using scatterplot
project<-read.csv(file.choose(), header = T)
dataf<-data.frame(project$InvoiceDate,project$Quantity)
new<- do.call( rbind , strsplit( as.character( dataf$project.InvoiceDate) , " " ) )
time<-cbind(dataf , Date = new[,1] , Time = new[,2] )
time_Quantity<-data.frame(time$Time,time$project.Quantity)
tot_time<-aggregate(time_Quantity$time.project.Quantity ~ time_Quantity$time.Time,time_Quantity,function(x) sum(x))
colnames(tot_time)<-c("TIME","QUANTITY")
plot(tot_time$QUANTITY~ tot_time$TIME,main = "scatterplot")

#in Each country mostly soled product for each individual customer
country_cus <- data.frame(project$Description,project$Quantity,project$CustomerID,project$Country)
#In Malta Country..........do same for other countries.................
con_mal <- subset(country_cus,project$Country == "Malta")
library(data.table)
ml<-data.table(con_mal)
ml[,list(Quantity = max(project.Quantity)),by=project.CustomerID]
Each_ml<-ml[,.SD[which.max(project.Quantity)],by=project.CustomerID]
malta_customers<-data.frame(Each_ml$project.CustomerID, Each_ml$project.Description,Each_ml$project.Country)
##canada customers
con_canada <-subset(country_cus,project$Country == "Canada")
canada<-data.table(con_canada)
canada[,list(Quantity = max(project.Quantity)),by=project.CustomerID]
Each_canada<-canada[,.SD[which.max(project.Quantity)],by=project.CustomerID]
canada_customers<-data.frame(Each_canada$project.CustomerID, Each_canada$project.Description,Each_canada$project.Country)
#Greece customers
con_greece <-subset(country_cus,project$Country == "Greece")
greece<-data.table(con_greece)
greece[,list(Quantity = max(project.Quantity)),by=project.CustomerID]
Each_greece<-greece[,.SD[which.max(project.Quantity)],by=project.CustomerID]
greece_customers<-data.frame(Each_greece$project.CustomerID, Each_greece$project.Description,Each_greece$project.Country)
#japan customers
con_japan <-subset(country_cus,project$Country == "Japan")
japan<-data.table(con_japan)
japan[,list(Quantity = max(project.Quantity)),by=project.CustomerID]
Each_japan<-japan[,.SD[which.max(project.Quantity)],by=project.CustomerID]
japan_customers<-data.frame(Each_japan$project.CustomerID, Each_japan$project.Description,Each_japan$project.Country)
#changing the column names
colnames(malta_customers)<-c("CustomerID","Description","Country")
colnames(canada_customers)<-c("CustomerID","Description","Country")
colnames(greece_customers)<-c("CustomerID","Description","Country")
newData <- merge(malta_customers,canada_customers,by=c("CustomerID","Description","Country"),all = TRUE)#this is used when column names are same
#below code is used when column names are different but data(content in it) is same
newData1 <- merge(newData,greece_customers,by=c("CustomerID","Description","Country"),all = TRUE)
country_customers <- merge(newData1,japan_customers,by.x=c("CustomerID","Description","Country"),by=c("Each_japan.project.CustomerID","Each_japan.project.Description","Each_japan.project.Country"),all=TRUE)
country_customers