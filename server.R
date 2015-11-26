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
source("definitions.R")


shinyServer(function(input, output,session) {
   
    #updateSelectizeInput(session, 'batsman', choices = players, server = TRUE,selected="tendulkar")
    #updateSelectizeInput(session, 'batsmanFunc', choices = funcs, server = TRUE,selected="4s of batsman")
    
   
   
 
    # Analyze and display batsmen plots
    output$batsmanPlot <- renderPlot({  
        # Include the list to display in the drop downs on choice of matchType
        if(input$matchType == "Test"){
            
            updateSelectizeInput(session, 'batsman', choices = testBatsman, server = TRUE,selected=input$batsman)
            updateSelectizeInput(session, 'batsmanFunc', choices = funcs, server = TRUE,selected=input$batsmanFunc)
            
        } else if(input$matchType == "ODI"){
            
            updateSelectizeInput(session, 'batsman', choices = odiBatsman, server = TRUE,selected=input$batsman)
            updateSelectizeInput(session, 'batsmanFunc', choices = funcsODITT, server = TRUE,selected=input$batsmanFunc)
        
        } else {
            
            updateSelectizeInput(session, 'batsman', choices = ttBatsman, server = TRUE,selected=input$batsman)
            updateSelectizeInput(session, 'batsmanFunc', choices = funcsODITT, server = TRUE,selected=input$batsmanFunc)
        }
        print(input$batsman)
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
