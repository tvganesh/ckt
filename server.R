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
           
            updateSelectizeInput(session, 'bowler', choices = testBowler, server = TRUE,selected=input$bowler)
            updateSelectizeInput(session, 'bowlerFunc', choices = funcs1, server = TRUE,selected=input$bowlerFunc)
            
        } else if(input$matchType1 == "ODI"){
            
            updateSelectizeInput(session, 'bowler', choices = odiBowler, server = TRUE,selected=input$bowler)
            updateSelectizeInput(session, 'bowlerFunc', choices = funcs1ODI, server = TRUE,selected=input$bowlerFunc)
        
        } else {
            updateSelectizeInput(session, 'bowler', choices = ttBowler, server = TRUE,selected=input$bowler)
            updateSelectizeInput(session, 'bowlerFunc', choices = funcs1TT, server = TRUE,selected=input$bowlerFunc)
        }
        
        analyzeBowler(input$bowler,input$bowlerFunc,input$matchType1)
        
        
    })
    
    output$relBatsmenPlot <- renderPlot({  
        if(input$matchType3 == "Test"){
          
            updateSelectizeInput(session, 'batsmen', choices = testBatsman, server = TRUE,selected=input$batsmen)
            updateSelectizeInput(session, 'batsmenFunc', choices = funcsRelBatsman, server = TRUE,selected=input$batsmenFunc)
            
        } else if(input$matchType3 == "ODI"){
           
            updateSelectizeInput(session, 'batsmen', choices = odiBatsman, server = TRUE,selected=input$batsmen)
            updateSelectizeInput(session, 'batsmenFunc', choices = funcsRelBatsman, server = TRUE,selected=input$batsmenFunc)
        } else {
            
            updateSelectizeInput(session, 'batsmen', choices = ttBatsman, server = TRUE,selected=input$batsmen)
            updateSelectizeInput(session, 'batsmenFunc', choices = funcsRelBatsman, server = TRUE,selected=input$batsmenFunc)
        }
       
        if(length(input$batsmen != 0)){
             relBatsmenPerf(input$batsmen,input$batsmenFunc,input$matchType3)
        }
       
        
    })
    
    # Set the drop down players, functions based on the match type
    output$relBowlersPlot <- renderPlot({  
        if(input$matchType4 == "Test"){
            updateSelectizeInput(session, 'bowlers', choices = testBowler, server = TRUE,selected=input$bowlers)
            updateSelectizeInput(session, 'bowlersFunc', choices = funcsRelBowlerTestODI, server = TRUE,selected=input$bowlersFunc)
            
        } else if(input$matchType4 == "ODI"){
            updateSelectizeInput(session, 'bowlers', choices = odiBowler, server = TRUE,selected=input$bowlers)
            updateSelectizeInput(session, 'bowlersFunc', choices = funcsRelBowlerTestODI, server = TRUE,selected=input$bowlersFunc)
        
        } else {
            updateSelectizeInput(session, 'bowlers', choices = ttBowler, server = TRUE,selected=input$bowlers)
            updateSelectizeInput(session, 'bowlersFunc', choices = funcsRelBowlerTT, server = TRUE,selected=input$bowlersFunc)
        }
        
        
        if(length(input$bowlers != 0)){
            
            relBowlersPerf(input$bowlers,input$bowlersFunc,input$matchType4)
        }
        

        
        
        #updateSelectizeInput(session, 'player', choices = players, server = TRUE,selected="kumble")
        #updateSelectizeInput(session, 'func', choices = funcs1, server = TRUE,selected="Bowler's Avg Wickets at Ground")
        
        
        # If the user requested "All' plot the combined plot else draw the barplot
        
    })
    
    
})
