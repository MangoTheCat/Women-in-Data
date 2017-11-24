library(shiny)

fluidPage(
  
  sidebarLayout(
    sidebarPanel(
      selectInput("selectInput", "Select column:", choices = colnames(mtcars))
    ),
    mainPanel(
      plotOutput("plotOutput")
    )
  )
  
)

