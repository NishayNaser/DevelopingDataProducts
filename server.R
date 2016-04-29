# Server file for Shiny Application
# Coursera Developing Data Products
# Author: Nishay Naser

library(shiny)
library(rCharts)
library(ggplot2)

myData <- fread("./data/TigerPopData.csv")

shinyServer(
        function(input, output) {
                
                # To Output the entire Dataset
                output$data <- renderTable({
                        myData
                })
                
                # Display a Graph for Worldwide Tiger Population for the Year 2016
                output$currentPopulation <- renderPlot({
                        x = subset(myData, Year=='2016')
                        print(ggplot(x, aes(x = x$Country, y = x$Population))
                              + geom_bar(stat = "identity", fill = "sienna2", width = 0.8)
                              + labs(x = "Country", y = "Population")
                              + ggtitle("2016 Tiger Population")
                              )
                        })
                
                # Display a Graph for Yearly Tiger Populations
                output$yearlyPopulation <- renderPlot({
                        print(ggplot(myData, aes(x = myData$Year, y = myData$Population, group = myData$Year))
                              + geom_bar(stat = "identity", fill = "violetred", width = 0.8)
                              + ggtitle("Worldwide Yearly Tiger Population")
                              + labs(x = "Year", y = "Population")
                              )
                        })
                
                output$yearlySpeciesPopulation <- renderPlot({
                        x = subset(myData, Species==input$species)
                        print(ggplot(x, aes(x = x$Year, y = x$Population), group = x$Year)
                              + geom_point(aes(shape = Species), size = 4, col = "dodgerblue1")
                              + ggtitle("Worldwide Yearly Tiger Population By Species")
                              + labs(x = "Year", y = "Population")
                              )
                        })
                
                output$yearlyCountryPopulation <- renderPlot({
                        x = subset(myData, Country==input$country)
                        print(ggplot(x, aes(x = x$Year, y = x$Population), group = x$Year)
                              + geom_bar(stat = "identity", fill = "purple2", width = 0.8)
                              + ggtitle("Worldwide Yearly Tiger Population By Country")
                              + labs(x = "Year", y = "Population")   
                        )
                })                
})