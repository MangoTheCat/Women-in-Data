library(shiny)

fluidPage(
  
  # Define the header for the page
  titlePanel("Render Plot in a Shiny App"),
  
  # Set up the page to have a sidebar
  sidebarLayout(
    # Define the contents of the sidebar
    sidebarPanel(
      numericInput("numberInput", "Select size of data:", min = 0, max = 500, value = 100),
      selectInput("colInput", "Select a colour", choices = c("red", "yellow", "blue", "green"))
    ),
    
    # Define the contents of the main panel
    mainPanel(
      plotOutput("plotOutput")
    )
  )
  
)
