#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    https://shiny.posit.co/
#


# Define server logic required to draw a histogram
function(input, output, session) {
  output$downloadText <- downloadHandler(
    filename = function() {
      paste("draft-", gsub(" ", "_", Sys.time()), ".txt", sep = "")
    },
    content = function(con) {
      writeLines(input$text, con)
    }
  )

  output$downloadText2 <- downloadHandler(
    filename = function() {
      paste("draft-", gsub(" ", "_", Sys.time()), ".txt", sep = "")
    },
    content = function(con) {
      writeLines(input$text2, con)
    }
  )

  output$distPlot <- renderPlot({
    data <- read.csv("data/sample_data.csv")

    print(head(data))
    ggplot(data, aes_string(x = input$var)) +
      geom_histogram() +
      theme_minimal()
  })
}
