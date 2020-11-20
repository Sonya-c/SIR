import ddf.minim.*;
import processing.sound.*;

Minim minim;

solucion sol; 

//VARIABLES RELACIONADAS A LA TOMA DE DATOS
boolean subiendo; // le indica a la función subirdatos que suba los datos
boolean guardar = false; /*
 *Indica si el usuario quiere guarar los datos
 *Si es falsa todo el proceso de toma de datos se detendra
 */

TableRow row; // las filas
Table entradas; // tabla de entradas
Table salidas; // tabla de salidas

// Estas variables indican que datos quiere el usuario guardar
boolean row_PosicionInicial = true;
boolean row_VelocidadInicial = true;
boolean row_Masa = true;
boolean row_ConstanteElastica = true;
boolean row_ConstantedeAmortiguamiento = true;
boolean row_Fuerza = true;
boolean row_VelocidadAngularInicial = true;
boolean row_VelocidadAngular = true;
boolean row_Amplitud = true;
boolean row_Tiempo = true;
boolean row_Posicion = true;

//LOS COLORES
color white = #ffffff;
color gris = #e0ece4;
color pink = #ff4b5c;
color blue = #32e0c4;
color dark = #222831;

int ScreenId = 0; 
/* Indica la pantalla que se esta mostrando
 * - 1 : empezar() se encuentra en boton de empezar
 * 0 : inicio() pantalla de la toma de datos
 * 1 : processing () pantalla de el processo
 * 2 : HowToUse() pantalla de ayuda
 * 3 : guardar1() - se pregunta al usuario si quiere guardar los datos
 * 4 : guardar2() - se pregunta por la ruta y el tipo de archivo donde quiere guardar los datos
 * 5 : guardar3() - se pregunta cuales datos quiere guardar
 * 6 : subir() - se obtienen los datos de entrada desde un html o un CSV
 */
int beforeScreen = 0; // Indica la pantalla anterior. se usa en el how to use (que aparece en diferentes sitio)

float x0, v0, m = 1, k, b, f; // DATOS DE ENTRADA
float w0, w, A0, A, t, y, desfase; // DATOS DE SALIDA
float e = 2.71828; // Es una constante
float spin = 0.5; // Indica como aumenta o disminulle los spiners en la toma de datos

String movimiento = new String("Tipo de movimiento");
String path = new String("DATA"); // Indica la ruta donde se va a guardar la tabla de datos
String table_name =""; //Indica el nombre de la tabla de datos de entrada
String extension = new String("csv"); // Indica que extensión tendra la table de datos (csv o html)

boolean music = true; // Indica si la musica debe sonar o no
boolean can = false; // Permite saltar al experimento si ya se han dijitado los datos necesarios
boolean play = true; /*
 *Indica si el experiemnto esta en pausa o no
 *Si es falsa el proceso de halla la solución se detendra
 *Si es falsa la animación se detendra
 *Si es falsa el proceso de guardar datos se detendra
 */
 
int pop_time;
boolean hacer_pop = false; //indica que se quiere hacer un pop
String mensaje; 

PImage icon;
PImage welcome;
PImage scream0; 
PImage scream1;
PImage help;
PImage izq;
PImage der;
PImage help_buttom;
PImage musicOn;
PImage musicOff;
PImage masa;
PImage resorte;
PImage more;
PImage less;
PImage pause;
PImage guardar1;
PImage guardar2;
PImage guardar3;
PImage download;
PImage pop;
PImage empezar;
PImage subir;
PImage subir_pantalla;

AudioPlayer BassyEnergy;
AudioPlayer Epic;
AudioPlayer FunKidsupbeat;
AudioPlayer HiphopHappy;
AudioPlayer VideoGame51; // Efecto de sonido "play"
SoundFile Clic;

