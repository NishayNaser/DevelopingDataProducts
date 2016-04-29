---
title       : Reproducible Presentation
subtitle    : Developed for Shiny Application Course Project for Johns Hopkins University Data Science Specialization Course Developing Data Products
author      : Nishay Naser
job         : 
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : []            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---

## Introduction

The Course Project of Developing Data Products from the Johns Hopkins University Data Science Specialization on Coursera requires the development of a Shiny Application that takes user input and produces some reactive output. My course project has the following contents:

1. Shiny Application

An Shiny Application developed to analyse worldwide tiger populations

2. Reproducible Presentation

A Slidify Presentation explaining the specifics of the developed Shiny Application

---

## Objective of the Application

The Shiny Application developed for this course project is titled: Tiger Population Analysis.

The objective of this application is to provide visualisations for users to clearly understand the current situation of worldwide tiger population, analyse the rise and fall in the population of these beautiful creatures over the years and consequently understand the urgent need to take action to save tigers.

The data used for this application contains the following fields
* Country: The name of the country which is naturally home to a tiger species
* Year: The year in which the population was recorded
* Species: The species of tiger that is naturally found in that country
* Population: The number of tigers of that species that are living in that country

---

## The Application - Tiger Population Analysis

The Tiger Population Analysis Shiny Application provides the following three tabs:

* About

This tab provides an introduction to the application and its purpose.
* Dataset

This tab displays the entire dataset in the form of a table so that the user may have easy access to the data
* Visualisations

This tab displays a number of various graphs to allow the user to analyse the tiger population by the year, species or country

Link to Application: https://nishaynaser.shinyapps.io/DDPCourseProject/

---

## Executable Code


```r
# Displaying Tiger Populations for 2016
myData <- read.csv("./data/TigerPopData.csv")
newData = subset(myData, Year=='2016')  #Display
newData
```

```
##       Country Year               Species Population
## 30    Lao PDR 2016     Indochinese Tiger          2
## 31    Vietnam 2016     Indochinese Tiger          5
## 32      China 2016     South China Tiger          7
## 33     Bhutan 2016          Bengal Tiger        103
## 34 Bangladesh 2016          Bengal Tiger        106
## 35   Thailand 2016     Indochinese Tiger        189
## 36      Nepal 2016          Bengal Tiger        198
## 37   Malaysia 2016         Malayan Tiger        250
## 38  Indonesia 2016        Sumatran Tiger        371
## 39     Russia 2016 Siberian / Amur Tiger        433
## 40      India 2016          Bengal Tiger       2226
## 41   Cambodia 2016     Indochinese Tiger          0
```
