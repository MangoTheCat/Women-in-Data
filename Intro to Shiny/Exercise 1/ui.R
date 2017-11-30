library(shiny)

fluidPage(
  
  # Define the header for the page
  titlePanel("Exercise 1"),
  
  # Set up the page to have a sidebar
  sidebarLayout(
    # Define the contents of the sidebar
    sidebarPanel(
      dateInput("dateInput", "Select date")
    ),
    
    # Define the contents of the main panel
    mainPanel(
      textOutput("dateOutput")
    )
  )
)
