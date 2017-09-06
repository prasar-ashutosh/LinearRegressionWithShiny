library(shiny)

shinyUI(fluidPage(
  
  # Application title
  titlePanel("Linear Regression Using Diamonds Data"),
  
  sidebarLayout(
    sidebarPanel(
      h4("Select Predictor and Color"),
      selectInput("var1", "Predictor:",
                  c("carat" = "carat",
                    "depth" = "depth",
                    "table" = "table",
                    "x" = "x",
                    "y" = "y",
                    "z" = "z")),
      
      selectInput("var2", "Color:",
                  c("cut" = "cut",
                    "color" = "color",
                    "clarity" = "clarity"))
    ),
    
    mainPanel(
      
      tabsetPanel(
        tabPanel("Documentation", 
                 h3("Using the application"),
                 hr(),
                 p("The application has a 'Side bar Panel' and two tabs - 'Documentation' and 'Plot'. The 'Side bar panel' has two select boxes - 'Predictor' and 'Color'."),
                 p("The application uses the diamonds data set from the R datasets packages. The below table shows first few rows of the diamonds data"),
                 tableOutput("diamondsData"),
                 p("The 'Plot' tab shows the following things : "),
                 tags$ol(
                   tags$li("A plot of diamond price (in SGD) Vs the 'Predictor' variable selected in the Side Bar Panel. The plot uses the 'Color' variable from the side bar panel to color different data points"),
                   tags$li("Fits a Linear Regression between Price and the Predictor Variable. It also shows the coefficients of the fit"),
                   tags$li("Shows the R Squared value of the fit to show a mesaure of Explained variation to Total variation")
                 ),
                 
                 tags$b("NOTE:"),
                 
                 tags$li("Predictor Variable in Side bar panel has all the continous variables from the diamonds data set. If you change the 'Predictor' variable in the Side bar panel, the plot (Price Vs Predictor) will change and a new linear regression model will be built for Price Vs Predictor"),
                 tags$li("Color Variable in Side bar panel has all the categorical variables from the diamonds data set. If you change the 'Color' variable in the Side bar panel, the color of the points in plot will change based on your selection"),
                 tags$li("Go to Plot tab and start to play with the Predictor and Color. You might have to wait for a few seconds to see the output")
                 ),
        tabPanel("Plot", 
                 textOutput("text0"),
                 plotOutput("distPlot"),
                 textOutput("text1"),
                 tableOutput("coeff"),
                 textOutput("text2")
                 )
      )
    )
  )
))
