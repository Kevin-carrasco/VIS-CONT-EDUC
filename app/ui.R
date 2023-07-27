library(shiny)
library(shinydashboard)
library(shinyfullscreen)
library(Cairo);options(shiny.usecairo=TRUE) # Para la calidad de los plots
load(file = "input/datos/proc/sf_simce.RData")


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
            selected = "prom_mate_rbd"
        ),
        # Selecciona variable para el eje X
        selectInput(
            inputId = "x",
            label = "Seleccionar Indicador (Horizontal)",
            choices = c("GWRPM25"),
            selected = "GWRPM25"
        ),
        selectInput(
            inputId = "selected_type",
            label = "Seleccionar año:",
            choices = levels(sf_simce$agno),
            selected = "2015"
        ),
        selectInput(
          inputId = "f",
          label = "Seleccionar grado:",
          choices = levels(sf_simce$grado),
          selected = "2m"
        ),
        # Selecciona variable para facet
        selectInput(
          inputId = "z",
          label = "Seleccionar Indicador (grupos)",
          choices = c("cod_depe", "pago_matricula", "pago_mensual", "ninguno"),
          selected = "ninguno"
        )
    ),
    # Output: Show scatterplot
    dashboardBody(
        fluidPage(
                # mostrar scatterplot
                fullscreen_this(plotOutput(outputId = "scatterplot")),
                # mostrar el N de peliculas
                uiOutput(outputId = "n")
        )
        )
)
