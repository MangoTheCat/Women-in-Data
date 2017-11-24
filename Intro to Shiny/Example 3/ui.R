library(shiny)

fluidPage(
  sidebarLayout(
    sidebarPanel(
      selectInput("selectInput", "Select from the 	dropdown:", choices = c("airquality", "iris", 	"mtcars"))
    ),
    mainPanel(
      dataTableOutput("dataOutput")
    )
  )
  
)