void setup() {
  size(1000, 580);

  wave = new FloatList();
  entradas = new Table();
  salidas = new Table();

  //Cambiar el icono de la ventana
  icon = loadImage("Imagenes/Icon.png");
  surface.setIcon(icon);

  scream0 = loadImage("Imagenes/Initial_Data.png");
  welcome = loadImage("Imagenes/Welcome.png");
  izq = loadImage("Imagenes/izq.png");
  der = loadImage("Imagenes/der.png");
  help_buttom = loadImage("Imagenes/help.png");
  help = loadImage("Imagenes/HowToUse.png");
  musicOn = loadImage("Imagenes/musicOn.png");
  musicOff = loadImage("Imagenes/musicOff.png");
  scream1 = loadImage("Imagenes/proceso.png");
  masa = loadImage("Imagenes/masa.png");
  resorte = loadImage("Imagenes/resorte.png");
  more = loadImage("Imagenes/more.png");
  less = loadImage("Imagenes/less.png");
  pause = loadImage("Imagenes/pause.png");
  guardar1 = loadImage("Imagenes/guardar1.png");
  guardar2 = loadImage("Imagenes/guardar2.png");
  guardar3 = loadImage("Imagenes/guardar3.png");
  download = loadImage("Imagenes/download.png");
  pop = loadImage("Imagenes/pop.png");
  empezar = loadImage("Imagenes/EMPEZAR.png");
  subir = loadImage("Imagenes/subir.png");
  subir_pantalla = loadImage("Imagenes/subir_pantalla.png");

  Clic = new SoundFile(this, "Musica/Clic.mp3");
  minim = new Minim(this);

  BassyEnergy  = minim.loadFile("Musica/BassyEnergy.mp3");
  Epic = minim.loadFile("Musica/Epic.mp3");
  FunKidsupbeat = minim.loadFile("Musica/FunKidsupbeat.mp3");
  HiphopHappy = minim.loadFile("Musica/HiphopHappy.mp3");
  VideoGame51 = minim.loadFile("Musica/VideoGame51.mp3");
}



boolean doThis = true; // Esto es solo para detener la transición
float trans = 255; // Indica el tiempo en el que durara la pantalla de bienvenida

void draw() {
  // Pantalla de bienvenida
  if (millis() < 10000 && trans >= 0 && doThis) {
    background(dark); 
    tint(255, trans); // Esto determina la opacidad de la imagen
    image(welcome, 0, 0, width, height);
    trans -= 1;
    Epic.play(); // sonido epico de fondo
    
  } else {
    tint(255, 255);
    background(34, 40, 49);
    
    switch(ScreenId) {
    case -1:
      empezar();
      break;
    case 0: 
      inicio(); 
      break;
    case 1: 
      processing(); 
      break;
    case 2: 
      howToUse(); 
      break;
    case 3:
      guardar1();
      break;
    case 4:
      guardar2();
      break;
    case 5: 
      guardar3();
      break;
    case 6:
      subir();
      break;
    }
    pop_mensaje();
  }
}

void mouseClicked () {
  Clic.play(); // sonido que se escuchara a hacer click en cualquier sitio de la pantalla
} 


