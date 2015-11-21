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
library(cricketr)


tendulkar <- read.csv("tendulkar.csv")
print(dim(tendulkar))

players <- c("tendulkar","dravid")
funcs <- c("4s of batsman","6s of batsman",
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

func1 <- c("bowlerAvgWktsGround","bowlerAvgWktsOpposition","bowlerContributionWonLost","bowlerEconRate",
           "bowlerHistWickets","bowlerMovingAverage","bowlerPerfForecast","bowlerPerfHomeAway",
           "bowlerWktRateTT","checkBowlerInForm")

funcOD <- c("batsmanScoringRateODTT","bowlerWktsFreqPercent","bowlerWktsRunsPlot")
funRelBat <- c("relativeBatsmanSR","relativeBatsmanSRODTT","relativeRunsFreqPerf")
funcRelBowl <- c("relativeBowlingER","relativeBowlingPerf","relativeWktRateTT")
funcRelOD <-c("relativeBatsmanSRODTT","relativeRunsFreqPerfODTT")
funcRelBowlERODTT <- ("relativeBowlingERODTT")
shinyServer(function(input, output,session) {
    
    # 1. State plot
    # Update the drop down with all states
    updateSelectizeInput(session, 'player', choices = players, server = TRUE,selected="tendulkar")
    
    updateSelectizeInput(session, 'func', choices = funcs, server = TRUE,selected="4s of batsman")
    # Draw the plot
    output$distPlot <- renderPlot({  
        cat(input$func,"\n")
        cat(input$player,"\n")
        file <- paste(input$player,".csv",sep="")
        filesp <- paste(input$player,"sp.csv",sep="")
        cat(file,"\n")
       
        if(input$func =="4s & 6s of batsman"){
            batsman4s6s(file,"tendulkar")
        } else if (input$func == "4s of batsman"){
            batsman4s(file,"Tendulkar")
        } else if (input$func == "6s of batsman"){
            batsman6s(file,"Tendulkar")
        } else if (input$func == "Ground avg of batsman"){
            batsmanAvgRunsGround(file,"Tendulkar")
        } else if (input$func == "Avg runs scored vs opposition"){
            batsmanAvgRunsOpposition(file,"Tendulkar")
        } else if (input$func == "Contribution to wins & losses"){
            batsmanContributionWonLost(filesp,"Tendulkar")
        } else if (input$func == "Batsman's dismissals"){
            batsmanDismissals(file,"Tendulkar")
        } else if (input$func == "Batsman's Mean Strike Rate"){
            batsmanMeanStrikeRate(file,"Tendulkar")
        } else if (input$func == "Batsman's Moving Average"){
            batsmanMovingAverage(file,"Tendulkar")
        }  else if (input$func == "Batsman's Perf BoxHist chart"){
            batsmanPerfBoxHist(file,"Tendulkar")
        }  else if (input$func == "Batsman Perf. Forecast"){
            batsmanPerfForecast(file,"Tendulkar")
        } else if (input$func == "Batsman's Home-Away record"){
            batsmanPerfHomeAway(filesp,"Tendulkar")
        }  else if (input$func == "Batsman Runs-Freq. chart"){
            batsmanRunsFreqPerf(file,"Tendulkar")
        } else if (input$func == "Batsman Runs Likelihood est."){
            batsmanRunsLikelihood(file,"Tendulkar")
        }  else if (input$func == "Batsman Run Ranges"){
            batsmanRunsRanges(file,"Tendulkar")
        }  else if (input$func == "Batsman Perf. 3-D"){
            battingPerf3d(file,"Tendulkar")
        }   else if (input$func == "Check batsmanI form status"){
            checkBatsmanInForm(file,"Tendulkar")
        } else if (input$func == "batsman6s"){
            batsman6s(file,"Tendulkar")
        }         
        # If the user requested "All' plot the combined plot else draw the barplot
        
    })
    
    
    
    
})
