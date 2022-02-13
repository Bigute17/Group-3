library(shiny)
library(fpp3)
data("tourism")

data <- subset(tourism, Region=="Alice Springs")

ui <- fluidPage(
  selectInput(
   inputId = "purpose",
    label="Select Purpose",
    choice=unique(tourism$Purpose),
   multiple = FALSE
  ),
plotOutput("plotted_series")
)

server <- function(input, output, session) {
  output$plotted_series <- renderPlot({ autoplot(data[data$Purpose==input$purpose,])
    
  })
  
  output$purpose <- renderPrint({
    if(input$purpose){
      input$plotted_series
    }
  })
  
}

shinyApp(ui, server)