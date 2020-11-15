
void inicio() {
  can = m != 0 && k != 0;
  noStroke();
  image(scream0, 0, 0, width, height); 
  image(help_buttom, 140, 25, 40, 40);

  FunKidsupbeat.pause();

  if (music) {    
    HiphopHappy.play();
    image(musicOn, 180, 25, 40, 40);
  } else {
    image(musicOff, 180, 25, 40, 40);
    HiphopHappy.pause();
  }  

  //Boton para pasar a la siguiente pestaña
  if (can)
    fill(blue); 
  else

    fill(gris); 
  rect(627.6, 530, 127.6, 40, 7);

  //TITULOS
  fill(dark);
  textSize(15);
  textAlign(CENTER, CENTER);
  text("Empezar", 627.6, 530, 127.6, 40);

  textAlign(CENTER);
  text("Masa", 685, 120);
  text("Constante Elástica", 685, 190);
  text("Posición Inicial", 685, 260);
  text("Velocidad Inicial", 685, 330);
  text("Constante de Amortiguamiento", 685, 400);
  text("Fuerza", 685, 470);

  //CUADRO DE VALORES//
  fill(white); //primero se dibuja un cuadro blanco
  rect(627.6, 125, 127.6, 40, 5);
  rect(627.6, 195, 127.6, 40, 5);
  rect(627.6, 265, 127.6, 40, 5);
  rect(627.6, 335, 127.6, 40, 5);
  rect(627.6, 405, 127.6, 40, 5);
  rect(627.6, 475, 127.6, 40, 5);
  fill(dark); //Ahora se escriben los valores
  textAlign(CENTER, CENTER);
  text(""+m, 627.6, 125, 127.6, 40);
  text(""+k, 627.6, 195, 127.6, 40);
  text(""+x0, 627.6, 265, 127.6, 40);
  text(""+v0, 627.6, 335, 127.6, 40);
  text(""+b, 627.6, 405, 127.6, 40);
  text(""+f, 627.6, 475, 127.6, 40);

  //BOTONES Izquierda y Derecha//
  //la pocición de inicio (587.6) de los botones esta dada por: 627.6 (x inicial de los cuadros) menos 40 (el ancho de los botones)// 
  image(izq, 587.6, 125, 40, 40);
  image(izq, 587.6, 195, 40, 40);
  image(izq, 587.6, 265, 40, 40);
  image(izq, 587.6, 335, 40, 40);
  image(izq, 587.6, 405, 40, 40);
  image(izq, 587.6, 475, 40, 40);
  //La posición de inicio esta dado por: 627.6 (x inicial de los cuadros) mas 127.6 (el ancho  de los cuadros)//
  image(der, 753.2, 125, 40, 40);
  image(der, 753.2, 195, 40, 40);
  image(der, 753.2, 265, 40, 40);
  image(der, 753.2, 335, 40, 40);
  image(der, 753.2, 405, 40, 40);
  image(der, 753.2, 475, 40, 40);
}

void processing() {
  noStroke();
  image(scream1, 0, 0, width, height);
  image(izq, 20, 5, 40, 40);
  image(help_buttom, 65, 5, 40, 40);

  HiphopHappy.pause();

  if (music) {
    image(musicOn, 105, 5, 40, 40);
    FunKidsupbeat.play();
  } else {
    image(musicOff, 105, 5, 40, 40);
    FunKidsupbeat.pause();
  }

  if (guardar) {
    image(download, 145, 5, 40, 40);
  }

  if (play) {
    image(pause, 400, 68, 40, 40);
    t += 0.1;
  } else {
    image(der, 400, 68, 40, 40);
  }
  image(more, 440, 68, 40, 40);
  
  

  fill(dark);
  textSize(12);
  textAlign(LEFT, CENTER);
  text("t = "+int(t)+" s", 550, 85);
  textAlign(CENTER, CENTER);
  text(""+m, 850, 90, 115, 30);
  text(""+k, 850, 90 + 50, 115, 30);
  text(""+x0, 850, 90 + 2*50, 115, 30);
  text(""+v0, 850, 90 + 3*50, 115, 30);
  text(""+b, 850, 90 + 4*50, 115, 30);
  text(""+f, 850, 90 + 5*50, 115, 30);
  text(""+w0, 850, 90 + 6*50, 115, 30);
  text(""+w, 850, 90 + 7*50, 115, 30);
  text(""+A, 850, 90 + 8*50, 115, 30);
  fill(white);
  textSize(20);
  text(movimiento, 500, 20);
  
  sol = new solucion();
  animacion();
  datos();
  
  if (pop_time >= 0 && pop1_messange) {
    image(pop1, 250, 250);
    pop_time -= 1;
  }
}

void howToUse() {
  image(help, 0, 0, 1000, 580);
  image(izq, 380, 20, 40, 40);

  fill(pink);
  rect(600, 30, 75, 25, 7); //Este corresponde al boton de ir al sitio web
  fill(white);
  textAlign(CENTER, CENTER);
  text("Sitio web", 600, 25, 75, 25);
}

void guardar1 () {
  image(guardar1, 0, 0, width, height);
  noStroke();
  fill(pink);
  rect(300, 350, 100, 40, 10);
  rect(600, 350, 100, 40, 10);
  fill(white);
  textSize(15);
  textAlign(CENTER, CENTER);
  text("NO", 300, 350, 100, 40);
  text("SI", 600, 350, 100, 40);
}

void guardar2 () {
  image(guardar2, 0, 0, width, height);
  noStroke();

  fill(pink);
  rect(300, 380, 100, 40, 10);
  rect(600, 380, 100, 40, 10);

  fill(white);
  rect(500, 150, 300, 30, 10);
  rect(580, 230, 20, 20, 10);
  rect(580, 270, 20, 20, 10);
  rect(500, 310, 300, 30, 10);

  textSize(15);
  textAlign(CENTER, CENTER);
  text("Calcelar", 300, 380, 100, 40);
  text("Continuar", 600, 380, 100, 40);

  fill(dark);
  textSize(12);
  textAlign(LEFT, CENTER);
  text("Todos", 502, 310, 300, 30);
  text(path, 502, 150, 300, 30);
  
  if (extension == "html") {
    rect(582.5, 232.5, 15, 15, 10);
  } else {
    rect(582.5, 272.5, 15, 15, 10);
  }
}
