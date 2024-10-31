<!-- README.md is generated from README.Rmd. Please edit that file -->

# meteorodata <img src="man/figures/meteoro.png" align="right" width="130"/>

<!-- badges: start -->

[![Lifecycle: experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental) [![R-CMD-check](https://github.com/MatiFasolato/meteorodata/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/MatiFasolato/meteorodata/actions/workflows/R-CMD-check.yaml) [![Codecov test coverage](https://codecov.io/gh/MatiFasolato/meteorodata/graph/badge.svg)](https://app.codecov.io/gh/MatiFasolato/meteorodata)

<!-- badges: end -->

# Objetivo:

El objetivo del paquete ‘meteorodata’ es facilitar el análisis de datos meteorológicos y la manipulación de los mismos mediante funciones implementadas en este paquete.

## Instalación

You can install the development version of meteorodata from [GitHub](https://github.com/) with:

``` r
# install.packages("pak")
pak::pak("MatiFasolato/meteorodata")
```

### Descarga de Datos:

Para llevar a cabo la descarga de los datasets referidos a las estaciones meteorologicas implementamos la siguiente funcion.

**`descargar_datos`**: toma un parametro correspondiente a la estación meteorológica y permite la lectura y/o descarga del dataset de la estación que se solicite.

### Funciones:

1.  **`C_to_F`**: Toma un valor numérico de la temperatura en Centigrados y calcula la equivalencia en grados fahrenheit.
2.  **`F_to_C`** : Toma un valor numérico de la temperatura en Fahrenheit y calcula la equivalencia en grados centígrados.
3.  **`tabla_resumen_temperatura`**: Recibe un dataframe que contiene informacion acerca de todas las estaciones meteorologicas y de acuerdo a la estacion especificada calcula medidas significativas.
4.  **`grafico_temperatura_mensual`**: Recibe un data frame con datos de una o mas estaciones y devuelve un grafico con el promedio mensual de la temperatura de abrigo a 150 cm.

## Ejemplo

Este es un ejemplo básico que muestra cómo instalar la librería del paquete:

``` r
library(meteorodata)
```

## Uso de las funciones:

```{r}
F_to_C(100)
```

```{r}
estacion_met <- descargar_datos("NH0098")
```

```{r}
C_to_F(23)
```

```{r}
grafico_temperatura_mensual(NH_unidos)
```

<img src="man/figures/README-example-1.png" width="100%"/>

```{r}
tabla_resumen_temperatura(NH_unidos,c('NH0910','NH0437'))
```

### Autores del paquete:

-   [Matias Fasolato](https://github.com/MatiFasolato)\
    Estudiante de Ciencia de datos en la Universidad Austral de la ciudad de Rosario

-   [Bautista Torregiani](https://github.com/BautistaTorregiani)\
    Estudiante de Ciencia de datos en la Universidad Austral de la ciudad de Rosario

### Contribuciones al paquete

Si deseas realizar contribuciones al paquete, ya sea para agregar mejoras, corregir errores o proponer nuevas funciones, segui los siguientes pasos:

1.  **Fork y clona el repositorio**: Haz un *fork* de este repositorio en tu cuenta de GitHub y clona el repositorio en tu máquina local.

2.  **Realiza la contribución y hace un pull request**: Realiza los cambios que consideres necesarios en tu copia del repositorio. Luego, abri un *pull request* a la rama principal del proyecto con una descripción clara del propósito de tu contribución.

Si tenes dudas o necesitas ayuda con el proceso de contribución, no dudes en contactarnos a través de los siguientes correos electrónicos:

\- **Fasolato Matias**: [mfasolato\@mail.austral.edu.ar](mailto:mfasolato@mail.austral.edu.ar){.email}

\- **Torregiani Bautista**: [btorregiani\@mail.austral.edu.ar](mailto:btorregiani@mail.austral.edu.ar){.email}

#### Codigo de contribución:

<https://github.com/MatiFasolato/meteorodata/blob/master/.github/CONTRIBUTING.md>
