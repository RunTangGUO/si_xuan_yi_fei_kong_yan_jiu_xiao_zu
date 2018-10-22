#rm(list=ls())
# Multiple plot function
#
# ggplot objects can be passed in ..., or to plotlist (as a list of ggplot objects)
# - cols:   Number of columns in layout
# - layout: A matrix specifying the layout. If present, 'cols' is ignored.
#
# If the layout is something like matrix(c(1,2,3,3), nrow=2, byrow=TRUE),
# then plot 1 will go in the upper left, 2 will go in the upper right, and
# 3 will go all the way across the bottom.
#
multiplot <- function(..., plotlist=NULL, file, cols=1, layout=NULL) {
  library(grid)
  #pdf("rank.pdf", 28.1/2.54 ,19.4/2.54,family="FangSong")
 
  # Make a list from the ... arguments and plotlist
  plots <- c(list(...), plotlist)
 
  numPlots = length(plots)
 
  # If layout is NULL, then use 'cols' to determine layout
  if (is.null(layout)) {
    # Make the panel
    # ncol: Number of columns of plots
    # nrow: Number of rows needed, calculated from # of cols
    layout <- matrix(seq(1, cols * ceiling(numPlots/cols)),
                    ncol = cols, nrow = ceiling(numPlots/cols))
  }
 
 if (numPlots==1) {
    print(plots[[1]])
 
  } else {
    # Set up the page
    grid.newpage()
    pushViewport(viewport(layout = grid.layout(nrow(layout), ncol(layout))))
 
    # Make each plot, in the correct location
    for (i in 1:numPlots) {
      # Get the i,j matrix positions of the regions that contain this subplot
      matchidx <- as.data.frame(which(layout == i, arr.ind = TRUE))
 
      print(plots[[i]], vp = viewport(layout.pos.row = matchidx$row,
                                      layout.pos.col = matchidx$col))
    }
  }
  #embed_fonts("rank.pdf")
}

#库引用及数据准备
library(ggplot2)
library(dplyr)
library(openxlsx)
library(Cairo)
library(extrafont)
library(showtext)
loadfonts()
showtext.auto(enable = TRUE)
#font.add('FangSong', 'fangsong.ttc')
Sys.setenv(R_GSCMD="C:/Program Files/gs/gs9.25/bin/gswin64c.exe")
timeHMS_formatter<-function(x){
    h<-floor(x/3600)
    m<-floor((x/60)%%60)
    s<-round(x%%60)
    lab<-sprintf("%02d:%02d:%02d",h,m,s)
    lab<-sub("^00:","",lab)
    lab<-sub("^0","",lab)
    return(lab)
}
test1<-read.xlsx("D:/Physical data/1p1.xlsx",1)
test2<-read.xlsx("D:/Physical data/1p1.xlsx",2)
test3<-read.xlsx("D:/Physical data/1p1.xlsx",3)
test4<-read.xlsx("D:/Physical data/1p1.xlsx",4)
test5<-read.xlsx("D:/1p1.xlsx",5)
test<-merge(test1,test2,all=TRUE)
test<-merge(test,test3,all=TRUE)
test<-merge(test,test4,all=TRUE)
test<-merge(test,test5,all=TRUE)

test_tk<-subset(test,test$tk>0)
test_tk_absent<-subset(test,is.na(test$tk))
test_tk$lg[test_tk$tk<=14.2]<-"NL"
test_tk$lg[test_tk$tk>14.2]<-"AL"
tk_qualified<-paste("合格人数:",sum(test_tk=="NL"))
tk_unqualified<-paste("不合格人数:",sum(test_tk=="AL"))
tk_absent<-paste("缺考人数：",length(subset(test,is.na(test$tk))$name))
test_tk$r_f<-(test_tk$tk%/%1)*60
test_tk$r_g<-(test_tk$tk%%1)*100
test_tk$r<-test_tk$r_f+test_tk$r_g

test_hb<-subset(test,test$hb>=0)
test_hb_absent<-subset(test,is.na(test$hb))
test_hb$lg[test_hb$hb>=12]<-heat.colors(7)[1]
test_hb$lg[test_hb$hb>=9&test_hb$hb<12]<-heat.colors(7)[3]
test_hb$lg[test_hb$hb>=6&test_hb$hb<9]<-heat.colors(7)[4]
test_hb$lg[test_hb$hb<6]<-heat.colors(7)[5]
o<-order(test_hb[,"hb"])
test_hb<-test_hb[o,]

