# VIS-CONT-EDUC

## Visualizador de contaminación y desempeño escolar

Esta herramienta de visualización permite realizar análisis comparativos de distintos indicadores asociados a contaminación y desempeño escolar en Chile. Para ello se utiliza la base de la encuesta, olas  .

## Repositorio

El código de procesamiento de datos y generación de la herramienta de visualización se encuentra abierto en el repositorio [https://github.com/ocscoes/OCSVIS-LA](https://github.com/ocscoes/OCS-COES). El repositorio esta ordenado en modo general en 3 carpetas,

- Aplicación Shiny que permite la visualización de los datos (app),
- Datos utilizados (input). Cabe destacar, que siguiendo las políticas de resguardo de la información de LAPOP no se subirá la base de datos original sino solamente los códigos de procesamiento.
- Códigos de procesamiento de los datos (production).

La estructura del repositorio sigue la propuesta del protocolo <a href="https://lisa-coes.github.io/ipo/" target="_blank">IPO</a>

## Datos

Agencia de calidad de la educación y de...


## Estructura del repositorio:

```
├───README.md
│
├───app
│   │   .Rhistory
│   │   cont-educ.Rproj
│   │   server.R
│   │   ui.R
│   │   upload_app.R
│   │
│   ├───rsconnect
│   │   └───shinyapps.io
│   │       └───kevincarrasco
│   │               app.dcf
│   │
│   └───www
│       ├───bib
│       │       ocs-library.bib
│       │
│       ├───css
│       │       custom-a.css
│       │       docs-theme.css
│       │
│       ├───html
│       │       disqus.html
│       │
│       └───images
│               graficar.png
│               logo-ocs-animated.gif
│               ocs-21.png
│               ocs-logo.png
│               ocs-negro.png
│               OCS_1_1.png
│               OCS_1_1.svg
│               OCS_sfonts.svg
│
├───input
│   └───data
│       ├───original
│       │   │   sf_simce.RData
│       │
│       └───proc
│               
|
│
└───production

```        

