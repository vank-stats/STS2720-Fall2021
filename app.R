# Load our packages and data

library(shiny)
library(dplyr)
library(ggplot2)
library(lubridate)
covid <- read.csv("https://raw.githubusercontent.com/vank-stats/STS2720-Fall2021/main/Elon_COVID.csv")
covid <- mutate(covid, Date = mdy(Date))


# Define UI for application that makes a bar graph of Elon COVID-19 data

ui <- fluidPage(

    # Application title
    
    titlePanel("STS2720 Shiny App Example"),

    # Sidebar with several widgets
    
    sidebarLayout(
        sidebarPanel(
            dateRangeInput(inputId = "date",
                           label = "Select dates",
                           start = min(covid$Date),
                           end = max(covid$Date)),
            textInput(inputId = "title", 
                      label = "Choose a title",
                      value = "Elon 2020-2021 COVID-19 Data"),
            selectInput(inputId = "colors",
                        label = "Choose bar color scheme",
                        choices = c("Pastels" = "Pastel2",
                                    "Reds" = "Reds",
                                    "Dark" = "Dark2"))
        ),


        # Show a plot and a text summary
        
        mainPanel(
           plotOutput("distPlot"),
           textOutput("summary")
        )
    )
)


# Define server logic required to create graph and text summary

server <- function(input, output) {

    output$distPlot <- renderPlot({
        ggplot(covid) +
            geom_bar(aes(x = Date, fill = Category), position = "stack") +
            theme_classic() +
            labs(title = input$title) +
            xlim(input$date[1], input$date[2]) +
            scale_fill_brewer(palette = input$colors)
    })
    
    output$summary <- renderText({
        data <- filter(covid, Date >= input$date[1], Date <= input$date[2])
        sentence <- paste("Between", input$date[1], "and", input$date[2],
                          "there were", nrow(data), 
                          "positive COVID-19 cases reported at Elon")
    })
}


# Run the application 

shinyApp(ui = ui, server = server)