   * ******************************************************************** *
   *
   *       PARTE 2:  GENERAR INDICADORES HOSPITALARIOS
   *
   *		Input:	"$source1_camas/input/disponibilidad_camas_hospitalarias.xlsx"
   *
   *		Output:	"$source1_camas/output/camas.csv"
   *
   * ******************************************************************** *

*** 1. Importar data en excel

**** PATH
*import excel "$source1_camas\input\disponibilidad_camas_hospitalarias.xlsx", sheet("Hoja1") firstrow clear

**** OTHER PATH
import excel "C:\Users\enemi\Documents\GitHub\GERESA_dashboard\data\source1_camas\input\disponibilidad_camas_hospitalarias.xlsx", sheet("Hoja1") firstrow clear

format fecha %tdCCYY-NN-DD	
*** 2. Renombrar variables
*rename NOUCIseconsideralasumade NOUCI
*** 2. Exportar data en csv

**** PATH
*export delimited using "$source1_camas\output\camas.csv", replace

**** OTHER PATH
export delimited using "C:\Users\enemi\Documents\GitHub\GERESA_dashboard\data\source1_camas\output\camas.csv", replace
clear
********************************************************************************
