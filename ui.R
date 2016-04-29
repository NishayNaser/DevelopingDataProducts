# User Interface file for Shiny Web Application
# Coursera Developing Data Products
# Author: Nishay Naser

# Adding header files
library(shiny)
library(BH)
library(rCharts)
library(markdown)
library(data.table)
library(dplyr)
library(DT)

myData <- fread("./data/TigerPopData.csv")

shinyUI(
        fluidPage(
                # Adding the Title
                titlePanel("Tiger Population Analysis"),
                sidebarLayout(
                        sidebarPanel(
                                helpText("Select one Species and one Country at a time. Please 
                                        remember to uncheck the selected options before selecting 
                                        another option. Due to a lack of available data some 
                                        plots may appear incomplete. For best results select 
                                        Species: Siberian / Amur Tiger and Country: India"),
                                # Check boxes for Tiger Species
                                checkboxGroupInput("species",
                                                   label = "Choose Species:",
                                                   choices = c(unique(myData$Species))
                                                   ),
                                #Check boxes for Countries
                                checkboxGroupInput("country",
                                                   label = "Choose Countries:",
                                                   choices = c(unique(myData$Country))
                                                   )
                                ),
                        
                        mainPanel(
                                tabsetPanel(
                                        # Creating a Tab for About
                                        tabPanel(
                                                p("About"),
                                                p("
                                                  "),
                                                p("This Shiny Application has been made for submission
                                                  to the Coursera course Developing Data Products."),
                                                p("
                                                  "),
                                                p("The aim of this application is to visualise the 
                                                  global population of tigers to spread awareness 
                                                  about their dangerously low numbers and the need 
                                                  for urgent efforts to save these beautiful creatures."),
                                                p("
                                                  "),
                                                p("The first two graphs in the Visualizations Tab are 
                                                  static. The following two visualizations allow the 
                                                  user to select data from the Sidebar to display reactive 
                                                  visualizations.")
                                                ),
                                        # Creating a Tab to Display the Dataset
                                        tabPanel(
                                                p(icon("table"), "Dataset"),
                                                tableOutput("data")
                                                ),
                                        # Creating a Tab to Display Visualizations
                                        tabPanel(
                                                p(icon("line-chart"), "Visualisations"),
                                                
                                                p("
                                                  "),
                                                p("The following graph displays the Tiger Populations 
                                                  for Year 2016 of each Country that is home to some 
                                                  Species of Tigers"),
                                                plotOutput("currentPopulation"),
                                                
                                                p("
                                                  "),
                                                p("The graph given below displays the Worldwide 
                                                  Tiger Population by Year"),
                                                plotOutput("yearlyPopulation"),
                                                
                                                p("
                                                  "),
                                                p("The following graph displays the yearly Tiger 
                                                  Populations for the chosen Species"),
                                                plotOutput("yearlySpeciesPopulation"),
                                                
                                                p("
                                                  "),
                                                p("The following graph displays the yearly Tiger 
                                                  Populations for the selected Counrty"),
                                                plotOutput("yearlyCountryPopulation")
                                                )
                                        )
                                )
                        )
                )
        )