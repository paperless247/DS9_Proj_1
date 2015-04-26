library(shiny)

shinyUI(
  navbarPage("Analyzing MPG Performance vs Automobile Design",
             
             tabPanel("Analysis",
                      fluidPage(
                        titlePanel("Miles per gallon (MPG) vs Design Variable"),
                        sidebarLayout(
                          sidebarPanel(
                            selectInput("variable", "Design Variable:",
                                        c("Number of cylinders" = "cyl",
                                          "Displacement (cu.in.)" = "disp",
                                          "Gross horsepower" = "hp",
                                          "Rear axle ratio" = "drat",
                                          "Weight (lb/1000)" = "wt",
                                          "1/4 mile time" = "qsec",
                                          "V/S" = "vs",
                                          "Transmission" = "am",
                                          "Number of forward gears" = "gear",
                                          "Number of carburetors" = "carb"
                                        )),
                            
                            checkboxInput("outliers", "Show BoxPlot's outliers", TRUE)
                          ),
                          
                          mainPanel(
                            h3(textOutput("caption")),
                            
                            tabsetPanel(type = "tabs", 
                                        tabPanel("BoxPlot", plotOutput("mpgBoxPlot")),
                                        tabPanel("Regression model", 
                                                 plotOutput("mpgPlot"),
                                                 verbatimTextOutput("fit")
                                        )
                            )
                          )
                        )
                      )
             ),

             tabPanel("Dataset",
                      h2("Motor Trend mtcars Dataset"),
                      hr(),
                      h3("Description"),
                      helpText("The mtcars data was extracted from the 1974 Motor Trend US magazine,",
                               " and comprises fuel consumption and 10 aspects of automobile design and performance."),
                      h3("Variables"),
                      p("There are 32 observations on 11 variables:"),
                      
                      p("  [ 1]  mpg, Miles/(US) gallon"),
                      p("  [ 2]  cyl, Number of cylinders"),
                      p("  [ 3]	 disp, Displacement (cu.in.)"),
                      p("  [ 4]	 hp, Horsepower"),
                      p("  [ 5]	 drat, Rear axle ratio"),
                      p("  [ 6]	 wt, Weight (lb/1000)"),
                      p("  [ 7]	 qsec, 1/4 mile time"),
                      p("  [ 8]	 vs, V/S"),
                      p("  [ 9]	 am, Transmission (0 = automatic, 1 = manual)"),
                      p("  [10]	 gear, Number of forward gears"),
                      p("  [11]	 carb, Number of carburetors")
             ),
             
             tabPanel("Github repository",
                      a("https://github.com/paperless247/DS9_Proj_1"),
                      hr(),
                      h3("Thank you for reading and grading!")
             )
  )
)