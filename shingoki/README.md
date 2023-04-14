### instrucciones para la ejecución de la practica

existen 3 archivos de código, encode.py, shingokiKB.lp y decode.py

el primero sirve para leer un archivo tipo .txt que contenga un ejemplo de shingoki a resolver y devolver una instancia del mismo (archivo .lp)

ejemplo de ejecución:
```python3 encode.py <shingoki-example.txt>```


shingokiKB.lp es donde se procesará este archivo y se buscará la solución

ejemplo de ejecución:
```clingo shingokiKB.lp input.txt > solution.txt ```


decoder.py transforma el output del shingokiKB.lp en una representacion grafica en formato txt

ejemplo de ejecución:
```python decode.py solution.txt```

la representación gráfica se verá en un documento "results.txt"


nuestro código es capaz de resolver cualquiera de los ejemplos dados en t < 1:30 min
