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
funcs <- c("batsman4s6s","batsman4s","batsman6s","batsmanAvgRunsGround","batsmanAvgRunsOpposition",
           "batsmanContributionWonLost","batsmanDismissals","batsmanMeanStrikeRate","batsmanMovingAverage",
           "batsmanPerfBoxHist",'batsmanPerfForecast',"batsmanPerfHomeAway","batsmanRunsFreqPerf",
           "batsmanRunsLikelihood","batsmanRunsPredict","batsmanRunsRanges","battingPerf3d",
           "checkBatsmanInForm")
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
    
    updateSelectizeInput(session, 'func', choices = funcs, server = TRUE,selected="batsman4s6s")
    # Draw the plot
    output$distPlot <- renderPlot({  
        cat(input$func,"\n")
        cat(input$player,"\n")
        file <- paste(input$player,".csv",sep="")
        cat(file,"\n")
        funcs <- c("batsman4s6s","batsman4s","batsman6s","batsmanAvgRunsGround","batsmanAvgRunsOpposition",
                   "batsmanContributionWonLost","batsmanDismissals","batsmanMeanStrikeRate","batsmanMovingAverage",
                   "batsmanPerfBoxHist",'batsmanPerfForecast',"batsmanPerfHomeAway","batsmanRunsFreqPerf",
                   "batsmanRunsLikelihood","batsmanRunsPredict","batsmanRunsRanges","battingPerf3d",
                   "checkBatsmanInForm")
        if(input$func =="batsman4s6s"){
            batsman4s6s(file,"tendulkar")
        } else if (input$func == "batsman4s"){
            batsman4s(file,"Tendulkar")
        } else if (input$func == "batsmanAvgRunsGround"){
            batsmanAvgRunsGround(file,"Tendulkar")
        } else if (input$func == "batsmanAvgRunsOpposition"){
            batsmanAvgRunsOpposition(file,"Tendulkar")
        } else if (input$func == "batsmanContributionWonLost"){
            batsmanContributionWonLost(file,"Tendulkar")
        } else if (input$func == "batsmanDismissals"){
            batsmanDismissals(file,"Tendulkar")
        } else if (input$func == "batsmanMeanStrikeRate"){
            batsmanMeanStrikeRate(file,"Tendulkar")
        } else if (input$func == "batsmanMovingAverage"){
            batsmanMovingAverage(file,"Tendulkar")
        }  else if (input$func == "batsmanPerfBoxHist"){
            batsmanPerfBoxHist(file,"Tendulkar")
        }  else if (input$func == "batsmanPerfForecast"){
            batsmanPerfForecast(file,"Tendulkar")
        } else if (input$func == "batsmanPerfHomeAway"){
            batsmanPerfHomeAway(file,"Tendulkar")
        }  else if (input$func == "batsmanRunsFreqPerf"){
            batsmanRunsFreqPerf(file,"Tendulkar")
        } else if (input$func == "batsmanRunsLikelihood"){
            batsmanRunsLikelihood(file,"Tendulkar")
        }  else if (input$func == "batsmanRunsRanges"){
            batsmanRunsRanges(file,"Tendulkar")
        }   else if (input$func == "batsmanRunsPredict"){
            batsmanRunsPredict(file,"Tendulkar")
        }   else if (input$func == "battingPerf3d"){
            battingPerf3d(file,"Tendulkar")
        }   else if (input$func == "checkBatsmanInForm"){
            checkBatsmanInForm(file,"Tendulkar")
        } else if (input$func == "batsman6s"){
            batsman6s(file,"Tendulkar")
        }         
        # If the user requested "All' plot the combined plot else draw the barplot
        
    })
    
    
    
    
})
