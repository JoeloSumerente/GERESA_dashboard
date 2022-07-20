use "${datos}\output\base_vacunados", clear
keep dni dosis fecha_ultima_vacuna
save "${datos}\output\base_vacunados_practica_eddie", replace
********************************************************************************
import excel "${datos}\raw\base_hospitalizados.xlsx", sheet("Hoja1") firstrow clear
rename DNI dni
rename EDAD edad
rename FECHADEINGRESO fecha_ingreso
gen hospitalizados = 1
keep dni edad fecha_ingreso hospitalizados
save "${datos}\output\base_hospitalizados_eddie", replace
********************************************************************************
use "${datos}\output\base_hospitalizados_eddie", clear
merge n:n dni using "${datos}\output\base_vacunados_practica_eddie"
keep if hospitalizados == 1

gen fecha_ingreso_DMY = fecha_ingreso
split fecha_ingreso_DMY, parse(-) destring
rename (fecha_ingreso_DMY?) (FIdia FImes FIaño)

gen FVaño = year(fecha_ultima_vacuna)
gen FVmes = month(fecha_ultima_vacuna)
gen FVdia = day(fecha_ultima_vacuna)

gen Fecha_Ingreso = date(fecha_ingreso, "DMY")
format Fecha_Ingreso %td
*format fecha_ultima_vacuna %tddd/nn/CCYY

gen post_vacuna = .
replace post_vacuna = 0 if fecha_ultima_vacuna > Fecha_Ingreso
replace post_vacuna = 1  if fecha_ultima_vacuna < Fecha_Ingreso 

keep if post_vacuna == 1 

sort dni
duplicates report dni
duplicates tag dni, gen(dupli_dni)
quietly by dni: gen dup_dni= cond(_N==1,0,_n)

drop if FIaño ==! FVaño
duplicates drop dni, force

save "${datos}\output\eddie_datos", replace
export excel using "${datos}/output/eddie_datos.xlsx", firstrow(variables) replace 