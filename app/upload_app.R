#------------------------------------------------------------------------------#
# Author(s): Kevin Carrasco
# website: https://www.linkedin.com/in/jkevin-carrasco-q/
# e-mail: kevin.carrasco@ug.uchile.cl
#------------------------------------------------------------------------------#

#********************************
#Upload app *********************
#********************************

#Este archivo sirve principalmente para generar el deploy de la app en el servidor de shiny.apps

# install.packages('rsconnect')
# install.packages('here')
# install.packages("tictoc") #timming de funciones

shinyApp(ui = ui, server = server)
library(rsconnect)
library(tictoc)

# Realizar el login de la cuenta y el token de acceso  --------------------

rsconnect::setAccountInfo(name='kevincarrasco',
                          token='AA612B64FAA971BC64F40E2468846444',
                          secret='cq32nDEOl9g+1IxIwQ7++PJAub91IMvUP73HYPNV')

tictoc::tic() #inicio...
rsconnect::deployApp(forceUpdate = TRUE) #Subir App al server de shinyapps
tictoc::toc() #término...
