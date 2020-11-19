import ddf.minim.*;
import processing.sound.*;
Minim minim;

solucion sol; 

//VARIABLES RELACIONADAS A LA TOMA DE DATOS
Table table;
TableRow row;

//LOS COLORES
color white = #ffffff;
color gris = #e0ece4;
color pink = #ff4b5c;
color blue = #32e0c4;
color dark = #222831;

int ScreenId = -1; // Indica la pantalla que se esta mostrando
int beforeScreen = 0; // Indica la pantalla anterior. se usa en el how to use (que aparece en diferentes sitio)
int pop_time = 125; // Indica cuanto dura un mesaje (se usa cuando se desargan datos)

float x0, v0, m = 1, k, b, f; // DATOS DE ENTRADA
float w0, w, A0, A, t, y, desfase; // DATOS DE SALIDA
float e = 2.71828; // Es una constante
float spin = 0.5; // Indica como aumenta o disminulle los spiners en la toma de datos

String movimiento = new String("Tipo de movimiento");
String path = new String("DATA"); // Indica la ruta donde se va a guardar la tabla de datos
String extension = new String("csv"); // Indica que extensión tendra la table de datos (csv o html)
String datos; // Indica si el usuario selecciono guardar todos los datos o solo algunos

boolean music = true; // Indica si la musica debe sonar o no
boolean can = false; // Permite saltar al experimento si ya se han dijitado los datos necesarios
boolean pop1_messange = false; // Es verdadera cuando se han descargado datos
boolean play = true; /*
 *Indica si el experiemnto esta en pausa o no
 *Si es falsa el proceso de halla la solución se detendra
 *Si es falsa la animación se detendra
 *Si es falsa el proceso de guardar datos se detendra
 */
boolean guardar = false; /*
 *Indica si el usuario quiere guarar los datos
 *Si es falsa todo el proceso de toma de datos se detendra
 */
 
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
PImage download;
PImage pop;
PImage empezar;

AudioPlayer BassyEnergy;
AudioPlayer Epic;
AudioPlayer FunKidsupbeat;
AudioPlayer HiphopHappy;
AudioPlayer VideoGame51; // Efecto de sonido "play"
SoundFile Clic;

void setup() {
  size(1000, 580);

  wave = new FloatList();
  wave = new FloatList();
  table = new Table();  

  //movimiento,x0, v0, m = 1, k, b, f, w0, w, A, t, y; 
  table.addColumn("Movimiento");
  table.addColumn("Posición inicial");
  table.addColumn("Velocidad inicial");
  table.addColumn("Masa");
  table.addColumn("Constante elastica");
  table.addColumn("Constante de amortigüamiento");
  table.addColumn("Fuerza");
  table.addColumn("Velocidad angular inicial");
  table.addColumn("Velocidad angular");
  table.addColumn("Amplitud");
  table.addColumn("Tiempo");
  table.addColumn("Posición");

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
  download = loadImage("Imagenes/download.png");
  pop = loadImage("Imagenes/pop.png");
  empezar = loadImage("Imagenes/EMPEZAR.png");
  
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
    Epic.play();
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
    }
  }
}

void mouseClicked () {
  Clic.play();
} 


void mousePressed() {
  switch(ScreenId) {
  case - 1:
    if (mouseX > 400 && mouseY > 240 && mouseX < 400 + ancho && mouseY < 240 + largo) {
      cambiar = true;
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
      saveTable(table, path+"/"+movimiento+"."+extension, extension); // Con esto se descarga la tabla
      pop1_messange = true; // Y con esto se muestra el mensaje
    } else if (mouseX > 440 && mouseY > 68 && mouseX < 440 + 40 && mouseY < 68 + 40) {
      t += 0.1;
      
      wave.append(40 + 2*150 + 150*(y/A)); 
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
      // Con esto se va a preguntar por la especificaciones en la toma de datos
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
    } else if (mouseX > 600 && mouseY > 380 && mouseX < 600 + 100 && mouseY < 380 + 40) {
      t = 0;
      wave = new FloatList();
      guardar = true;
      ScreenId = 1;
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
