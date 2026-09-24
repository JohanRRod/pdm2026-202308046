## Pregunta de Comprensión

**¿Qué hace `setState` cuando presiona un botón y qué ocurriría si cambia los puntos sin llamarlo?**

**Respuesta:**  
Cuando se llama a `setState`, le notifica al framework de Flutter que el estado interno del objeto `State` ha cambiado. Esto provoca que Flutter programe una reevaluación del método `build()`, rediseñando y actualizando la interfaz de usuario en la pantalla con los nuevos valores.

Si se cambian las variables de los puntos (por ejemplo, `_puntosEquipoA++`) **sin llamar a `setState`**, la variable en memoria sí actualizará su valor correctamente, pero **la interfaz de usuario no se rediseñará ni se actualizará en la pantalla**. El usuario continuará viendo los números y colores antiguos hasta que algún otro evento obligue a redibujar el widget.