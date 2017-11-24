library(shiny)

function(input, output){
  
  output$plotOutput <- renderPlot(
    
    hist(x = mtcars[,input$selectInput],
         main = paste("Histogram of", input$selectInput),
         xlab = input$selectInput)
  )
  
  
}