

load(file = "input/datos/original/sf_simce.RData")


sf_simce <- sf_simce %>% select(-geometry)
sf_simce <- as.data.frame(sf_simce)
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
sf_simce$cod_depe <- factor(sf_simce$cod_depe, labels = c("Corporación Municipal", 
                                                          "Municipal DAEM",
                                                          "Particular subvencionado",
                                                          "Particular pagado",
                                                          "Administración delegada",
                                                          "Sin información"))

sf_simce$prom_lect_rbd <- set_label(sf_simce$prom_lect_rbd, label = "Promedio lectura por RBD")
sf_simce$prom_mate_rbd <- set_label(sf_simce$prom_mate_rbd, label = "Promedio matemática por RBD")

save(sf_simce, file = "input/datos/proc/sf_simce.RData")
