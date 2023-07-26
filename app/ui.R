library(shiny)
library(shinydashboard)
load(file = "input/datos/sf_simce.RData")
ui <- dashboardPage(
    dashboardHeader(
        title = "Pollution and educational outcomes",
        titleWidth = 1000,
        disable = F
    ),
    # Sidebar  con las definiciones de input y output
    dashboardSidebar(
        # Inputs: selecciona variables de un plot
        # Selecciona variable para el eje Y
        selectInput(
            inputId = "y",
            label = "Seleccionar Indicador (Vertical)",
            choices = c("prom_lect_rbd", "prom_mate_rbd"),
            selected = "prom_lect_rbd"
        ),
        # Selecciona variable para el eje X
        selectInput(
            inputId = "x",
            label = "Seleccionar Indicador (Horizontal)",
            choices = c("cod_depe", "pago_matricula", "pago_mensual", "GWRPM25"),
            selected = "GWRPM25"
        ),
        selectInput(
            inputId = "selected_type",
            label = "Seleccionar año:",
            choices = levels(sf_simce$agno),
            selected = "2005"
        )
    ),
    # Output: Show scatterplot
    dashboardBody(
        fluidPage(
            box(
                # mostrar scatterplot
                plotOutput(outputId = "scatterplot"),
                # mostrar el N de peliculas
                uiOutput(outputId = "n")
            )
        ))
)
