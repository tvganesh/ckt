# Define UI for application that draws a histogram
shinyUI(navbarPage("cricketr analyzes Cricketers!",
                   tabPanel("Analyze batsman",
                            # Application title
                            titlePanel("Analyze batsman"),
                            
                            
                            fluidRow(
                                column(3,
                                       radioButtons("matchType", label = h3("Match type"),
                                                    choices = list("Test" = "Test",
                                                                   "ODI" = "ODI", 
                                                                   "Twenty20" = "TT"), 
                                                    inline=TRUE,
                                                    selected = "Test"),
                                       selectizeInput(
                                           "batsman", label = "Players", choices = NULL, multiple=FALSE,selected="tendulkar",
                                           options = list(create = TRUE,placeholder = 'Choose the player',size=12)
                                           
                                       ),
                                       selectizeInput(
                                           "batsmanFunc", label = "Choose chart type", choices = NULL, multiple=FALSE,selected="4s of batsman",
                                           options = list(create = TRUE,placeholder = 'Choose the chart')
                                           
                                       )
       
                                ),
                                
                                # Show a plot of the generated distribution        
                                column(6,
                                       plotOutput("batsmanPlot")
                                )                               
                            )
                   ),
                  tabPanel("Analyze bowlers",
                            # Application title
                            titlePanel("Analyze bowlers"),
                            
                            fluidRow(
                                column(3,
                                       radioButtons("matchType1", label = h3("Match type"),
                                                    choices = list("Test" = "Test",
                                                                   "ODI" = "ODI", 
                                                                   "Twenty20" = "TT"), 
                                                    inline=TRUE,
                                                    selected = "Test"),
                                       selectizeInput(
                                           "bowler", label = "Players", choices = NULL,multiple=FALSE,selected="tendulkar",
                                           options = list(create = TRUE,placeholder = 'Choose the player')
                                           
                                       ),
                                       selectizeInput(
                                           "bowlerFunc", label = "Chart type", choices = NULL,multiple=FALSE,selected="Assam",
                                           options = list(create = TRUE,placeholder = 'Choose the chart')
                                           
                                       )
                                       
                                       
                                ),
                                
                                # Show a plot of the generated distribution        
                                column(6,
                                       plotOutput("bowlerPlot")
                                )                               
                            )    
                           
                   ),
                  tabPanel("Relative performance batsman",
                           # Application title
                           titlePanel("Relative performance batsman"),
                           
                           fluidRow(
                               column(3,
                                      radioButtons("matchType3", label = h3("Match type"),
                                                   choices = list("Test" = "Test",
                                                                  "ODI" = "ODI", 
                                                                  "Twenty20" = "TT"), 
                                                   inline=TRUE,
                                                   selected = "Test"),
                                      selectizeInput(
                                          "batsmen", label = "Players", choices = NULL,multiple=TRUE,selected="tendulkar",
                                          options = list(create = TRUE,placeholder = 'Choose the player')
                                          
                                      ),
                                      selectizeInput(
                                          "batsmenFunc", label = "Chart type", choices = NULL,multiple=FALSE,selected="Assam",
                                          options = list(create = TRUE,placeholder = 'Choose the chart')
                                          
                                      )
                                      
                                      
                               ),
                               
                               # Show a plot of the generated distribution        
                               column(6,
                                      plotOutput("relBatsmenPlot")
                               )                               
                           )    
                           
                  ),
                  tabPanel("Relative performance of bowlers",
                           # Application title
                           titlePanel("Relative performance of bowlers"),
                           
                           fluidRow(
                               column(3,
                                      radioButtons("matchType4", label = h3("Match type"),
                                                   choices = list("Test" = "Test",
                                                                  "ODI" = "ODI", 
                                                                  "Twenty20" = "TT"), 
                                                   inline=TRUE,
                                                   selected = "Test"),
                                      selectizeInput(
                                          "bowlers", label = "Players", choices = NULL,multiple=TRUE,selected="tendulkar",
                                          options = list(create = TRUE,placeholder = 'Choose the player')
                                          
                                      ),
                                      selectizeInput(
                                          "bowlersFunc", label = "Chart type", choices = NULL,multiple=FALSE,selected="Assam",
                                          options = list(create = TRUE,placeholder = 'Choose the chart')
                                          
                                      )
                                      
                                      
                               ),
                               
                               # Show a plot of the generated distribution        
                               column(6,
                                      plotOutput("relBowlersPlot")
                               )                               
                           )    
                           
                  ),
                   tabPanel("About"),
                  h2("Sixer - cricketr's Shiny avatar"),
                  p("This Shiny app is based on the R package 'cricketr'. In this Shiny app, I use  the
                    cricketr package to analyze the performances of cricketers. cricketr can analyze batsman
                    and bowlers in all formats of the game namely Test, ODI and Twenty20."),
                  p("The R package 'cricketr' has been authored by Tinniam V Ganesh for analyzing  performances of cricketers
                    based on ESPN Cricinfo's Statsguru"),
                  p("This Shiny app 'Sixer' has been designed and developed by  Tinniam V Ganesh, Nov 2015"),
                  p("The data for this Shiny app has been taken from ESPN Cricinfo - http://www.espncricinfo.com/ci/content/stats/index.html"),
                  p("More details about this app and for other posts, see my blog
                    http://gigadom.wordpress.com/")
                   
))
