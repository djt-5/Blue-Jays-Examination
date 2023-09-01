library(shiny)

fluidPage(

    titlePanel("BIP Chance Multi-dimensional plot"),
    sidebarLayout(
        sidebarPanel(
            sliderInput("velocity",
                        "Pitch Velocity",
                        min = 80,
                        max = 105,
                        value = c(80, 105)),
            sliderInput("spin",
                        "Spin Rate",
                        min = 1100,
                        max = 3400, 
                        value = c(1100, 3400))
        ),
        mainPanel(
            plotOutput("Plot")
        )
    )
)
