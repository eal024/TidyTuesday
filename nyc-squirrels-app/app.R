#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

squirrel_variables  <- by_hectar %>% 
    select(-(hectare:lat)) %>% 
    colnames()

names(squirrel_variables) <- squirrel_variables %>% 
    str_replace_all( "_", " ") %>% 
    str_to_title()




# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel("Central Park Squirrels"),

    # Sidebar with a slider input for number of bins 
    sidebarLayout(
        sidebarPanel(
            sliderInput("min_squirrels",
                        "Number of bins:",
                        min = 1,
                        max = 30,
                        value = 10),
            selectInput( "variable", "Variable:",
                         choices = squirrel_variables)
        ),

        # Show a plot of the generated distribution
        mainPanel(
           plotOutput("park_plot")
        )
    )
)

# Define server logic required to draw a histogram
server <- function(input, output) {

    output$park_plot <- renderPlot({
        # generate bins based on input$bins from ui.R
        var <- sym(input$variable)
        
        # Choice: mean or median -> problem with the median was that the color-scale didt vary enough 
        filtered <- by_hectar %>% 
            filter(n >= input$min_squirrels)
        
        midpoint <- median( filtered[[input$variable]])
        
        by_hectar %>% 
            filter( n >= input$min_squirrels) %>% 
        ggplot( ) +
            geom_sf( data = central_park_sf) +
            geom_point( aes( long, lat , size = n, color = !!var )) +
            theme_void() +
            scale_color_gradient2( low = "blue",
                                   high = "red",
                                   midpoint = midpoint,
                                   labels = scales::percent ) +
            labs( color = paste("%", input$variable), 
                  size = "# of squirrels",
                  title = "") +
            coord_sf( datum = NA)
    })
}

# Run the application 
shinyApp(ui = ui, server = server)
