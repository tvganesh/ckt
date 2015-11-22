analyzeBatsman <- function(batsman,func,matchType) {
   
    # Update the drop down with all batsman
    
    if(matchType == "Test") {
        file <- paste("./data/test/batsman/",batsman,".csv",sep="")
        filesp <- paste("./data/test/batsman/",batsman,"sp.csv",sep="")
        print(file)
    } else if(matchType == "ODI"){
        file <- paste("./data/odi/batsman/",batsman,".csv",sep="")
        filesp <- paste("./data/odi/batsman/",batsman,"sp.csv",sep="")
        print(file)
    } else {
        file <- paste("./data/tt/batsman/",batsman,".csv",sep="")
        filesp <- paste("./data/tt/batsman/",batsman,"sp.csv",sep="")
        print(file)
    }
    
    if(func =="4s & 6s of batsman"){
        batsman4s6s(file,batsman)
    } else if (func == "4s of batsman"){
        batsman4s(file,batsman)
    } else if (func == "6s of batsman"){
        batsman6s(file,batsman)
    } else if (func == "Ground avg of batsman"){
        batsmanAvgRunsGround(file,batsman)
    } else if (func == "Avg runs scored vs opposition"){
        batsmanAvgRunsOpposition(file,batsman)
    } else if (func == "Contribution to wins & losses"){
        batsmanContributionWonLost(filesp,batsman)
    } else if (func == "Batsman's dismissals"){
        batsmanDismissals(file,batsman)
    } else if (func == "Batsman's Mean Strike Rate"){
        if(matchType == "Test"){
            batsmanMeanStrikeRate(file,batsman)
        } else if (matchType == "ODI"){
            batsmanScoringRateODTT(file,batsman)
        }
    } else if (func == "Batsman's Moving Average"){
        batsmanMovingAverage(file,batsman)
    }  else if (func == "Batsman's Perf BoxHist chart"){
        batsmanPerfBoxHist(file,batsman)
    }  else if (func == "Batsman Perf. Forecast"){
        batsmanPerfForecast(file,batsman)
    } else if (func == "Batsman's Home-Away record"){
        batsmanPerfHomeAway(filesp,batsman)
    }  else if (func == "Batsman Runs-Freq. chart"){
        batsmanRunsFreqPerf(file,batsman)
    } else if (func == "Batsman Runs Likelihood est."){
        batsmanRunsLikelihood(file,batsman)
    }  else if (func == "Batsman Run Ranges"){
        batsmanRunsRanges(file,batsman)
    }  else if (func == "Batsman Perf. 3-D"){
        battingPerf3d(file,batsman)
    }   else if (func == "Check batsman form status"){
        checkBatsmanInForm(file,batsman)
    } else if (func == "batsman6s"){
        batsman6s(file,batsman)
    } else {
        
    }
    
}