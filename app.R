library(shiny)
library(stringr)

shinyApp(
  ui = fluidPage(
    "Hello there",
    textOutput("greeting")
  ),
  server = function(input, output, session) {
    observe({
      query <- parseQueryString(session$clientData$url_search)
      if (!is.null(query[['name']])) {
        output$greeting <- renderText({
       query[['name']]
        })
      }
    })
  }
)
