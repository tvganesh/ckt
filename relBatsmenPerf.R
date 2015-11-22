relBatsmenPerf <- function(batsmen,func,matchType) {
    
    file <- NULL
    if(matchType == "Test") {
        
        for(i in 1:length(batsmen)){
        
              file[i] <- paste("./data/test/batsman/",batsmen[i],".csv",sep="")
        
        }
    } else if (matchType == "ODI"){
        for(i in 1:length(batsmen)){
            
            file[i] <- paste("./data/odi/batsman/",batsmen[i],".csv",sep="")
            
        }
    }
    cat(file)
    #file <- paste(batsmen,".csv",sep="")
    #filesp <- paste(batsmen,"sp.csv",sep="")
    
    cat(file)
    if(func =="relativeBatsmanSR"){
        relativeBatsmanSR(file,batsmen)
    } else if (func == "relativeRunsFreqPerf"){
        relativeRunsFreqPerf(file,batsmen)
    }
}