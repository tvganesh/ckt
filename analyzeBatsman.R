analyzeBatsman <- function(name,func,matchType) {
   
    # Update the drop down with all batsman
    batsman <- mapBatsman(name)
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
        batsman4s6s(file,name)
    } else if (func == "4s of batsman"){
        batsman4s(file,name)
    } else if (func == "6s of batsman"){
        batsman6s(file,name)
    } else if (func == "Ground avg of batsman"){
        batsmanAvgRunsGround(file,name)
    } else if (func == "Avg runs scored vs opposition"){
        batsmanAvgRunsOpposition(file,batsman)
    } else if (func == "Contribution to wins & losses"){
        batsmanContributionWonLost(filesp,name)
    } else if (func == "Batsman's dismissals"){
        batsmanDismissals(file,name)
    } else if (func == "Batsman's Mean Strike Rate"){
        if(matchType == "Test"){
            batsmanMeanStrikeRate(file,name)
        } else if (matchType == "ODI"){
            batsmanScoringRateODTT(file,name)
        }
    } else if (func == "Batsman's Moving Average"){
        batsmanMovingAverage(file,name)
    }  else if (func == "Batsman's Perf BoxHist chart"){
        batsmanPerfBoxHist(file,name)
    }  else if (func == "Batsman Perf. Forecast"){
        batsmanPerfForecast(file,name)
    } else if (func == "Batsman's Home-Away record"){
        batsmanPerfHomeAway(filesp,name)
    }  else if (func == "Batsman Runs-Freq. chart"){
        batsmanRunsFreqPerf(file,name)
    } else if (func == "Batsman Runs Likelihood est."){
        batsmanRunsLikelihood(file,name)
    }  else if (func == "Batsman Run Ranges"){
        batsmanRunsRanges(file,name)
    }  else if (func == "Batsman Perf. 3-D"){
        battingPerf3d(file,name)
    }   else if (func == "Check batsman form status"){
        checkBatsmanInForm(file,name)
    } else if (func == "batsman6s"){
        batsman6s(file,name)
    } else {
        
    }
    
}

mapBatsman <- function(name){
    batsman <- NULL
    if(name == "Sachin Tendulkar"){
        batsman <- "tendulkar"
    } else if (name == "Rahul Dravid"){
        batsman = "dravid"
    } else if (name == "Ricky Ponting"){
        batsman = "ponting"
    } else if (name == "Kumar Sangakkara"){
        batsman = "sangakkara"
    } else if (name == "Jacques Kallis"){
        batsman = "kallis"
    } else if (name == "Sunil Gavaskar"){
        batsman = "gavaskar"
    } else if (name == "Sourav Ganguly"){
        batsman = "ganguly"
    } else if (name == "Brian Lara"){
        batsman = "lara"
    }else if (name == "Vivian Ricjards"){
        batsman = "richards"
    } else if (name == "Sir Don Bradman"){
        batsman = "bradman"
    } else if (name == "Younis Khan"){
        batsman = "younis"
    } else if (name == "Javed Miandad"){
        batsman = "miandad"
    } else if (name == "Inzamam Ul Haq"){
        batsman = "inzamam"
    } else if (name == "Mahela Jayawardene"){
        batsman = "jayawardene"
    } else if (name == "Sanath Jayasuriya"){
        batsman = "jayasuriya"
    } else if (name == "Alistair Cook"){
        batsman = "cook"
    } else if (name == "J E Root"){
        batsman = "root"
    } else if (name == "Steven Smith"){
        batsman = "smith"
    } else if (name == "David Warner"){
        batsman = "warner"
    }
    batsman
}