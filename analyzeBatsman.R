analyzeBatsman <- function(batsman,func) {
 
    
    file <- paste(batsman,".csv",sep="")
    cat(file)
    #updateSelectizeInput(session, 'player', choices = players, server = TRUE,selected="kumble")
    #updateSelectizeInput(session, 'func', choices = funcs1, server = TRUE,selected="Bowler's Avg Wickets at Ground")
    
  
        # Update the drop down with all batsman
        
        
        file <- paste(batsman,".csv",sep="")
        cat(file)
        if(func =="4s & 6s of batsman"){
            batsman4s6s(file,"tendulkar")
        } else if (func == "4s of batsman"){
            batsman4s(file,"Tendulkar")
        } else if (func == "6s of batsman"){
            batsman6s(file,"Tendulkar")
        } else if (func == "Ground avg of batsman"){
            batsmanAvgRunsGround(file,"Tendulkar")
        } else if (func == "Avg runs scored vs opposition"){
            batsmanAvgRunsOpposition(file,"Tendulkar")
        } else if (func == "Contribution to wins & losses"){
            batsmanContributionWonLost(filesp,"Tendulkar")
        } else if (func == "Batsman's dismissals"){
            batsmanDismissals(file,"Tendulkar")
        } else if (func == "Batsman's Mean Strike Rate"){
            batsmanMeanStrikeRate(file,"Tendulkar")
        } else if (func == "Batsman's Moving Average"){
            batsmanMovingAverage(file,"Tendulkar")
        }  else if (func == "Batsman's Perf BoxHist chart"){
            batsmanPerfBoxHist(file,"Tendulkar")
        }  else if (func == "Batsman Perf. Forecast"){
            batsmanPerfForecast(file,"Tendulkar")
        } else if (func == "Batsman's Home-Away record"){
            batsmanPerfHomeAway(filesp,"Tendulkar")
        }  else if (func == "Batsman Runs-Freq. chart"){
            batsmanRunsFreqPerf(file,"Tendulkar")
        } else if (func == "Batsman Runs Likelihood est."){
            batsmanRunsLikelihood(file,"Tendulkar")
        }  else if (func == "Batsman Run Ranges"){
            batsmanRunsRanges(file,"Tendulkar")
        }  else if (func == "Batsman Perf. 3-D"){
            battingPerf3d(file,"Tendulkar")
        }   else if (func == "Check batsmanI form status"){
            checkBatsmanInForm(file,"Tendulkar")
        } else if (func == "batsman6s"){
            batsman6s(file,"Tendulkar")
        } else {
            
        }
    
}