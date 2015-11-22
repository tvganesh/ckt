relBowlersPerf <- function(bowlers,func,matchType) {
    
    file <- NULL
    if(matchType == "Test") {
        
        for(i in 1:length(bowlers)){
            
            file[i] <- paste("./data/test/bowler/",bowlers[i],".csv",sep="")
            
        }
    } else if (matchType == "ODI"){
        for(i in 1:length(bowlers)){
            
            file[i] <- paste("./data/odi/bowler/",bowlers[i],".csv",sep="")
            
        }
    }
    cat(file)
    
    
    cat(file)
    if(matchType == "Test"){
        if(func =="relativeBowlingER"){
            relativeBowlingER(file,bowlers)
        }
        if (func == "relativeBowlingPerf"){
            relativeBowlingPerf(file,bowlers)
        } 
        
    } 
    
    
    if(matchType == "ODI" || matchType == "TT") {
        if(func =="relativeBowlingERODTT"){
            relativeBowlingERODTT(file,bowlers)
        }
        if (func == "relativeBowlingPerf"){
            relativeBowlingPerf(file,bowlers)
        } 
        if (func == "relativeBowlingPerf" && matchType == "TT"){
            
            relativeWktRateTT(file,bowlers)
        }
    }
}