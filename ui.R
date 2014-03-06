library(shiny)
#setwd("C:/Users/Sachin_2/SkyDrive/Documents")
# Define UI for dataset viewer application
shinyUI(pageWithSidebar(
  
  # Application title
  headerPanel("Putaway recommend"),
  sidebarPanel(textInput("locat", "Choose a Product Code","100")),
  mainPanel(
    tableOutput("recommended"),
    h5("If above table has no recommendation, use below")
    ,tableOutput("present")
    #,tableOutput("space")
)))
