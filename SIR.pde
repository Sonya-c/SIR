import ddf.minim.*;
Minim minim;

//VARIABLES GLOBALES
color white = #ffffff;
color gris = #e0ece4;
color pink = #ff4b5c;
color blue = #32e0c4;
color dark = #222831;

String movimiento = new String();
boolean music = true;
int ScreenId = 0;

float x0, vo, m, k, b, f, w0, w, A0, A, t, y, desfase, landa1, landa2, c1, c2;
float e = 2.71828;

PImage icon;
PImage welcome;
PImage scream0;

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
  noCursor();
  size(1000, 580);
  
  icon = loadImage("Imagenes/Icon.png");
  surface.setIcon(icon);
  scream0 = loadImage("Imagenes/Initial_Data.png");
  welcome = loadImage("Imagenes/Welcome.png");

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

/* PANTALLA
 * inicio ScreenId = 0
 * processing ScreenId = 1
 * howToUse ScreenId = 2
 */
float trans = 255;
void draw() {
  background(34, 40, 49);
  
  //if (millis() < 10000 && trans >= 0) {
  //  tint(255, trans);
  //  image(welcome, 0, 0, width, height);
  //  trans -= 1;    
  //} else {
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
    //}
  }
}