test_pb<-subset(test,test$pb>=0)
test_pb_absent<-subset(test,is.na(test$pb))
test_pb$lg[test_pb$pb>=12]<-heat.colors(7)[1]
test_pb$lg[test_pb$pb>=9&test_pb$pb<12]<-heat.colors(7)[3]
test_pb$lg[test_pb$pb>=6&test_pb$pb<9]<-heat.colors(7)[4]
test_pb$lg[test_pb$pb<6]<-heat.colors(7)[5]
o<-order(test_pb[,"pb"])
test_pb<-test_pb[o,]

#绘制3公里成绩排名

p1<-ggplot(test_tk,aes(y=reorder(name,tk,desc),x=r))+geom_point(size=3,aes(colour=lg))+geom_segment(aes(yend=name),xend=0,colour="grey50")+scale_colour_brewer(palette="Set1")+xlab("")+ylab("")
p1<-p1+theme(panel.grid.major.y=element_blank(),panel.grid.minor.y=element_blank(),legend.position=c(.8,.8),legend.background=element_rect(fill="white",colour="black"))
p1<-p1+scale_x_continuous(breaks=c(660,720,780,840,900,960,1020,1080,1140,1200,1260),labels=c("11:00","12:00","13:00","14:00","15:00","16:00","17:00","18:00","19:00","20:00","21:00"))+scale_colour_hue("组别",breaks=c("NL","AL"),labels=c("合格人员","不合格人员"))+annotate("text",y=37,x=19*60,label=tk_qualified,size=4)+annotate("text",y=35.5,x=19*60,label=tk_unqualified,size=4)+annotate("text",y=34,x=19*60,label=tk_absent,size=4)+geom_vline(xintercept=14*60+20,linetype="dashed")+ggtitle("                 三排三公里成绩排名")
#+annotate("text",y=21*60,label="三公里成绩",size=8,x=26)+coord_fixed(ratio=(1260*2.7)/51)
#绘制单杠成绩排名

#hb_qualified<-paste("合格人数:",sum(test_hb==#FF6600FF|test_hb==#FF9900FF|test_hb==#FF0000FF)
#hb_unqualified<-paste("不合格人数:",sum(test_hb==#FFCC00FF))
#hb_absent<-paste("缺考人数：",length(subset(test,is.na(test$hb))$name))
p2<-ggplot(test_hb,aes(x=reorder(name,hb),y=hb,fill=test_hb$lg))+geom_bar(stat="identity")+coord_flip()+xlab("")+ylab("")+theme(panel.grid.major.y=element_blank(),panel.grid.minor.y=element_blank(),panel.grid.minor.x=element_blank(),legend.position=c(.8,.4),legend.background=element_rect(fill="white",colour="black"))+scale_y_continuous(breaks=seq(0,20,by=1))+labs(fill="组别")+scale_fill_discrete(labels=c("优秀","良好","合格","不合格"))+geom_hline(yintercept=12,linetype="dashed")+geom_hline(yintercept=9,linetype="dashed")+geom_hline(yintercept=6,linetype="dashed")+ggtitle("                    三排双杠成绩排名")#+annotate("text",y=12.5,x=17,label=hb_qualified,size=4)+annotate("text",y=12.5,x=16,label=hb_unqualified,size=4)+annotate("text",y=12.5,x=14,label=hb_absent,size=4)+ggtitle("一排三单杠成绩排名")

p3<-ggplot(test_pb,aes(x=reorder(name,pb),y=pb,fill=test_pb$lg))+geom_bar(stat="identity")+coord_flip()+xlab("")+ylab("")+theme(panel.grid.major.y=element_blank(),panel.grid.minor.y=element_blank(),panel.grid.minor.x=element_blank(),legend.position=c(.8,.4),legend.background=element_rect(fill="white",colour="black"))+scale_y_continuous(breaks=seq(0,20,by=1))+labs(fill="组别")+scale_fill_discrete(labels=c("优秀","良好","合格","不合格"))+geom_hline(yintercept=12,linetype="dashed")+geom_hline(yintercept=9,linetype="dashed")+geom_hline(yintercept=6,linetype="dashed")+ggtitle("                    三排双杠成绩排名")#+annotate("text",y=12.5,x=17,label=hb_qualified,size=4)+annotate("text",y=12.5,x=16,label=hb_unqualified,size=4)+annotate("text",y=12.5,x=14,label=hb_absent,size=4)

#layout<-matrix(c(1,2,3),1,3),lcm(19.4,28.1)
#multiplot(plotlist = list(p1, p2, p3), layout = layout)
#grid.arrange(p1,p2,p3,ncol=3,nrow=1)
#ggsave("rank.pdf",width=19.4/2.54,height=28.1/2.54)

layout<-matrix(c(1,2,3),ncol=3,nrow=1)
multiplot(plotlist = list(p1, p2, p3), layout = layout)
#dev.off()
