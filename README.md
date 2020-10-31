# SIR
_Simulador Interactivo de Resorte_ Este proyecto desarrolla en processing un simulador del movimiento oscilatorio de un sistema masa-resorte. Para ello, la estructura del codigo se divide en 3 partes: el algoritmo principal (donde esta el stup y el draw), el diseño de las interfaces y la solución del problema. 

## ALGORITMO PRINCIPAL

* void setup(): Se establece noCursor() para que sea establecido en el diseño de la interfaz (si es un elemento clickeable sera HAND y si no lo es sera ARROW). Tambien, se establece el tamaño del lienzo y se carga el icono a la ventana. Por ultimo, se llaman todos los recursos que se necesiten.

* void draw(): Al momento de inicar el programa se mostrara el logo del projecto, que se desvanecera poco a poco hasta mostrar la pantalla principal (screenId = 0). Usando un switch y la variable ScreenId se puede coordinar que pantalla se va a mostrar.  

## INTERFAZ DE USUARIO

* void inicio(): En esta pantalla se realiza la toma de datos. Esta consiste de varias imagenes, una de fondo y los botones (de musica, ayuda, aumentar y disminuir). Hay una zona reservada para la entrada de datos (por medio de spiner y de esta forma evitar la validación). Una vez que los datos de entrada sean suficientes la variable can se hara verdadera y permitira al usuario continuar por medio del boton "empezar"

* void howToUse(): **NO TERMINADO**

* void processing(): **NO TERMINADO**

* Estructura de las zonas activas 
```
if (mouseX > x && mouseY > y && mouseX < x + w && mouseY < y + h) {
  cursor(HAND);
  if (mousePressed) {
      ...
    }
} else if (..) {
    < mas acciones o condicionales >
} else {
    cursor(ARROW)
}
```
**_x_** y **_y_** son el punto de partida de la imagen o figura dibujada y **_w_** y **_h_** son el ancho y largo, respectivamente. La estructura de las zonas activas se escribe dentro de una función como una estrutura de condicional multiples. Estos condicionales *no* se pueden escribir por separado, si se escriben separados (es decir, no anidados) el cursos empezara a parpadear. 

## SOLUCIÓN DEL PROBLEMA

