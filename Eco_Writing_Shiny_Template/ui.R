#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    https://shiny.posit.co/
#

library(shiny)
library(bslib)
library(ggplot2)

# Define UI for application that draws a histogram
fluidPage(
  navbarPage("My Prompts",
    theme = bs_theme(version = 5, bootswatch = "minty"),
    tabPanel(
      "Title of Tab",
      card(
        card_header("What am I looking at?"),
        p("background")
      ),
      layout_columns(
        card(
          card_header("Card 1 header"),
          p("Card 1 body"),
          ### put interactive widget here
          radioButtons(
            "var", "Which distribution's data to plot:",
            c(
              "Normal" = "x",
              "Poisson" = "y"
            )
          ),
          plotOutput(outputId = "distPlot")
          ### put output plot here
        ),
        card(
          card_header("Card 2 header"),
          p("Card 2 body"),
          textAreaInput("text", "Add text", "", height = "600px", width = "600px"),
          downloadButton("downloadText", "Download Text"),
        ),
      ),
      card(
        card_header("Prompts"),
        p("prompts here")
      )
    ),
    tabPanel(
      "If you want another tab",
      card(
        card_header("What am I looking at?"),
        p("background")
      ),
      layout_columns(
        card(
          card_header("Card 1 header"),
          p("Card 1 body"),
          ### put interactive widget here
          ### put output plot here
        ),
        card(
          card_header("Card 2 header"),
          p("Card 2 body"),
          textAreaInput("text2", "Add text", "", height = "600px", width = "600px"),
          downloadButton("downloadText2", "Download Text"),
        ),
      ),
      card(
        card_header("Prompts"),
        p("prompts here")
      )
    )
  )
)
