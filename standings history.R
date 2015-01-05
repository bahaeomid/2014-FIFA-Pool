library(ggplot2)
library(grid)
library(scales)

data <- read.csv('C:/Users/Bahae.Omid/Google Drive/World Cup Pool/data.csv')
data[,'Date']<-as.Date(data[,'Date'],format='%d-%B')
list <- split(data, data$Name)
plots <- list()

for (i in 1:length(list)){
  
  plots[[i]]<-ggplot(list[[i]],aes(x=Date,y=Rank))+geom_line(aes(group=Name,colour=Name))+geom_point()+labs(x='Date',y='Rank',title='Rank Over Time')+theme(legend.title=element_blank(),axis.text.x=element_text(angle=45,hjust=1,size=8),text=element_text(size=12,face='bold'),axis.title.x=element_blank(),axis.title.y=element_blank(),plot.title=element_text(vjust=2,size=rel(1.5)),plot.margin = unit(c(1,1,1,1), "cm"),legend.position='bottom')+scale_y_continuous(limits=c(0,35),breaks=seq(1,34,by=4))+geom_text(aes(label=Rank),vjust=2,size=2)+scale_x_date(limits=c(as.Date('2014-06-13'),as.Date('2014-07-13')),breaks='1 day',labels=date_format('%B %d'))    
}

pdf('Standings History.pdf')
bquiet <- lapply(plots,print)
dev.off()
