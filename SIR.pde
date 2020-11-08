import ddf.minim.*;
Minim minim;

solucion sol; 

color white = #ffffff;
color gris = #e0ece4;
color pink = #ff4b5c;
color blue = #32e0c4;
color dark = #222831;

int ScreenId = 0;
int beforeScreen = 0;

float x0, v0, m = 1, k, b, f; //DATOS DE ENTRADA
float w0, w, A0, A, t, y, desfase; //DATOS DE SALIDA
float e = 2.71828;
float spin = 0.5;

String movimiento = new String("Tipo de movimiento");
boolean music = true;
boolean play = true;
boolean can; //la variable can determina si ya se puede saltar a la siguiente pestaña, es decir, si ya se han dijitado los datos necesarios

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

AudioPlayer AcousticCampfireGuitar;
AudioPlayer AcousticHappyFolk;
AudioPlayer BassyEnergy;
AudioPlayer electriccBeep;
AudioPlayer ElectricCharge;
AudioPlayer ElectricRisingAudio;
AudioPlayer EpicScifiTrailer;
AudioPlayer FluteNotification;
AudioPlayer FunHappyUpbeat;
AudioPlayer FunKidsupbeat;
AudioPlayer FunUpbeatBlues;
AudioPlayer FutureTechBackground;
AudioPlayer HiphopHappy;
AudioPlayer SifiElectricRising;
AudioPlayer SpaceshipTypingSound;
AudioPlayer SportsTrapBeat;
AudioPlayer Therunwaygames;
AudioPlayer UpbeatSwing;
AudioPlayer VideoGame21;
AudioPlayer VideoGame45;
AudioPlayer VideoGame51;

void setup() {
  size(1000, 580);
  wave = new FloatList();

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

  minim = new Minim(this);
  AcousticCampfireGuitar = minim.loadFile("Musica/AcousticCampfireGuitar.mp3");
  AcousticHappyFolk = minim.loadFile("Musica/AcousticHappyFolk.mp3");
  BassyEnergy  = minim.loadFile("Musica/BassyEnergy.mp3");
  electriccBeep = minim.loadFile("Musica/electriccBeep.wav");
  ElectricCharge = minim.loadFile("Musica/ElectricCharge.wav");
  ElectricRisingAudio = minim.loadFile("Musica/ElectricRisingAudio.wav");
  EpicScifiTrailer = minim.loadFile("Musica/EpicScifiTrailer.mp3");
  FluteNotification = minim.loadFile("Musica/FluteNotification.wav");
  FunHappyUpbeat = minim.loadFile("Musica/FunHappyUpbeat.mp3");
  FunKidsupbeat = minim.loadFile("Musica/FunKidsupbeat.mp3");
  FunUpbeatBlues = minim.loadFile("Musica/FunUpbeatBlues.mp3");
  FutureTechBackground = minim.loadFile("Musica/FutureTechBackground.mp3");
  HiphopHappy = minim.loadFile("Musica/HiphopHappy.mp3");
  SifiElectricRising = minim.loadFile("Musica/SifiElectricRising.wav");
  SpaceshipTypingSound = minim.loadFile("Musica/SpaceshipTypingSound.wav");
  SportsTrapBeat = minim.loadFile("Musica/SportsTrapBeat.mp3");
  Therunwaygames = minim.loadFile("Musica/Therunwaygames.wav");
  UpbeatSwing = minim.loadFile("Musica/UpbeatSwing.mp3");
  VideoGame21 = minim.loadFile("Musica/VideoGame21.mp3");
  VideoGame45 = minim.loadFile("Musica/VideoGame45.mp3");
  VideoGame51 = minim.loadFile("Musica/VideoGame51.mp3");
}

boolean doThis = false; //esto es solo para detener la transición
float trans = 255;
void draw() {

  //pantalla de bienvenida
  if (millis() < 10000 && trans >= 0 && doThis) {
    background(dark);
    tint(255, trans);
    image(welcome, 0, 0, width, height);
    trans -= 1;
  } else {
    tint(255, 255);
    switch(ScreenId) {
    case 0: 
      background(34, 40, 49);
      inicio(); 
      break;
    case 1: 
      background(34, 40, 49);
      processing(); 
      break;
    case 2: 
      background(34, 40, 49);
      howToUse(); 
      break;
    }
  }
}

void mousePressed() {
  switch(ScreenId) {
  case 0:
    can = m != 0 && k != 0;
    if (mouseX > 140 && mouseY > 25 && mouseX < 140 + 40 && mouseY < 25 + 40) {
      beforeScreen = ScreenId;
      ScreenId = 2;
    } else if (mouseX > 627.6 && mouseY > 530 && mouseX < 627.6 + 127.6 && mouseY < 530 + 40 && can) {
      t = 0;
      wave = new FloatList();
      ScreenId = 1;
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
      ScreenId = 0;
    } else if (mouseX > 65 && mouseY > 5 && mouseX < 65 + 40 && mouseY < 5 + 40) {
      beforeScreen = ScreenId;
      ScreenId = 2;
    } else if (mouseX > 105 && mouseY > 5 && mouseX < 105 + 40 && mouseY < 5 + 40) {
      music = !music;
    } else if (mouseX > 400 && mouseY > 68 && mouseX < 400 + 40 && mouseY < 68 + 40) {
      play = !play;
    } else if (mouseX > 440 && mouseY > 68 && mouseX < 440 + 40 && mouseY < 68 + 40) {
      t += 0.1;
      wave.append(40 + 2*150 + 150*(y/A));
    }
    break;
  case 2:
    if (mouseX > 380 && mouseY > 20 && mouseX < 380 + 40 && mouseY < 20 + 40) {
      ScreenId = beforeScreen;
    } else if (mouseX > 600 && mouseY > 30 && mouseX < 600 + 75 && mouseY < 30 + 25) {
      link("https://sites.google.com/view/el-proyectoc-cmw/home");
    }
    break;
  }
}
