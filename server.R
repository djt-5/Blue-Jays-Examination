library(shiny)
library(tidyverse)
deploy_with_chances <- read_csv("deploy-with-chances.csv")

function(input, output, session) {

    output$Plot <- renderPlot({
      
      deploy_with_chances |>
        filter(!is.na(Chance)) |>
        filter(Velo >= input$velocity[1] &
                 Velo <= input$velocity[2]) |>
        filter(SpinRate >= input$spin[1] &
                 SpinRate <= input$spin[2]) |>
        ggplot(aes(x = HorzBreak, y = InducedVertBreak, color = Chance)) +
        scale_x_continuous("Horizontal Break", limits = c(-6.7, 23.48)) +
        scale_y_continuous("Vertical Break", limits = c(-9.28, 25.64)) +
        coord_fixed() +
        geom_point() +
        theme_bw() +
        ggtitle("Probability of Batter Putting Ball in Play") +
        theme(legend.title = element_blank())

    })

}
