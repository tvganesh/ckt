relBatsmenPerf <- function(batsmen,func) {
    cat(length(batsmen))
    
    file <- paste(batsmen,".csv",sep="")
    #filesp <- paste(batsmen,"sp.csv",sep="")
    cat(file)
    if(func =="relativeBatsmanSR"){
        relativeBatsmanSR(file,batsmen)
    } else if (func == "relativeRunsFreqPerf"){
        relativeRunsFreqPerf(file,batsmen)
    }
}