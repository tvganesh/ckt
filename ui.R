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
                                           "batsman", label = "Players", choices = NULL,multiple=FALSE,selected="tendulkar",
                                           options = list(create = TRUE,placeholder = 'Choose the player')
                                           
                                       ),
                                       selectizeInput(
                                           "batsmanFunc", label = "Choose chart type", choices = NULL,multiple=FALSE,selected="4s of batsman",
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
                   tabPanel("Component 3")
                   
))
