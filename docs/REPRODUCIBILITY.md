# Reproducción y validación

1. Instale las dependencias desde `requirements.txt` en un entorno virtual.
2. Configure CmdStan una sola vez. En Windows necesita la cadena de compilación C++
   compatible con CmdStan. Instrucciones oficiales: https://mc-stan.org/cmdstanpy/installation.html.
3. Abra JupyterLab desde la raíz y ejecute `02_bayesian_analysis.ipynb` en orden.
   La búsqueda de raíz permite también abrirlo desde `notebooks/`.
4. Las fases 1-5 ajustan M1-M5 con 4 cadenas, 1000 iteraciones de calentamiento,
   1000 posteriores por cadena y semilla 1234. El reajuste para la partición de prueba
   usa 400 + 400 y semilla 42. No confunda sus muestras ni sus coeficientes.
5. Las métricas nuevas se escriben en `results/generated/`, excluido de Git.
   Los modelos se compilan localmente desde `stan_models/`; no se descargan de Dropbox.

Para reconstruir los datos, consulte `data/README.md`. Este paso es opcional para
el análisis principal y exige el archivo de delitos ausente. El notebook de preparación
conserva la transformación original; no se ejecutó con el CSV completo durante esta tarea.

La lista de dependencias expresa rangos de compatibilidad, no las versiones exactas
de la ejecución histórica. No garantiza identidad numérica entre plataformas/compiladores.
Use Python 3.11 o 3.12 como punto de partida y registre el entorno de una nueva ejecución.

El informe puede compilarse desde `docs/latex/` ejecutando dos veces
`pdflatex monografia_completa.tex`, o cargando ese archivo en Overleaf. No depende de
imágenes externas. El PDF incluido es el informe final recibido; no fue recompilado.

## Comprobaciones de esta preparación

- Sintaxis Python de todas las celdas seleccionadas.
- JSON y salidas vacías de los notebooks; rutas locales de los CSV y modelos Stan.
- Dimensiones de la tabla final, áreas únicas, población positiva, ausencia de nulos
  y coherencia de conteos y tasas.
- Integridad del ZIP, tamaño de archivos y exclusión de ejecutables/auxiliares.
- Conservación byte a byte del póster, informe, datos y modelos Stan seleccionados.

No se ejecutó MCMC, no se certifica la reproducción de las cifras originales y no se
compiló el informe. Las salidas archivadas permiten consultar los resultados existentes
sin instalar el entorno de inferencia.
