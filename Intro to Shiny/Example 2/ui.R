library(shiny)

fluidPage(
  
  # Define the header for the page
  titlePanel("My First Shiny App!"),
  
  # Set up the page to have a sidebar
  sidebarLayout(
    
    # Define the contents of the sidebar
    sidebarPanel(
      textInput(inputId = "myTextInput", label  = "Enter text here:"),
      numericInput(inputId = "myNumberInput", label = "Select a number:", value = 50, min = 0, max = 100, step = 1),
      selectInput(inputId = "mySelectInput", label = "Select from the dropdown:", choices = LETTERS[1:10])
    ),
    
    # Define the contents of the main panel
    mainPanel(
      h4("Using HTML in Shiny"),
      p("This is a paragraph of text that is included in our main panel.", 
        strong("This text will be in bold.")),
      textOutput(outputId = "textOutput"),
      textOutput(outputId = "numberOutput"),
      textOutput(outputId = "selectOutput")
    )
    
  )
  
)