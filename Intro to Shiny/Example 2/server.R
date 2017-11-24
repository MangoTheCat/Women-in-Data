library(shiny)

function(input, output){
  
  output$textOutput <- renderText(paste("You entered the text:", input$myTextInput))
  output$numberOutput <- renderText(paste("You selected the number:", input$myNumberInput))
  output$selectOutput <- renderText(paste("You selected option:", input$mySelectInput))
  
}