void mousePressed() {
  switch(ScreenId) {

  case - 1:
    if (mouseX > 400 && mouseY > 240 && mouseX < 400 + ancho && mouseY < 240 + largo) {
      cambiar = true; // boton de EMPEZAR 
      // con la variable empezar se inicia la transición a la toma de datos
    }
    break;

  case 0:
    can = m != 0 && k != 0;
    if (mouseX > 140 && mouseY > 25 && mouseX < 140 + 40 && mouseY < 25 + 40) {
      beforeScreen = ScreenId; // Con esto se salta al how to use
      ScreenId = 2;
    } else if (mouseX > 627.6 && mouseY > 530 && mouseX < 627.6 + 127.6 && mouseY < 530 + 40 && can) {
      ScreenId = 3; // Con esto se pregunta si se quiere tomar datos
    } else if (mouseX > 180 && mouseY > 25 && mouseX < 180 + 40 && mouseY < 25 + 40) {
      music = !music;
    } else if (mouseX > 220 && mouseY > 25 && mouseX < 220 + 40 && mouseY < 25 + 40) {
      ScreenId = 6; // mover a la pestaña de subir
    } else if (mouseX > 587.6 && mouseY > 125 && mouseX < 627.6 && mouseY < 125 + 40 && m - spin > 0) {
      m -= spin;
    } else if (mouseX > 587.6 && mouseY > 195 && mouseX < 587.6 + 40 && mouseY < 195 + 40 && k - spin > 0) {
      k -= spin;
    } else if (mouseX > 587.6 && mouseY > 265 && mouseX < 587.6 + 40 && mouseY < 265 + 40) {
      x0 -= spin;
    } else if (mouseX > 587.6 && mouseY > 335 && mouseX < 587.6 + 40 && mouseY < 335 + 40) {
      v0 -= spin;
    } else if (mouseX > 587.6 && mouseY > 405 && mouseX < 587.6 + 40 && mouseY < 405 + 40) {
      b -= spin;
    } else if (mouseX > 587.6 && mouseY > 475 && mouseX < 587.6 + 40 && mouseY < 475 + 40) {
      f -= spin;
    } else if (mouseX > 753.2 && mouseY > 125 && mouseX < 753.2 + 40 && mouseY < 125 + 40) {
      m += spin;
    } else if (mouseX > 753.2 && mouseY > 195 && mouseX < 753.2 + 40 && mouseY < 195 + 40) {
      k += spin;
    } else if (mouseX > 753.2 && mouseY > 265 && mouseX < 753.2 + 40 && mouseY < 265 + 40) {
      x0 += spin;
    } else if (mouseX > 753.2 && mouseY > 335 && mouseX < 753.2 + 40 && mouseY < 335 + 40) {
      v0 += spin;
    } else if (mouseX > 753.2 && mouseY > 405 && mouseX < 753.2 + 40 && mouseY < 405 + 40) {
      b += spin;
    } else if (mouseX > 753.2 && mouseY > 475 && mouseX < 753.2 + 40 && mouseY < 475 + 40) {
      f += spin;
    }
    break;

  case 1:
    if (mouseX > 20 && mouseY > 5 && mouseX < 20 + 40 && mouseY < 5 + 40) {
      ScreenId = 0; //con esto se regresa a la pantala principal
    } else if (mouseX > 65 && mouseY > 5 && mouseX < 65 + 40 && mouseY < 5 + 40) {
      beforeScreen = ScreenId; // con esto se va al how to use
      ScreenId = 2;
    } else if (mouseX > 105 && mouseY > 5 && mouseX < 105 + 40 && mouseY < 5 + 40) {
      music = !music;
    } else if (mouseX > 400 && mouseY > 68 && mouseX < 400 + 40 && mouseY < 68 + 40) {
      play = !play;
    } else if (mouseX > 145 && mouseY > 5 && mouseX < 145 + 40 && mouseY < 5 + 40 && guardar) {
      saveTable(entradas, path+"/ENTRADAS_"+movimiento+"."+extension, extension); // Con esto se descarga la tabla de entradas
      saveTable(salidas, path+"/SALIDAS_"+movimiento+"."+extension, extension); // Con esto se descarga la tabla de salidas
      mensaje = "¡Los datos se han guadardo exitosamente!"; hacer_pop = true; pop_time = 225;
    } 
    break;

  case 2:
    if (mouseX > 380 && mouseY > 20 && mouseX < 380 + 40 && mouseY < 20 + 40) {
      ScreenId = beforeScreen; // Con esto se devuelve a la pantalla anterior
    } else if (mouseX > 600 && mouseY > 30 && mouseX < 600 + 75 && mouseY < 30 + 25) {
      link("https://sites.google.com/view/el-proyectoc-cmw/home");
    }
    break;

  case 3:
    if (mouseX > 300 && mouseY > 350 && mouseX < 300 + 100 && mouseY < 350 + 40) {
      // Con esto se salta a la pantalla principla NO SE TOMAN DATOS
      t = 0; 
      wave = new FloatList();
      ScreenId = 1;
      guardar = false;
    } else if (mouseX > 600 && mouseY > 350 && mouseX < 600 + 100 && mouseY < 350 + 40) {
      ScreenId = 4;
    }
    break;

  case 4:
    if (mouseX > 500 && mouseY > 150 && mouseX < 500 + 200 && mouseY < 150 + 30) {
      //CON ESTO SE LE PREGUNTA AL USURIO DONDE QUIERE GUARDAR LA TABLA --> VER FUNCIÓN folderSelected
      selectFolder("Select a folder to process:", "folderSelected");
    } else if (mouseX > 580 && mouseY > 230 && mouseX < 580 + 20 && mouseY < 230 + 20) {
      extension = "html";
    } else if (mouseX > 580 && mouseY > 270 && mouseX < 580 + 20 && mouseY < 270 + 20) {
      extension = "csv";
    } else if (mouseX > 300 && mouseY > 380 && mouseX < 300 + 100 && mouseY < 380 + 40) {
      //CON ESTO LA OPERACION SE CANCELA
      ScreenId = 3;
    } else if (mouseX > 502 && mouseY > 310 && mouseX < 502 + 300 && mouseY < 310 + 30) {
      ScreenId = 5;
    } else if (mouseX > 600 && mouseY > 380 && mouseX < 600 + 100 && mouseY < 380 + 40) {
      t = 0;
      wave = new FloatList();
      guardar = true;
      if (row_PosicionInicial)
        entradas.addColumn("Posicion inicial");
      if (row_VelocidadInicial)
        entradas.addColumn("Velocidad inicial");
      if (row_Masa)
        entradas.addColumn("Masa");
      if (row_ConstanteElastica)
        entradas.addColumn("Constante elastica");
      if (row_ConstantedeAmortiguamiento)
        entradas.addColumn("Constante de amortiguamiento");
      if (row_Fuerza)
        entradas.addColumn("Fuerza");
      if (row_VelocidadAngularInicial)
        salidas.addColumn("Velocidad angular inicial");
      if (row_VelocidadAngular)
        salidas.addColumn("Velocidad angular");
      if (row_Amplitud)
        salidas.addColumn("Amplitud");
      if (row_Tiempo)
        salidas.addColumn("Tiempo");
      if (row_Posicion)
        salidas.addColumn("Posicion");
      ScreenId = 1;
    }
    break;

  case 5:
    if (mouseX > 60 && mouseY > 20 && mouseX < 60 + 30 && mouseY < 20 + 30) {
      // boton para cerrar
      ScreenId = 4;
    } else if (mouseX > 160 && mouseY > 130 && mouseX < 160 + 20 && mouseY < 130 + 20) { 
      // Posición inicial
      row_PosicionInicial = !row_PosicionInicial;
    } else if (mouseX > 160 && mouseY > 185 && mouseX < 160 + 20 && mouseY < 185 + 20) { 
      // velocidad inicial
      row_VelocidadInicial = !row_VelocidadInicial;
    } else if (mouseX > 160 && mouseY > 240 && mouseX < 160 + 20 && mouseY < 240 + 20) { 
      // masa
      row_Masa = !row_Masa;
    } else if (mouseX > 160 && mouseY > 295 && mouseX < 160 + 20 && mouseY < 295 + 20) { 
      // constante elastics
      row_ConstanteElastica = !row_ConstanteElastica;
    } else if (mouseX > 160 && mouseY > 350 && mouseX < 160 + 20 && mouseY < 350 + 20) { 
      // fuerza
      row_Fuerza = !row_Fuerza;
    } else if (mouseX > 160 && mouseY > 405 && mouseX < 160 + 20 && mouseY < 405 + 20) { 
      // constante de amortigüamiento
      row_ConstantedeAmortiguamiento = !row_ConstantedeAmortiguamiento;
      // DATOS DE SALIDA
    } else if (mouseX > 580 && mouseY > 130 && mouseX < 580 + 20 && mouseY < 130 + 20) { 
      // posición
      row_Posicion = !row_Posicion;
    } else if (mouseX > 580 && mouseY > 185 && mouseX < 580 + 20 && mouseY < 185 + 20) { 
      // tiempo
      row_Tiempo = !row_Tiempo;
    } else if (mouseX > 580 && mouseY > 240 && mouseX < 580 + 20 && mouseY < 240 + 20) { 
      // amplitud
      row_Amplitud = !row_Amplitud;
    } else if (mouseX > 580 && mouseY > 295 && mouseX < 580 + 20 && mouseY < 295 + 20) { 
      // velocidad angular
      row_VelocidadAngular = !row_VelocidadAngular;
    } else if (mouseX > 580 && mouseY > 350 && mouseX < 580 + 20 && mouseY < 350 + 20) { 
      // velocidad angular inicial
      row_VelocidadAngularInicial = !row_VelocidadAngularInicial;
    }
    break;

  case 6:
    if (mouseX > 60 && mouseY > 20 && mouseX < 60 + 30 && mouseY < 20 + 30) {
      ScreenId = 0;
    }else if(mouseX > 160 && mouseY > 350 && mouseX < 160 + 20 && mouseY < 350 + 20) { 
      // println("fuerza");
      row_Fuerza = !row_Fuerza;
    } else if (mouseX > 160 && mouseY > 405 && mouseX < 160 + 20 && mouseY < 405 + 20) { 
      // println("constante de amortigüamiento");
      row_ConstantedeAmortiguamiento = !row_ConstantedeAmortiguamiento;
    } else if (mouseX > 550 && mouseY > 185 && mouseX < 550 + 300 && mouseY < 185 + 30) { 
      // println("ubicación");
      selectInput("Select a file to process:", "fileSelected");
    } else if (mouseX > 470 && mouseY > 500 && mouseX < 470 + 100 && mouseY < 500 + 30) {
      subiendo = true;
    } 
    break;
  }
}

void folderSelected(File selection) {
  if (selection == null) {
    println("Window was closed or the user hit cancel.");
  } else {
    path = selection.getAbsolutePath();
    println(path);
  }
}

void fileSelected(File selection) {
  if (selection == null) {
    mensaje = "No se encontró el archivo"; hacer_pop = true; pop_time = 225;
  } else {
    table_name = selection.getAbsolutePath();
  }
}
