#########################################################################################################
#
# Title : Literacy in India : A DeepR dive
# Designed and developed by: Tinniam V Ganesh
# Date : 5 Nov 2015
# File: server.R
# More details: https://gigadom.wordpress.com/
#
#########################################################################################################
library(shiny)
#library(shinyjs)
#library(devtools)
#install_github("tvganesh/cricketr")
library(cricketr)


tendulkar <- read.csv("tendulkar.csv")
print(dim(tendulkar))
source("analyzeBatsman.R")
source("analyzeBowler.R")
source("relBatsmenPerf.R")

funcs <- c("4s of batsman",
           "6s of batsman",
           "4s & 6s of batsman",
           "Batsman's dismissals",
           "Batsman's Mean Strike Rate",
           "Batsman Runs-Freq. chart",
           "Batsman Run Ranges",
           "Batsman's Perf BoxHist chart",
           "Ground avg of batsman",
           "Avg runs scored vs opposition",
           "Contribution to wins & losses",
           "Batsman's Home-Away record",
           "Batsman's Moving Average",
           'Batsman Perf. Forecast',
           "Batsman Runs Likelihood est.",
           "Batsman Perf. 3-D",
           "Check batsmanI form status")

funcs1 <- c("Bowler's Wickets-Runs plot",
            "Bowler's Wickets Freq Percent",
            "Bowler's Histogram of Wickets",
            "Bowler's Avg Wickets at Ground",
            "Bowler's Avg Wicket against opposition",
            "Contribution to wins & losses",
            "Bowler's Perf. Home-Away",
            "Bowler's Economy Rate",
            "Bowler's Moving Average",
            "Bowler's Perf. Forecast",
            #"bowlerWktRateTT",
            "Check Bowler Form status")

funcOD <- c("batsmanScoringRateODTT","bowlerWktsFreqPercent","bowlerWktsRunsPlot")
funcRelBat <- c("relativeBatsmanSR","relativeBatsmanSRODTT","relativeRunsFreqPerf")
funcRelBowl <- c("relativeBowlingER","relativeBowlingPerf","relativeWktRateTT")
funcRelOD <-c("relativeBatsmanSRODTT","relativeRunsFreqPerfODTT")
funcRelBowlERODTT <- ("relativeBowlingERODTT")

players <- c("tendulkar","dravid","ponting","sangakkara")
shinyServer(function(input, output,session) {
   
    #updateSelectizeInput(session, 'batsman', choices = players, server = TRUE,selected="tendulkar")
    #updateSelectizeInput(session, 'batsmanFunc', choices = funcs, server = TRUE,selected="4s of batsman")
    
    updateSelectizeInput(session, 'bowler', choices = players, server = TRUE,selected="kumble")
    updateSelectizeInput(session, 'bowlerFunc', choices = funcs1, server = TRUE,selected="Bowler's Wickets-Runs plot")
   
    updateSelectizeInput(session, 'batsmen', choices = players, server = TRUE,selected="tendulkar")
    updateSelectizeInput(session, 'batsmenFunc', choices = funcRelBat, server = TRUE,selected="relativeBatsmanSR")
 
    # Draw the plot
    output$batsmanPlot <- renderPlot({  
        if(input$matchType == "Test"){
            players <- c("tendulkar","dravid","ponting","sangakkara")
            updateSelectizeInput(session, 'batsman', choices = players, server = TRUE,selected="tendulkar")
        } else {
            players <- c("devilliers","gayle","sehwag")
            updateSelectizeInput(session, 'batsman', choices = players, server = TRUE,selected="gayle")
            
        }
        updateSelectizeInput(session, 'batsmanFunc', choices = funcs, server = TRUE,selected=input$batsmanFunc)
        
        
        print("Here1")
        cat("func",input$batsmanFunc,"\n")
        cat("Player",input$batsman,"\n")
        #file <- paste(input$player,".csv",sep="")
        
        #cat(file,"\n")
        
        
        
        analyzeBatsman(input$batsman,input$batsmanFunc)
        #updateSelectizeInput(session, 'player', choices = players, server = TRUE,selected="kumble")
        #updateSelectizeInput(session, 'func', choices = funcs1, server = TRUE,selected="Bowler's Avg Wickets at Ground")
        
        
        # If the user requested "All' plot the combined plot else draw the barplot
        
    })
    
    # Draw the plot
    output$bowlerPlot <- renderPlot({  
        cat("func",input$bowlerFunc,"\n")
        cat("Player",input$bowler,"\n")
        #file <- paste(input$player,".csv",sep="")
        filesp <- paste(input$player,"sp.csv",sep="")
        #cat(file,"\n")
        
        
        
        analyzeBowler(input$bowler,input$bowlerFunc)
        #updateSelectizeInput(session, 'player', choices = players, server = TRUE,selected="kumble")
        #updateSelectizeInput(session, 'func', choices = funcs1, server = TRUE,selected="Bowler's Avg Wickets at Ground")
        
        
        # If the user requested "All' plot the combined plot else draw the barplot
        
    })
    
    output$relBatsmanPlot <- renderPlot({  
        cat("func",input$batsmenFunc,"\n")
        cat("Player",input$batsmen,"\n")
        #file <- paste(input$player,".csv",sep="")
        filesp <- paste(input$player,"sp.csv",sep="")
        #cat(file,"\n")
        
        
        
        relBatsmenPerf(input$batsmen,input$batsmenFunc)
        #updateSelectizeInput(session, 'player', choices = players, server = TRUE,selected="kumble")
        #updateSelectizeInput(session, 'func', choices = funcs1, server = TRUE,selected="Bowler's Avg Wickets at Ground")
        
        
        # If the user requested "All' plot the combined plot else draw the barplot
        
    })
    
    
    
})
