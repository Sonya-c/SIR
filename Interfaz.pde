
void inicio() {
  cursor(ARROW);
  image(scream0, 0, 0, 1000, 580);
}

void howToUse() {

}

void processing() {
  //--->GRAFICAS<---//
  //Barra superior 
  noStroke();
  fill(white);
  rect(0, 0, 1000, 25);
  fill(dark);
  textSize(12);
  textAlign(CENTER);
  text("Volver", 0, 5, 100, 20);
  text("Pausar", 100, 5, 100, 20);
  text("Sonido "+music, 200, 5, 100, 20);
  text("Ayuda", 300, 5, 100, 20);
  text("Terminar", 400, 5, 100, 20);
  
  //--->ZONAS ACTIVAS<---//
  if (mouseX > 5 && mouseY > 0 && mouseX < 100 && mouseY < 25) {
    cursor(HAND);
    fill(blue, 50);
    rect( 0, 0, 100, 25);
    if (mousePressed) {
      ScreenId = 0;
    }
  } else if (mouseX > 100 && mouseY > 0 && mouseX < 200 && mouseY < 25) {
    cursor(HAND);
    fill(blue, 50);
    rect( 100, 0, 100, 25);
  } else if (mouseX > 200 && mouseY > 0 && mouseX < 300 && mouseY < 25) {
    cursor(HAND);
    fill(blue, 50);
    rect( 200, 0, 100, 25);
    if (mousePressed) {
      fill(white);
      rect( 200, 0, 100, 25);
      music = !music;
    }
  } else if (mouseX > 300 && mouseY > 0 && mouseX < 400 && mouseY < 25) {
    cursor(HAND);
    fill(blue, 50);
    rect( 300, 0, 100, 25);
  } else if (mouseX > 400 && mouseY > 0 && mouseX < 500 && mouseY < 25) {
    cursor(HAND);
    fill(pink, 50);
    rect( 400, 0, 100, 25);
  } else {
    cursor(ARROW);
  }
}
