### Lesson is based on Dean Attali's Shiny Tutorial: https://deanattali.com/blog/building-shiny-apps-tutorial/

#install.packages("shiny")
#install.packages("dplyr")
#install.packages("ggplot2")

library(shiny)
library(ggplot2)
library(dplyr)

filename <- file.path("data", "bcl-data.csv")
bcl <- read.csv(filename, stringsAsFactors = FALSE)

if (file.exists(filename)) {
    bcl <- read.csv(filename, stringsAsFactors = FALSE)
} else {
    warning("File not found")   
}

ui <- fluidPage(
    titlePanel("BC Liquor Store prices"),
    sidebarLayout(
        sidebarPanel(
            sliderInput("priceInput", "Price", 0, 100, c(25, 40), pre = "$"),
            radioButtons("typeInput", "Product type",
                         choices = c("BEER", "REFRESHMENT", "SPIRITS", "WINE"),
                         selected = "WINE"),
            selectInput("countryInput", "Country",
                        choices = c("CANADA", "FRANCE", "ITALY"))
        ),
        mainPanel(
            plotOutput("coolplot"),
            br(), br(),
            tableOutput("results")
        )
    )
)

server <- function(input, output) {
    output$coolplot <- renderPlot({
        filtered <-
            bcl %>%
            filter(Price >= input$priceInput[1],
                   Price <= input$priceInput[2],
                   Type == input$typeInput,
                   Country == input$countryInput
            )
        ggplot(filtered, aes(Alcohol_Content)) +
            geom_histogram()
    })
}

shinyApp(ui = ui, server = server)