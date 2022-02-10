library(shiny)
library(fpp3)
data("tourism")

data <- subset(tourism, Region=="Alice Springs")

ui <- fluidPage(
  selectInput(
    inputId = "region",
    label="Select Region",
    choice=unique(tourism$Region)
  ),
plotOutput("plotted_series")
)

server <- function(input, output, session) {
  output$plotted_series <- renderPlot({
    
  })
  
  
}

shinyApp(ui, server)