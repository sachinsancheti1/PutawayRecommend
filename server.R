library(shiny)
library(plyr)
#setwd("C:/Users/Sachin_2/SkyDrive/Documents")
recommend <- function(x) {
(lc4[lc4$Product.Code == x,])
}

spaces <- function(x) {
  tt <- as.matrix(table(lc$Location)[(lc2[lc3[,1],])[,4]])
  tt1 <- tt[recommend(x)[,1],]
  as.matrix(tt1)
}

spaces2 <- function(x) {
  tt <- as.matrix(table(lc$Location)[(lc2[lc3[,1],])[,4]])
  as.matrix(tt[current(x)[,1],])
}
#names(lc)
current <- function(x) {
  cc <- ddply(lc[lc$Product.Code==x,],"Location",summarise,Current.Locations = length(Product.Code))
}

lengthout <- function(x) (length(x)=8)
# Define server logic required to summarize and view the selected dataset
shinyServer(function(input, output) {
  lc <- read.csv("stdlocatorReport (4).csv",header = T)
  lc$Avail.Qty <- as.numeric(lc$Avail.Qty)
  lc$GRN.Date <- as.Date(lc$GRN.Date,format = "%d/%m/%Y")
  lc1 <- lc[order(lc$GRN.Date),]
  lc2 <- cbind(seq(1,dim(lc1)[1]),lc1)
  names(lc2) <- c("SNo", names(lc1))
  lc3 <- as.matrix(tapply(lc2$SNo, lc2$Location, FUN = max))
  infr <- c(5,8,10,23)
  lc4 <- (lc2[lc3[,1],])[infr]
  #
  #if(lengthout(input$locat))
  output$recommended <- renderTable(cbind(recommend(input$locat),spaces(input$locat)))
  #if(dim(output$recommended)[1]==0)
  output$present <- renderTable(cbind(current(input$locat),spaces2(input$locat)))
  #if(lengthout)
  #output$space <- renderTable(spaces(input$locat))

})
