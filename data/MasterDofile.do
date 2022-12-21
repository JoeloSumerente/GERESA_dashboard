   * ******************************************************************** *
   * ******************************************************************** *
   *                                                                      *
   *               GERESA Cusco                                           *
   *               Direccion de Epidemiología                              *
   *               Master Do File                                         *
   *                                                                      *
   * ******************************************************************** *
   * ******************************************************************** *

       /*
       ** PROPÓSITO:	Generar los indicadores para el Dashboard de GERESA
	   ** https://geresacusco.shinyapps.io/DASHBOARD_COVID-19_CUSCO/

       ** OUTLINE:      PARTE 0: Preparar globales y definir usuarios
                        PARTE 1: Correr do files

       ** ESCRITO POR:	Brandon Mora

       ** FECHA DE ÚLTIMA MODIFICACIÓN:  11 de Mayo 2021
       */

   * ******************************************************************** *
   *
   *       PARTE 0:  PREPARANDO FOLDER Y DEFINIENDO GLOBALES
   *
   * ******************************************************************** *

   * Definir Usuarios
   * --------------------

   *Número de usuario:
   * Nombre de Usuario 1


   *Establecer este valor para el usuario que actualmente usa el script
   global user  1
	
   * Definir Globales
   * ---------------------

   if $user == 1 {
       global path "C:\Users\Joelo\Documents\GitHub\GERESA_dashboard\data"
   }
  
   
	global main						"$path"
	global source1_camas			"$path/source1_camas"
	global source2_siscovid			"$path/source2_siscovid"
	global source3_semaforo			"$path/source3_semaforo"
	global source4_mapas			"$path/source4_mapas"
	global source6_hospitalizados	"$path/source6_hospitalizados"

	set more off, permanent  	
	
   * ******************************************************************** *
   *
   *		PARTE 1:  GENERAR INDICADORES EPIDEMIOLÓGICOS
   *
   *		Input:	"$source2_siscovid/input/data_dashboard.dta"
   *
   *		Output:	"$source2_siscovid/output/data_distrital.csv"
   *				"$source2_siscovid/output/data_provincial.csv"
   *				"$source2_siscovid/output/data_regional.csv"
   *
   * ******************************************************************** *
 
   local parte1Do     1

   if (`parte1Do' == 1) { //Change the local above to run or not to run this file
       do "$source2_siscovid/main.do" 
   }
	 
   * ******************************************************************** *
   *
   *       PARTE 2:  GENERAR INDICADORES HOSPITALARIOS
   *
   *		Input:	"$source1_camas/input/disponibilidad_camas_hospitalarias.xlsx"
   *
   *		Output:	"$source1_camas/output/camas.csv"
   *
   * ******************************************************************** *

   local parte2Do       0

   if (`parte2Do' == 0) { //Change the local above to run or not to run this file
       do "$source1_camas/main.do"
   }
   
    * ******************************************************************** *
   *
   *       PARTE 3:  GENERAR DATA HOSPITALIZADOS
   *
   *		Input:	"$source6_hospitalizados/input/hospitalizados_covid_nocovid.xlsx"
   *
   *		Output:	"$source6_hospitalizados/output/hospitalizados.csv"
   *
   * ******************************************************************** *
   
 local parte3do  	1

    if (`parte2Do' == 1) { //Change the local above to run or not to run this file
       do "$\source6_hospitalizados/main.do"
   }

	  
