library(shiny)
library(shinydashboard)
library(dplyr)
library(ggplot2)
library(sjlabelled)
load(file = "input/datos/sf_simce.RData")
sf_simce <- sf_simce %>% select(-geometry)
sf_simce$prom_lect_rbd <- set_label(sf_simce$prom_lect_rbd, label = "Promedio lectura por RBD")
sf_simce$prom_mate_rbd <- set_label(sf_simce$prom_mate_rbd, label = "Promedio matemática por RBD")

# Define las funciones de server
server <- function(input, output) {
    # Crea un scatter plot
    output$scatterplot <- renderPlot({
        ggplot(data = simce_subset(), # usamos el data reactivo!
               aes_string(x=input$x,
                          y=input$y)) +  
        geom_point() +
        geom_smooth(method = "lm",fill="lightblue",size=0.5)+
        theme(strip.text.x     = element_text(size   = 18, face = "bold",hjust = 0.5),
              strip.text.y     = element_text(size   = 15, family = "Lato",face   = "bold"),
              strip.background = element_rect(colour = "grey",fill   = "white"),panel.spacing= unit(2, "lines"),
              axis.text.x  = element_text(size   = 10,family = "Lato",face = "bold"),
              axis.text.y  = element_text(size   = 15,family = "Lato",face = "bold"),
              axis.title.x = element_text(size   = 18,family = "Lato",face = "bold"),
              axis.title.y = element_text(size   = 18,family = "Lato",face = "bold"),
              legend.text  = element_text(size   = 12,family = "Lato"),
              plot.title   = element_text(size   = 15,family = "Lato",face = "bold",hjust = 0.5),
              plot.caption = element_text(size   = 12,family = "Lato",hjust = 0,face = "plain"))+
        ylim(c(100,400))
    })
    # crea una tabla resumen
    simce_subset <- reactive({
        # viene del UI
        req(input$selected_type)
        # filtra base de datos
        filter(sf_simce, agno %in% input$selected_type)
    }) #termina data reactivo
    output$n <- renderUI({
        HTML(paste0("El gráfico muestra la relación entre ", input$x, " y ",  input$y,
                    " de ", nrow(simce_subset()), 
                    " escuelas para el año ", input$selected_type))
    }) #termina output de N de muestra
}   # Termina server
