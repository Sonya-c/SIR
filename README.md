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
* clase solucion: La clase solución es la que se encarga de verificar el tipo de movimiento y hallar los valores de las incognitas. Para ello, utiliza metodos privados, cada uno resuelve un movimiento diferentes esto es mas por practicidad (hace mas facil depurar y correjir el codigo) que por eficiencia. 

## Diccionario de variables 
Variable(s) | Tipo | Definición
------------ | ------------- | -------------
white, gris, pink, blue, dark | color | Son los colores tema de la interfaz de usuario. Como estos se repetiran constantemente atravez de codigo, se obto por crear una variable para referenciarlos.
movimiento | string | Esta variable sera utlizada para inidicarle al usuario que tipo de movimiento oscilatorio describe el sistema (su valor dependera de los resultados del experimento).
music | boolean | Esta es una variable de control que le indicara al programa si se debe reproducir los efectos de sonido y la musica de fondo (su valor dependera de lo que decida el usuario).
ScreenId | int | Esta es una variable de control que se le indica al programa cual pantalla debera mostar.
beforeScreen | int | Esta sera utlizada mayormente en el howToUse ya que esta presente en todas las pantallas y al momento de regresar necesita saber cual fue la pantalla anterior.
x0 | float | Dato de entrada: la posición inicial de la masa
v0 | float | Dato de entrada: la velocidad inicial de la masa
m | float |  Dato de entrada: el valor de la masa, que no puede ser ni 0 ni negativo
k | float |  Dato de entrada: el valor de la constante elastica del resorte, no puede ser negativa
b | float |  Dato de entrada: el valor de la constante de amortiguamiento (es un dato opcional)
f | float |  Dato de entrada: el valor de la fuerza (es un dato opcional)
w0 | float | Dato de salida: es el valor de la velocidad angular inicial
w | float | Dato de salida: la velocidad angular 
A0 | float | Dato de salida: la amplid inicial 
A | float | Dato de salida: la amplitud 
t | float | Dato de salida: tiempo
desfase | float | Dato de salida: el angulo de desfase 
y | float | Dato de salida: la posición de la masa
e | float | Es una constante que se utilizara en diferentes procesos
spin | float | Este es utilizado en el la toma de datos (inica cuanto aumenta o disminuye un dato en el spiner) y se utiliza como delta del tiempo (que marca el paso del tiempo)
icon | imagen | Es el icono que se vera en la ventana y en la barra de tareas
welcome, scream0, scream1 | imagen | Son los fondos que se veran en las diferentes pantallas
help, izq, der, help_buttom, musicOn, musicOff | imagen | Son botones que se veran en las diferentes pantallas
masa, resorte | imagen | Es la masa y el resorte que se utilizaran en la animación
man | int | Determina que imagen del manual se mostrara
 
 



