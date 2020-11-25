# SIR
_Simulador Interactivo de Resorte_ Este proyecto desarrolla en processing un simulador del movimiento oscilatorio de un sistema masa-resorte. Para ello, la estructura del codigo se divide en 3 partes: el algoritmo principal (donde esta el stup y el draw), el diseño de las interfaces y la solución del problema. 

## ALGORITMO PRINCIPAL

* void setup(): Se establece noCursor() para que sea establecido en el diseño de la interfaz (si es un elemento clickeable sera HAND y si no lo es sera ARROW). Tambien, se establece el tamaño del lienzo y se carga el icono a la ventana. Por ultimo, se llaman todos los recursos que se necesiten.

* void draw(): Al momento de inicar el programa se mostrara el logo del projecto, que se desvanecera poco a poco hasta mostrar la pantalla principal (screenId = 0). Usando un switch y la variable ScreenId se puede coordinar que pantalla se va a mostrar.  

* void mousePressed(): Es este se establece que sucederá según el lugar donde presionemos en la pantalla y en las pestañas del programa(Interfaz, howToUse, pantalla de bienvenida) usando switch con la variable ScreenId y condicionales dentro de los casos del switch se controlara lo que sucede en programa según donde presionemos 
```
void mousePressed() {
  
  switch(ScreenId) {
         case 0 :
                      if ( ) {
                           }
                      break;
         case 1 :
                      if ( ) {
                           }
                      break;
         case 2 :
                       if ( ) {
                           }
                     break;
}

```
## INTERFAZ DE USUARIO

* Como se había mencionado anteriormente, dependiendo del valor que tome ScreenId se mostrara una alguna de las siguiente pantallas:
  -1: llama la función empezar() donde unicamente se encuentra musica de fondo y el botón empezar.
   0: llama a la función inicio() donde se realiza la toma de datos.
   1: llama a la función processing () donde se muestra la animación.
   2: llama a la función HowToUse() donde esta el manual de usuario y el link al sitio web.
   3: llama a la función guardar1() - se pregunta al usuario si quiere guardar los datos.
   4: llama a la función guardar2() - se pregunta por la ruta y el tipo de archivo donde quiere guardar los datos.
   5: llama a la función guardar3() - se pregunta cuales datos quiere guardar.
   6: llama a la función subir() - se obtienen los datos de entrada desde un CSV.


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
* Para solucionar el problema físico, se implementaron diferentes formulas y diferentes espacios de aplicación, dando la siguiente estructura algorítmica:
                                      w0 = sqrt(k/m) // Velocidad angular inicial
                                 desfase = atan(-v0/ (w0 * x0) ) // Angulo de desfase

* Movimiento Armónico Simple (b == 0) Es un movimiento de condiciones ideales donde solo influyen las condiciones iniciales de la masa, la constante elástica, la posición inicial y la velocidad inicial.
```
w = w0; // es este tipo de movimiento la velocidad angular coincide con la inicial
A = sqrt(pow(x0, 2)+ pow(v0, 2)/pow(w0, 2)); // La amplitud, es la maxima elongación
y = A*cos(w*t + desfase); // La posición, esta varia según el tiempo 

```
* En los movimientos amortiguados aparecen nuevas variables. b es la constante de amortiguamiento y f es la fuerza.
Movimiento Subamortiguado (b < 2*m*w0)
Normal (b == 0)

```
 w = sqrt(k/m - pow(b, 2)/(4*pow(m, 2)));
 A = sqrt(pow(x0, 2)+ pow(v0, 2)/pow(w0, 2));
 y = A*pow(e, -b/(2*m)*t)*cos(w*t + desfase);
```
* Forzado  (b != 0)
```
w = sqrt((k/m)-pow(b, 2)/pow(4*m, 2));
A = (f/m)/sqrt(pow(pow(w, 2)-pow(w0, 2), 2)+pow(b*w/m, 2));
y = A*pow(e, -b/(2*m)*t)*cos(w*t + desfase);

```
* Movimiento Críticamente Amortiguado (b == 2*m*w0)

 Normal
```
w = sqrt(k/m - pow(b, 2)/(4*pow(m, 2)));
A = sqrt(pow(x0, 2)+ pow(v0, 2)/pow(w0, 2));
y = A*pow(e, -b/(2*m)*t)*cos(w*t + desfase);

```
Forzado  
```
w = sqrt((k/m)-pow(b, 2)/pow(4*m, 2));
A = (f/m)/sqrt(pow(pow(w, 2)-pow(w0, 2), 2)+pow(b*w/m, 2));
y = A*pow(e, -b/(2*m)*t)*cos(w*t + desfase);

```
* Movimiento Sobreamortiguado (b > 2*m*w0)

 Normal
```
w = w0;
A = sqrt(pow(x0, 2)+ pow(v0, 2)/pow(w0, 2));
l1 = ( -b / (2*m)) + sqrt(pow(b/(2*m), 2) - (k/m));
l2 = ( -b / (2*m)) - sqrt(pow(b/(2*m), 2) - (k/m));
y = c1*pow(e, l1 * t) + c2*pow(e, l2 * t);

```
Forzado  
```
w = sqrt((k/m));
A = (f/m)/sqrt(pow(pow(w, 2)-pow(w0, 2), 2)+pow(b*w/m, 2));
l1 = ( -b / (2*m)) + sqrt(pow(b/(2*m), 2) - (k/m));
l2 = ( -b / (2*m)) - sqrt(pow(b/(2*m), 2) - (k/m));
y = c1*pow(e, l1 * t) + c2*pow(e, l2 * t);

```

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
man | int | Determina que imagen del manual de usuario se mostrara
 
 



