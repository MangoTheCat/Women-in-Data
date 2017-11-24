library(shiny)

fluidPage(
  
  titlePanel("My First Shiny Application"),  # Add title
  
  sidebarLayout(
    
    sidebarPanel(
      
      textInput(inputId = "TXT", label = "Enter text here:", value = "Welcome to Women in Data!")
      
    ), #Add sidebar
    
    mainPanel( 
      
      textOutput(outputId = "myTextOutput")
      
    ) # Add the main panel
    
  ) # Close side layout
  
) # Close page


