library(shiny)
library(ggplot2)

shinyServer(function(input, output) {
   
  output$distPlot <- renderPlot({
  data("diamonds")
  #qplot(x=input$var1,y=price,data=diamonds);
  ggplot(data = diamonds,aes_string(x=input$var1, y="price",color=input$var2)) + geom_point() + geom_smooth(method = "lm")
  })
  
  runRegression <- reactive({
    lm(as.formula(paste(paste("price","~",input$var1))),data=diamonds)
  })
  
  output$coeff <- renderTable({
    details<-summary(runRegression())$coefficients
    as.data.frame(details)
  },include.rownames=TRUE)
  
  output$text0 <- renderText({
    paste("Plot of Diamond Price in SGD","Vs",input$var1)
  })
  
  output$text1 <- renderText({
    paste("Linear Regression of Price","~",input$var1)
  })
  
  output$text2 <- renderText({
    paste("R Squared Value",":",summary(runRegression())$r.squared)
  })
  
  output$diamondsData <- renderTable(head(diamonds,3))
  
  
})
