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

source("analyzeBatsman.R")
source("analyzeBowler.R")
source("relBatsmenPerf.R")
source("relBowlersPerf.R")

# Function names for Test  batsman analysis
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

# Function names for ODI & Twetnty20 batsman analysis
funcsODITT <- c("4s of batsman",
           "6s of batsman",
           "4s & 6s of batsman",
           "Batsman's dismissals",
           "batsmanScoringRateODTT",
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

# Function names for Test bowler analysis
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

# Function names for ODI and Twenty20  bowler analysis
funcs1ODITT <- c("Bowler's Wickets-Runs plot",
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

batsmanScoringRateODTT
#bowlerWktRateTT

funcOD <- c("batsmanScoringRateODTT","bowlerWktsFreqPercent","bowlerWktsRunsPlot")
funcRelBat <- c("relativeBatsmanSR","relativeRunsFreqPerf")
funcRelBowlTest <- c("relativeBowlingER","relativeBowlingPerf")
funcRelOD <-c("relativeBatsmanSRODTT","relativeRunsFreqPerfODTT")
funcRelBowlERODTT <- c("relativeBowlingPerf","relativeBowlingERODTT","relativeWktRateTT")


shinyServer(function(input, output,session) {
   
    #updateSelectizeInput(session, 'batsman', choices = players, server = TRUE,selected="tendulkar")
    #updateSelectizeInput(session, 'batsmanFunc', choices = funcs, server = TRUE,selected="4s of batsman")
    
   
    
 
    # Analyze and display batsmen plots
    output$batsmanPlot <- renderPlot({  
        # Include the list to display in the drop downs on choice of matchType
        if(input$matchType == "Test"){
            players <- c("tendulkar","Dravid","ponting","sangakkara")
            updateSelectizeInput(session, 'batsman', choices = players, server = TRUE,selected=input$batsman)
            updateSelectizeInput(session, 'batsmanFunc', choices = funcs, server = TRUE,selected=input$batsmanFunc)
            
        } else {
            players <- c("devilliers","gayle","sehwag")
            updateSelectizeInput(session, 'batsman', choices = players, server = TRUE,selected=input$batsman)
            updateSelectizeInput(session, 'batsmanFunc', choices = funcs, server = TRUE,selected=input$batsmanFunc)
        }
        analyzeBatsman(input$batsman,input$batsmanFunc,input$matchType)
        
    })
    
    # Analyze and display bowler's plots
    output$bowlerPlot <- renderPlot({  
        
        
        if(input$matchType1 == "Test"){
            players <- c("kumble","warne","murali")
            updateSelectizeInput(session, 'bowler', choices = players, server = TRUE,selected=input$bowler)
            updateSelectizeInput(session, 'bowlerFunc', choices = funcs1, server = TRUE,selected=input$bowlerFunc)
            
        } else {
            players <- c("malinga","johnson","southee")
            updateSelectizeInput(session, 'bowler', choices = players, server = TRUE,selected=input$bowler)
            updateSelectizeInput(session, 'bowlerFunc', choices = funcs1, server = TRUE,selected=input$bowlerFunc)
        }
        
        analyzeBowler(input$bowler,input$bowlerFunc,input$matchType1)
        
        
    })
    
    output$relBatsmenPlot <- renderPlot({  
        if(input$matchType3 == "Test"){
            players <- c("tendulkar","Dravid","ponting","sangakkara")
            updateSelectizeInput(session, 'batsmen', choices = players, server = TRUE,selected=input$batsmen)
            updateSelectizeInput(session, 'batsmenFunc', choices = funcRelBat, server = TRUE,selected=input$batsmenFunc)
            
        } else {
            players <- c("devilliers","gayle","sehwag")
            updateSelectizeInput(session, 'batsmen', choices = players, server = TRUE,selected=input$batsmen)
            updateSelectizeInput(session, 'batsmenFunc', choices = funcRelBat, server = TRUE,selected=input$batsmenFunc)
        }
        
        #cat("func",input$batsmenFunc,"\n")
        #cat("Player",input$batsmen,"\n")
        #file <- paste(input$player,".csv",sep="")
        #filesp <- paste(input$player,"sp.csv",sep="")
        #cat(file,"\n")
        
        
        if(length(input$batsmen != 0)){
             relBatsmenPerf(input$batsmen,input$batsmenFunc,input$matchType3)
        }
        #updateSelectizeInput(session, 'player', choices = players, server = TRUE,selected="kumble")
        #updateSelectizeInput(session, 'func', choices = funcs1, server = TRUE,selected="Bowler's Avg Wickets at Ground")
        
        
        # If the user requested "All' plot the combined plot else draw the barplot
        
    })
    
    # Set the drop down players, functions based on the match type
    output$relBowlersPlot <- renderPlot({  
        if(input$matchType4 == "Test"){
            players <- c("murali","warne","kumble")
            updateSelectizeInput(session, 'bowlers', choices = players, server = TRUE,selected=input$bowlers)
            updateSelectizeInput(session, 'bowlersFunc', choices = funcRelBowlTest, server = TRUE,selected=input$bowlersFunc)
            
        } else {
            players <- c("johnson","steyn","southee")
            updateSelectizeInput(session, 'bowlers', choices = players, server = TRUE,selected=input$bowlers)
            updateSelectizeInput(session, 'bowlersFunc', choices = funcRelBowlERODTT, server = TRUE,selected=input$bowlersFunc)
        }
        
        
        
        
        if(length(input$bowlers != 0)){
            
            relBowlersPerf(input$bowlers,input$bowlersFunc,input$matchType4)
        }
        

        
        
        #updateSelectizeInput(session, 'player', choices = players, server = TRUE,selected="kumble")
        #updateSelectizeInput(session, 'func', choices = funcs1, server = TRUE,selected="Bowler's Avg Wickets at Ground")
        
        
        # If the user requested "All' plot the combined plot else draw the barplot
        
    })
    
    
})
