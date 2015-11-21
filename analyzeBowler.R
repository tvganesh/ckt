analyzeBowler <- function(bowler,func) {
    file <- paste(bowler,".csv",sep="")
    cat(file)
   
        
        
        if(func =="Bowler's Avg Wickets at Ground"){
            print("Here1")
            bowlerAvgWktsGround(file,"kumble")
        } else if (func == "Bowler's Avg Wicket against opposition"){
            bowlerAvgWktsOpposition(file,"kumble")
        } else if (func == "Contribution to wins & losses"){
            bowlerContributionWonLost(file,"kumble")
        } else if (func == "Bowler's Econonmy Rate"){
            selected="Bowler's Econonmy Rate"
            bowlerEconRate(file,"kumble")
        } else if (func == "Bowler's Histogram of Wickets"){
            bowlerHistWickets(file,"kumble")
        } else if (func == "Bowler's Moving Average"){
            bowlerMovingAverage(file,"kumble")
        } else if (func == "Bowler's Perf. Forecast"){
            bowlerPerfForecast(file,"kumble")
        } else if (func == "Bowler's Perf. Home-Away"){
            bowlerPerfHomeAway(file,"kumble")
        } else if (func == "Bowler's Wickets-Runs plot"){
            bowlerWktsRunsPlot(file,"kumble")
        } else if (func == "Bowler's Wickets Freq Percent"){
            bowlerWktsFreqPercent(file,"kumble")
        } else if (func == "Bowler's Wickets-Runs plot"){
            bowlerWktsRunsPlot(file,"kumble")
        } else if (func == "Check Bowler Form status"){
            checkBowlerInForm(file,"kumble")
        } 
        
}   