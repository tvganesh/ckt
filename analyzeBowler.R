analyzeBowler <- function(bowler,func) {
    file <- paste(bowler,".csv",sep="")
    filesp <- paste(bowler,"sp.csv",sep="")
    cat(file)
   
        
        
        if(func =="Bowler's Avg Wickets at Ground"){
            print("Here1")
            bowlerAvgWktsGround(file,bowler)
        } else if (func == "Bowler's Avg Wicket against opposition"){
            bowlerAvgWktsOpposition(file,bowler)
        } else if (func == "Contribution to wins & losses"){
            bowlerContributionWonLost(filesp,bowler)
        } else if (func == "Bowler's Economy Rate"){
            bowlerEconRate(file,bowler)
        } else if (func == "Bowler's Wickets performance"){
            bowlerHistWickets(file,bowler)
        } else if (func == "Bowler's Moving Average"){
            bowlerMovingAverage(file,bowler)
        } else if (func == "Bowler's Perf. Forecast"){
            bowlerPerfForecast(file,bowler)
        } else if (func == "Bowler's Perf. Home-Away"){
            bowlerPerfHomeAway(filesp,bowler)
        } else if (func == "Bowler's Wickets-Runs plot"){
            bowlerWktsRunsPlot(file,bowler)
        } else if (func == "Bowler's Wickets Freq Percent"){
            bowlerWktsFreqPercent(file,bowler)
        } else if (func == "Bowler's Wickets-Runs plot"){
            bowlerWktsRunsPlot(file,bowler)
        } else if (func == "Check Bowler Form status"){
            checkBowlerInForm(file,bowler)
        } 
        
}   