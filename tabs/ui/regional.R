regional <- tabPanel(title = "Nivel Regional", 
                 value = "regional",
                 br(),
                 HTML("<h1><center>Analisis de la Pandemia por COVID-19</center></h1>"),
                 column(width = 12,
                        br(), br(),
                        wellPanel(
                HTML("El Analisis de la Pandemia por COVID-19 muestra, de forma clara y directa,
                          información relevante sobre la situacion COVID en la region Cusco,
                          para esto se presentan graficos interactivos a nivel regional,
                          provincial y distrital.</h4>")
                        ),
                        br(),
                 #   fluidRow(
                 #   box(width=12,
                 #   valueBox(h2(strong("45,431")), "Casos totales 2021", icon = icon("virus", "fa-2x")),
                 #   valueBox(h2(strong("234,516")), "Pruebas procesadas (moleculares, rÃ¡pidas y antigÃ©nicas)", icon = icon("vial", "fa-2x")),
                 #   valueBox(h2(strong("1,925")), "Total Fallecidos 2021", icon = icon("skull-crossbones","fa-2x")))
                 # ),
                
                # Fila 1

                                
                fluidRow(
                  tabBox(title = h4(strong("Mapa Tematico")),
                    tabPanel("Total Positivo",
                             tabsetPanel(
                               tabPanel("Grafico",highchartOutput("map_total_positivo")),
                               tabPanel("Resumen","Este mapa muestra el numero de
                                        casos positivos acumulados por", strong("pruebas: molecular, rapida y antigenica"), ", esta ultima desde 2021. Para COVID-19 desde los
                                        lugares menos afectados hacia los mas afectados
                                        de la Region Cusco. El rango comprende los
                                        valores desde el primer dia en que se reporto
                                        el primer caso en la Region, hasta la fecha.
                                        Asimismo, el rango continuo de colores muestra el color mas claro para las zonas menos
                                        afectadas y el mas oscuro para las
                                        mas afectadas.", br(), br(),
                                        "Los colores intermedios cambian segun las zonas
                                        se encuentren mas o menos afectadas.")
                             )),
                    tabPanel("Positivo Rapida",
                             tabsetPanel(
                               tabPanel("Grafico",highchartOutput("map_pr_positivo")),
                               tabPanel("Resumen","Este mapa muestra el numero
                                        de casos positivos acumulados por", strong("pruebas
                                        rapidas"), "para COVID-19 desde los lugares menos
                                        afectados hacia los mas afectados de la
                                        Region Cusco. El rango comprende los valores
                                        desde el primer dia en que se reporta el
                                        primer caso en la Region, hasta la fecha.
                                        Asimismo, el rango continuo de colores muestra el color mas claro para las zonas menos
                                        afectadas y el mas oscuro para las
                                        mas afectadas.", br(), br(),
                                        "Los colores intermedios cambian segun las zonas
                                        se encuentren mas o menos afectadas.")
                             )),
                    
            
                    tabPanel("Positivo Molecular",
                             tabsetPanel(
                               tabPanel("Grafico", highchartOutput("map_pm_positivo")),
                               tabPanel("Resumen", "Este mapa muestra el numero
                                        de casos positivos acumulados por", strong("pruebas
                                        moleculares"), "para COVID-19 desde los lugares
                                        menos afectados hacia los mÃ¡s afectados de
                                        la RegiÃ³n. El rango comprende los valores
                                        desde el primer dia en que se reporta el primer
                                        caso en la Region, hasta la fecha.
                                        Asimismo, el rango continuo de colores muestra el color mas claro para las zonas menos
                                        afectadas y el mas oscuro para las
                                        mas afectadas.", br(), br(),
                                        "Los colores intermedios cambian segun las zonas
                                        se encuentren mas o menos afectadas.")
                             ))
                  ),
                  
                  tabBox(title = h4(strong("Semaforo COVID")),
                         
                         
                         
                         tabPanel("Tasa de positividad molecular",
                                  tabsetPanel(
                                    tabPanel("Grafico", dygraphOutput("dygraph_region_positividad_molecular"),
                                             h4(strong("Descripcion de los ejes")),
                                             p(div(strong("Eje Y: "), em("Tasa de positividad de pruebas moleculares (promedio de 7 dias)."), style = "color:blue")),
                                             p(div(strong("Eje X: "), em("Dias."), style = "color:blue"), "El primer dia de la serie corresponde al 13/03/2020, fecha en la cual se reporta
                                          el primer caso confirmado por COVID-19 en la region.", "La informacion de las ultimas 2 semanas pueden sufrir variacion debido que se encuentra en proceso de actualizacion continua por las unidades notificantes")),
                                    tabPanel("Resumen", "El semaforo COVID-19 de tasa de positividad molecular muestra
                               el nivel de riesgo respecto al numero total de personas infectadas por muestras moleculares procesadas
                               por COVID-19.", br(), br(),
                                             p("El color", strong("rojo"), "representa un nivel elevado de riesgo, en esta zona
las precauciones aumentan. En esta zona el nivel y velocidad de contagio por muestras moleculares es mucho mas elevada.
Se recomienda salir de casa solo en casos excepcionales y tomando muy en cuenta las medidas
de seguridad sanitaria. ", br(), br(),
                                               "El color", strong("amarillo"), "representa un nivel de riesgo moderado. Aunque el riesgo aun se mantiene, se pueden realizar mas
actividades, siempre tomando en consideracion las medidas de seguridad sanitaria.", br(), br(),
                                               "El color", strong("verde"), "representa que el nivel de riesgo no es tan elevado respecto a los
otros colores. En todo momento se deberian tomar en cuenta las medidas de seguridad sanitaria. 
"))
                                  )),
                                                                           
                         tabPanel("Tasa de positividad antigenica",
                                  tabsetPanel(
                                    tabPanel("Grafico", dygraphOutput("dygraph_region_positividad_antigenica"),
                                             h4(strong("Descripción de los ejes")),
                                             p(div(strong("Eje Y: "), em("Tasa de positividad de pruebas antigenicas (promedio de 7 dias)."), style = "color:blue")),
                                             p(div(strong("Eje X: "), em("Dias."), style = "color:blue"), "El primer dia de la serie corresponde al 13/03/2020, fecha en la cual se reporta
                                          el primer caso confirmado por COVID-19 en la region.", "La informacion de las ultimas 2 semanas pueden sufrir variacion debido que se encuentra en proceso de actualizacion continua por las unidades notificantes")),
                                    tabPanel("Resumen", "El semaforo COVID-19 de tasa de positividad antigenica muestra
                               el nivel de riesgo respecto al numero total de personas infectadas por muestras moleculares procesadas
                               por COVID-19.", br(), br(),
                                             p("El color", strong("rojo"), "representa un nivel elevado de riesgo, en esta zona
las precauciones aumentan. En esta zona el nivel y velocidad de contagio por muestras moleculares es mucho mas elevada.
Se recomienda salir de casa solo en casos excepcionales y tomando muy en cuenta las medidas
de seguridad sanitaria. ", br(), br(),
                                               "El color", strong("amarillo"), "representa un nivel de riesgo moderado. Aunque el riesgo aun se mantiene, se pueden realizar mas
actividades, siempre tomando en consideración las medidas de seguridad sanitaria.", br(), br(),
                                               "El color", strong("verde"), "representa que el nivel de riesgo no es tan elevado respecto a los
otros colores. En todo momento se deberian tomar en cuenta las medidas de seguridad sanitaria. 
"))
                                  )),

                         tabPanel("Sintomaticos",
                                  tabsetPanel(
                                    tabPanel("Grafico",dygraphOutput("dygraph_region_sintomaticos"),
                                             h4(strong("Descripción de los ejes")),
                                             p(div(strong("Eje Y: "), em("Sintomaticos por COVID-19 en la Region Cusco."), style = "color:blue")),
                                             p(div(strong("Eje X: "), em("Dias"), style = "color:blue"), "La información de las ultimas 2 semanas pueden sufrir variaciÃ³n debido que se encuentra en proceso de actualizaciÃ³n continua por las unidades notificantes")),
                                    tabPanel("Resumen", "El semaforo COVID-19 de sintomaticos muestra
                               el nivel de riesgo respecto al numero total de contagiados
                               por COVID-19.", br(), br(),
                                             p("El color", strong("rojo"), "representa un nivel elevado de riesgo, en esta zona
las precauciones aumentan. En esta zona el nivel y velocidad de contagio es mucho más elevada.
Se recomienda salir de casa solo en casos excepcionales y tomando muy en cuenta las medidas
de seguridad sanitaria. ", br(), br(),
                                               "El color", strong("amarillo"), "representa un nivel de riesgo moderado. Aunque el riesgo aun se mantiene, se pueden realizar mas
actividades, siempre tomando en consideración las medidas de seguridad sanitaria.", br(), br(),
                                               "El color", strong("verde"), "representa que el nivel de riesgo no es tan elevado respecto a los
otros colores. En todo momento se deberían tomar en cuenta las medidas de seguridad sanitaria. 
"))
                                  )),
                      
                    tabPanel("Casos",
                             tabsetPanel(
                               tabPanel("Grafico",dygraphOutput("dygraph_region_casos"),
                                        h4(strong("Descripción de los ejes")),
                                        p(div(strong("Eje Y: "), em("Casos positivos acumulados por COVID-19 en la Region Cusco."), style = "color:blue")),
                                        p(div(strong("Eje X: "), em("Dias."), style = "color:blue"), "El primer dia de la serie corresponde al 13/03/2020, fecha en la cual se reporta
                                          el primer caso confirmado por COVID-19 en la region.", "La información de las ultimas 2 semanas pueden sufrir variación debido que se encuentra en proceso de actualización continua por las unidades notificantes")),
                               tabPanel("Resumen", "El semaforo COVID-19 de casos muestra
                               el nivel de riesgo respecto al numero total de contagiados
                               por COVID-19.", br(), br(),
                                        p("El color", strong("rojo"), "representa un nivel elevado de riesgo, en esta zona
las precauciones aumentan. En esta zona el nivel y velocidad de contagio es mucho más elevada.
Se recomienda salir de casa solo en casos excepcionales y tomando muy en cuenta las medidas
de seguridad sanitaria. ", br(), br(),
"El color", strong("amarillo"), "representa un nivel de riesgo moderado. Aunque el riesgo aun se mantiene, se pueden realizar más
actividades, siempre tomando en consideración las medidas de seguridad sanitaria.", br(), br(),
"El color", strong("verde"), "representa que el nivel de riesgo no es tan elevado respecto a los
otros colores. En todo momento se deberian tomar en cuenta las medidas de seguridad sanitaria. 
"))
                             )),


tabPanel("Casos antigenica",
         tabsetPanel(
           tabPanel("GrÃ¡fico",dygraphOutput("dygraph_region_casos_antigenica"),
                    h4(strong("Descripcion de los ejes")),
                    p(div(strong("Eje Y: "), em("Casos positivos por prueba antigenica por COVID-19 en la Region Cusco."), style = "color:blue")),
                    p(div(strong("Eje X: "), em("Dias."), style = "color:blue"), "El primer dia de la serie corresponde al 13/03/2020, fecha en la cual se reporta
                                          el primer caso confirmado por COVID-19 en la region.", "La información de las ultimas 2 semanas pueden sufrir variacion debido que se encuentra en proceso de actualización continua por las unidades notificantes")),
           tabPanel("Resumen", "El semaforo COVID-19 de casos muestra
                               el nivel de riesgo respecto al numero total de contagiados
                               por COVID-19.", br(), br(),
                    p("El color", strong("rojo"), "representa un nivel elevado de riesgo, en esta zona
las precauciones aumentan. En esta zona el nivel y velocidad de contagio es mucho mas elevada.
Se recomienda salir de casa solo en casos excepcionales y tomando muy en cuenta las medidas
de seguridad sanitaria. ", br(), br(),
                      "El color", strong("amarillo"), "representa un nivel de riesgo moderado. Aunque el riesgo aun se mantiene, se pueden realizar mas
actividades, siempre tomando en consideración las medidas de seguridad sanitaria.", br(), br(),
                      "El color", strong("verde"), "representa que el nivel de riesgo no es tan elevado respecto a los
otros colores. En todo momento se deberian tomar en cuenta las medidas de seguridad sanitaria. 
"))
         )),


                    tabPanel("Defunciones",
                             tabsetPanel(
                               tabPanel("Grafico",dygraphOutput("dygraph_region_defunciones"),
                                        h4(strong("Descripcion de los ejes")),
                                        p(div(strong("Eje Y: "), em("Defunciones acumuladas por COVID-19 en la Region Cusco."), style = "color:blue")),
                                        p(div(strong("Eje X: "), em("Dias."), style = "color:blue"), "El primer dia de la serie corresponde al 13/03/2020, fecha en la cual se reporto
                                          el primer caso confirmado por COVID-19 en la region.", "La informacion de las ultimas 2 semanas pueden sufrir variación debido que se encuentra en proceso de actualización continua por las unidades notificantes")),
                               tabPanel("Resumen","El semaforo COVID-19 de defunciones muestra
                               el nivel de riesgo respecto al numero total de fallecidos por COVID-19.", br(), br(),
"El color", strong("rojo"), "representa un nivel elevado de riesgo, en esta zona las precauciones aumentan. Hay una
alerta maxima por las defunciones que se presentan dia a dia. En todo tiempo deberiamos no exponernos
al COVID-19, necesitamos cuidarnos y cuidar a los nuestros.", br(), br(),
"El color", strong("amarillo"), "representa un nivel de riesgo moderado. Aunque el riesgo aun se mantiene, la alerta no es maxima debido a
que el numero de defunciones por dia ha bajado respecto al color rojo. En todo tiempo deberiamos no
exponernos al COVID-19, necesitamos cuidarnos y cuidar a los nuestros.", br(), br(),
"El color", strong("verde"), "representa que el nivel de riesgo es bajo, la alerta por numero de defunciones esta
presente, pero no es tan elevada respecto a los otros colores. En todo tiempo deberiamos no
exponernos al COVID-19, necesitamos cuidarnos y cuidar a los nuestros.
")
                             )),


                    tabPanel("Camas",
                             tabsetPanel(
                               tabPanel("Grafico", dygraphOutput("dygraph_region_camas"),
                                        h4(strong("Descripción de los ejes y leyenda")),
                                        p(div(strong("Eje Y: "), em("Total de camas disponibles para COVID-19 (UCI, NO UCI, NIVEL II), en la Región Cusco."), style = "color:blue")),
                                        p(div(strong("Eje X: "), em("Dias."), style = "color:blue")),
                                        p(div(strong("UCI: "), em("Unidad de Cuidado Intensivos."), style = "color:blue")),
                                        p(div(strong("UCIN: "), em("Unidad de Cuidados Intermedios."), style = "color:blue"))),
                               tabPanel("Resumen", "El semaforo COVID-19 de camas muestra
                               el nivel de riesgo respecto al numero total de camas UCI,
                               NO UCI, camas de Nivel II y UCIN por COVID-19.", br(), br(),
"El color", strong("rojo"), "representa un nivel elevado de riesgo, en esta zona las camas se ocupan
por sobre el 60%. Hay una alerta maxima por el uso de las mismas en el dia a dia.
En todo tiempo deberiamos no exponernos al COVID-19, necesitamos cuidarnos y
cuidar a los nuestros.", br(), br(),
"El color", strong("amarillo"), "representa un nivel de riesgo moderado, en esta zona las camas se ocupan
entre el 30 y 60%. Aunque el riesgo aun se mantiene, la alerta no es
maxima debido a que el numero de camas por dia ha bajado respecto al color rojo.
En todo tiempo deberiamos no exponernos al COVID-19,
necesitamos cuidarnos y cuidar a los nuestros.", br(), br(),
"El color", strong("verde"), "representa un nivel de riesgo bajo, la alerta por numero de
camas usadas para COVID-19 estÃ¡ presente, pero no es tan elevada respecto a los
otros colores, a saber, el uso de estas se encuentra por debajo del 30%. En todo tiempo deberiamos no
exponernos al COVID-19, necesitamos cuidarnos y cuidar a los nuestros.
")
                             ))
                  )                
                ),                
                                
                # Fila 2

                fluidRow(
                  tabBox(title = h4(strong("Casos acumulados de Covid-19: Región Cusco (I)")),
                         tabPanel("Lineal",
                                  tabsetPanel(
                                    tabPanel("Grafico",dygraphOutput("plot3"),
                                             h4(strong("Descripción de los ejes")),
                                             p(div(strong("Eje Y: "), em("Numero total de casos positivos, recuperados, sintomÃ¡ticos, activos y defunciones por COVID-19, en la región."), style = "color:blue")),
                                             p(div(strong("Eje X: "), em("Dias."), style = "color:blue"), "El primer dia de la serie corresponde al 13/03/2020, fecha en la cual se reporta
                                          el primer caso confirmado por COVID-19 en la región.", "La información de las ultimas 2 semanas pueden sufrir variación debido que se encuentra en proceso de actualización continua por las unidades notificantes")),
                                             
                                    tabPanel("Resumen","Las curvas de esta grafica muestran
                                    la evolución diaria del acumulado de
                                    casos positivos, recuperados, defunciones, sintomaticos
                                    y activos, para la Región Cusco.", br(), br(),
"Usted puede elegir apreciar el panorama mas amplio (acumulado historico) o mover el
deslizador para apreciar la evoluciÃ³n de las curvas acumuladas en los dias mas proximos a hoy.
")
                                  ))
                  ),

                  tabBox(title = h4(strong("Casos acumulados de Covid-19: Region Cusco (II)")),
                         tabPanel("Lineal",
                                  tabsetPanel(
                                    tabPanel("Grafico",dygraphOutput("plot4"),
                                             h4(strong("Descripción de los ejes")),
                                             p(div(strong("Eje Y: "), em("Numero total de casos positivos a COVID-19 y numero total de habitantes con inicio de sintomas en la región."), style = "color:blue")),
                                             p(div(strong("Eje X: "), em("Dias."), style = "color:blue"), "El primer dia de la serie corresponde al 13/03/2020, fecha en la cual se reporta
                                          el primer caso confirmado por COVID-19 en la región.", "La información de las ultimas 2 semanas pueden sufrir variación debido que se encuentra en proceso de actualización continua por las unidades notificantes")),
                                    tabPanel("Resumen","Las curvas de esta
                                    grafica muestran la evolución diaria
                                    del numero acumulado, hasta la fecha,
                                    de personas en inicio de sintomas para
                                    COVID-19 y el numero total de casos
                                    positivos, para la Región Cusco..", br(), br(),
                                    "Usted puede elegir apreciar el panorama mas amplio (acumulado historico)
o mover el deslizador para apreciar la evolución de las curvas acumuladas
en los dias mÃ¡s poiximos a hoy.")
                                  )),
                         tabPanel("Log",
                                  tabsetPanel(
                                    tabPanel("Grafico", dygraphOutput("plot5"),
                                             h4(strong("Descripción de los ejes")),
                                             p(div(strong("Eje Y: "), em("Log10 del numero total de casos positivos a COVID-19 y log10 del nÃºmero total de habitantes con inicio de sintomas en la región."), style = "color:blue")),
                                             p(div(strong("Eje X: "), em("Dias."), style = "color:blue"), "El primer dia de la serie corresponde al 13/03/2020, fecha en la cual se reporto
                                          el primer caso confirmado por COVID-19 en la región.", "La información de las ultimas 2 semanas pueden sufrir variación debido que se encuentra en proceso de actualización continua por las unidades notificantes")),
                                    tabPanel("Resumen", "Las curvas de esta
                                    grafica muestran la evolución diaria
                                    del numero acumulado, hasta la fecha,
                                    de personas en inicio de sinntomas para
                                    COVID-19 y el numero total de casos
                                    positivos. En esa linea, se puede
                                    apreciar un versus entre las
                                    evoluciones de ambas curvas,
                                    se puede ver como se comporta
                                    la curva de aquellas personas
                                    que iniciaron sintomas respecto
                                    a aquellas que ya fueron
                                    confirmadas como contagiadas con el virus.", br(), br(),
"Usted puede elegir apreciar el panorama mas amplio (acumulado historico)
o mover el deslizador para apreciar la evolución de las curvas acumuladas
en los dias más proximos a hoy.", br(), br(),
p(strong("Nota: "), "Se aplica", em("log10"), "a las curvas para suavizar la serie en el tiempo. 
"))
                                  ))
                  )
                ),

                
                 # fluidRow(
                 #   box(title = "Casos acumulados de Covid-19: Region Cusco (I)", dygraphOutput("plot3"), textOutput("legend_plot3")),
                 #   box(title = "Casos acumulados de Covid-19: Region Cusco (II)", dygraphOutput("plot4"), textOutput("legend_plot4")),
                 #   


# Fila 3

fluidRow(
  tabBox(title = h4(strong("Vacunacion")),
         tabPanel("Ritmo",
                  tabsetPanel(
                    tabPanel("GrÃ¡fico",dygraphOutput("plot6"),
                             h4(strong("DescripciÃ³n de los ejes")),
                             p(div(strong("Eje Y: "), em("NÃºmero total de casos positivos, recuperados, sintomÃ¡ticos, activos y defunciones por COVID-19, en la regiÃ³n."), style = "color:blue")),
                             p(div(strong("Eje X: "), em("DÃ­as."), style = "color:blue"), "El primer dÃ­a de la serie corresponde al 13/03/2020, fecha en la cual se reportÃ³
                                          el primer caso confirmado por COVID-19 en la regiÃ³n.", "La informaciÃ³n de las ultimas 2 semanas pueden sufrir variaciÃ³n debido que se encuentra en proceso de actualizaciÃ³n continua por las unidades notificantes")),
                    
                    tabPanel("Resumen","Las curvas de esta grÃ¡fica muestran
                                    la evoluciÃ³n diaria del acumulado de
                                    casos positivos, recuperados, defunciones, sintomÃ¡ticos
                                    y activos, para la RegiÃ³n Cusco.", br(), br(),
                             "Usted puede elegir apreciar el panorama mÃ¡s amplio (acumulado histÃ³rico) o mover el
deslizador para apreciar la evoluciÃ³n de las curvas acumuladas en los dÃ­as mÃ¡s prÃ³ximos a hoy.
")
                  ))
  )
)
                   

)
)