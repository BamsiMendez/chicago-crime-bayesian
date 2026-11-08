# Notas de la versión para GitHub

## Selección y adaptación

Se conservan el póster final y el informe final existentes sin editar. Se incluye
la fuente del informe y dos notebooks: preparación (`notebook_1`) y análisis final
(`notebook_6`). Se retiran notebooks 2-5, guías, documentos para defensa, plantillas,
compilados Stan, copias de figuras, auxiliares LaTeX y borradores.
Los CSV agregados y los dos modelos Stan se conservan íntegros.

Se normalizan rutas, se sustituyen descargas de Dropbox por archivos del repositorio,
se quitan instalaciones automáticas y salidas incrustadas, se conservan resultados
numéricos en `results/archived_results.md` y se aclaran textos que no correspondían
al código (por ejemplo, supuestos efectos categóricos por distrito).

## Resultados empíricos y ejemplos simulados

La antigua celda 73 (sección 7.5) de `notebook_6.ipynb` usa explícitamente `beta_mock`,
coeficientes generados con una normal y conteos/predicciones de ejemplo. Se excluye
del notebook publicado. También se excluyen como figuras independientes el forest
plot 21 y el escenario 22, asociados a esa sección ilustrativa.
El póster original los contiene: sus efectos multiplicativos aproximados 1.46, 1.28,
0.83 y la reducción 31.3% no deben citarse como estimaciones verificadas de la posterior.
No se sustituyeron esos números por otros ni se modificaron los documentos históricos.

La sección 7.4 sí calcula escenarios usando las muestras de `fit_bayes`, el ajuste
de entrenamiento con 400 muestras por cadena. Su salida archivada usa otras áreas
(Greater Grand Crossing, Washington Park, Oakland, Riverdale y West Englewood) y
reducciones aproximadas del 41%. Se conserva como predicción condicional exploratoria;
no identifica delitos evitados mediante una intervención causal.

## Discrepancias entre documentos

| Cantidad | Póster final | Salida guardada del notebook |
|---|---:|---:|
| M1 elpd_loo | -145201.30 | -208218.63 |
| M3 elpd_loo | -138410.90 | -139023.13 |
| M4 elpd_loo | -824.12 | -825.63 |
| M5 elpd_loo | -811.45 | -811.45 |

Las tablas archivadas son la referencia para la ejecución guardada. No se armonizaron
las cifras del PDF porque eso exigiría revisar y reejecutar la investigación. El campo
`WAIC` del notebook contiene `elpd_waic` (mayor es mejor); la escala de devianza es
`-2*elpd_waic`. No deben mezclarse ni confundirse con `elpd_loo`.

En Pareto k, la tabla archivada registra 67, 61 y 67 observaciones con k >= 0.7
para M1-M3; los conteos con k >= 1 son 63, 56 y 59. El texto original confunde
estos dos umbrales. M4 tiene una observación con k >= 1; M5 no tiene k >= 0.7.
Las diferencias numéricas de LOO con modelos de k alto deben interpretarse con cautela.

La selección de modelo y la estandarización se realizan antes de la partición de
entrenamiento/prueba: la fase 6 es una referencia exploratoria y no una validación
anidada libre de uso previo del conjunto de prueba. No se cambia ese protocolo aquí.
Las afirmaciones causales y de dependencia espacial en los documentos van más allá
de lo demostrado por este código; una evaluación espacial formal queda pendiente.

El `main.tex` disponible del póster corresponde a otro diseño y título; se omite para
evitar presentarlo como fuente del PDF final. Solo se incluye la fuente del informe.
