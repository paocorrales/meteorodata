
<!-- README.md is generated from README.Rmd. Please edit that file -->

# meteorodata <img src="man/figures/meteoro.png" align="right" width="130"/>

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
[![R-CMD-check](https://github.com/MatiFasolato/meteorodata/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/MatiFasolato/meteorodata/actions/workflows/R-CMD-check.yaml)
[![Codecov test
coverage](https://codecov.io/gh/MatiFasolato/meteorodata/graph/badge.svg)](https://app.codecov.io/gh/MatiFasolato/meteorodata)

<!-- badges: end -->

# Objetivo:

El objetivo del paquete ‘meteorodata’ es facilitar el análisis de datos
meteorológicos y la manipulación de los mismos mediante funciones
implementadas en este paquete.

## Instalación

You can install the development version of meteorodata from
[GitHub](https://github.com/) with:

``` r
# install.packages("pak")
pak::pak("MatiFasolato/meteorodata")
```

### Descarga de Datos:

Para llevar a cabo la descarga de los datasets referidos a las
estaciones meteorologicas implementamos la siguiente funcion.

**`descargar_datos`**: toma un parametro correspondiente a la estación
meteorológica y permite la lectura y/o descarga del dataset de la
estación que se solicite.

### Funciones:

1.  **`C_to_F`**: Esta función recibe como entrada un valor numérico que
    representa la temperatura en grados Celsiud y convierte dicha
    temperatura en su equivalente a grados Fahrenheit. La función valida
    primero que el valor de entrada sea un numero, ya que si no lo es
    nos devuelve un mensaje de error indicando que se debe ingresar un
    valor numerico. Para obtener la equivalencia a grados Fahrenheit, la
    funcion utiliza la formula: (temp_centigrado x $\frac{9}{5}$) + 32,
    donde temp_centigrado representa a la temperatura en Celcius.

2.  **`F_to_C`** : Esta función recibe un valor numérico que representa
    la temperatura en grados Fahrenheit y convierte dicha temperatura en
    su equivalente a grados Celsius. La función valida primero que el
    valor de entrada sea numérico, ya que si no lo es, genera un mensaje
    de error . La fórmula utilizada para obtener la temperatura en
    Celsius es : (temp_fahrenheit - 32) x $\frac{5}{9}$ , donde
    temp_fahrenheit representa a la temperatura en Fahrenheit.

3.  **`tabla_resumen_temperatura`**: Esta función recibe un dataframe
    que contiene informacion acerca de todas las estaciones
    meteorologicas y de acuerdo a la estacion especificada calcula
    medidas significativas, como son el promedio (media), mínimo,
    máximo, mediana y desviación estándar de la temperatura y otras
    variables relevantes. El resultado devuelto es una tabla resumen con
    estas métricas, que permite comparar los datos climáticos de
    diferentes estaciones

4.  **`grafico_temperatura_mensual`**: Esta función recibe un data frame
    con datos de una o mas estaciones y agrupa los datos por mes y
    calcula el promedio de la temperatura para cada mes, lo que permite
    observar tendencias y variaciones a lo largo del año. Luego, genera
    un gráfico que muestra estos promedios mensuales, con el eje x
    representando los meses y el eje y la temperatura promedio en grados
    Celsius.

## Ejemplo

Este es un ejemplo básico que muestra cómo instalar la librería del
paquete:

``` r
library(meteorodata)
```

## Uso de funciones:

#### A continuacion se mostrará un ejemplo de como hacer uso de las función `F_to_C()` :

``` r
F_to_C(100)
#> [1] 37.77778
```

Si desea ver el uso de las funciones restantes puede ingresar a nuestra
página: [meteorodata](https://matifasolato.github.io/meteorodata/)

### Autores del paquete:

- [Matias Fasolato](https://github.com/MatiFasolato)  
  Estudiante de Ciencia de datos en la Universidad Austral de la ciudad
  de Rosario

- [Bautista Torregiani](https://github.com/BautistaTorregiani)  
  Estudiante de Ciencia de datos en la Universidad Austral de la ciudad
  de Rosario

### Contribuciones al paquete

Si deseas realizar contribuciones al paquete, ya sea para agregar
mejoras, corregir errores o proponer nuevas funciones, segui los
siguientes pasos:

1.  **Fork y clona el repositorio**: Haz un *fork* de este repositorio
    en tu cuenta de GitHub y clona el repositorio en tu máquina local.

2.  **Realiza la contribución y hace un pull request**: Realiza los
    cambios que consideres necesarios en tu copia del repositorio.
    Luego, abri un *pull request* a la rama principal del proyecto con
    una descripción clara del propósito de tu contribución.

Si tenes dudas o necesitas ayuda con el proceso de contribución, no
dudes en contactarnos a través de los siguientes correos electrónicos:

\- **Fasolato Matias**: <mfasolato@mail.austral.edu.ar>

\- **Torregiani Bautista**: <btorregiani@mail.austral.edu.ar>

#### Codigo de contribución:

<https://github.com/MatiFasolato/meteorodata/blob/master/.github/CONTRIBUTING.md>
