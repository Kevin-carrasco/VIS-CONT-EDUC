load(file = "input/datos/original/sf_simce.RData")


sf_simce <- sf_simce %>% select(-geometry) %>% 
cbind(ninguno=c("ninguno")) %>% as.data.frame()

sf_simce$agno <- factor(sf_simce$agno, labels = c("1998",  
                                                  "1999",  
                                                  "2000",  
                                                  "2001",  
                                                  "2002",  
                                                  "2004",  
                                                  "2005",  
                                                  "2006",  
                                                  "2007",  
                                                  "2008",  
                                                  "2009",  
                                                  "2010",  
                                                  "2011",  
                                                  "2012", 
                                                  "2013",
                                                  "2014",
                                                  "2015"))
sf_simce$grado <- factor(sf_simce$grado, levels = c("2b",
                                                    "4b",
                                                    "6b",
                                                    "8b",
                                                    "2m"))

sf_simce <- sf_simce %>% rowwise() %>%  mutate(pago_matricula = case_when(pago_matricula=="SIN INFORMACION"~"Sin informacion",
                                                                          pago_matricula=="GRATUITO"~"Gratuito",
                                                                          pago_matricula=="$1.000 A $10.000"~"Menos de $100.000",
                                                                          pago_matricula=="$10.001 A $25.000"~"Menos de $100.000",
                                                                          pago_matricula=="$25.001 A $50.000"~"Menos de $100.000",
                                                                          pago_matricula=="$50.001 A $100.000"~"Menos de $100.000",
                                                                          pago_matricula=="MAS DE $100.000"~"Más de $100.000"
                                                                          ))
sf_simce$pago_matricula <-factor(sf_simce$pago_matricula, levels = c("Sin informacion",
                                                                     "Gratuito",
                                                                     "Menos de $100.000",
                                                                     "Más de $100.000"))

sf_simce <- sf_simce %>% rowwise() %>%  mutate(pago_mensual = case_when(pago_mensual=="SIN INFORMACION"~"Sin informacion",
                                                                        pago_mensual=="GRATUITO"~"Gratuito",
                                                                        pago_mensual=="$1.000 A $10.000"~"Menos de $100.000",
                                                                        pago_mensual=="$10.001 A $25.000"~"Menos de $100.000",
                                                                        pago_mensual=="$25.001 A $50.000"~"Menos de $100.000",
                                                                        pago_mensual=="$50.001 A $100.000"~"Menos de $100.000",
                                                                        pago_mensual=="MAS DE $100.000"~"Más de $100.000"
                                                                        ))
sf_simce$pago_mensual <-factor(sf_simce$pago_mensual, levels = c("Sin informacion",
                                                                 "Gratuito",
                                                                 "Menos de $100.000",
                                                                 "Más de $100.000"))

sf_simce$cod_depe <- factor(sf_simce$cod_depe, labels = c("Corporación Municipal", 
                                                          "Municipal DAEM",
                                                          "Particular subvencionado",
                                                          "Particular pagado",
                                                          "Administración delegada",
                                                          "Sin información"))

sf_simce$prom_lect_rbd <- set_label(sf_simce$prom_lect_rbd, label = "Promedio lectura por RBD")
sf_simce$prom_mate_rbd <- set_label(sf_simce$prom_mate_rbd, label = "Promedio matemática por RBD")


save(sf_simce, file = "input/datos/proc/sf_simce.RData")
