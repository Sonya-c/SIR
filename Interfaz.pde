
float ancho = 200;
float largo = 100;
float dj_trans = 255;
boolean aumentar = true;
boolean cambiar = false;

void empezar() {
  BassyEnergy.play();
  if (cambiar && dj_trans > 0) {
    background(dark);
    tint(255, dj_trans);
    VideoGame51.play();
    dj_trans -= 1.5;
  } else if (cambiar && dj_trans <= 0) { 
    ScreenId = 0; // pasar a la toma de datos
  }
  
  image(empezar, 0, 0, width, height);
  
  // La variable ancho y largo estaran aumentado y dissminuyendo su valor, de esta forma el boton de empezar va a "palpitar"
  if (ancho == 210) {
    aumentar = false;
  } else if (ancho == 200) { 
    aumentar = true;
  }

  if (aumentar) {
    ancho = ancho + 0.5;
    largo = largo + 0.5;
  } else { 
    ancho = ancho - 0.5;
    largo = largo - 0.5;
  }
  noStroke();
  fill(pink);
  rect(400, 240, ancho, largo, 10); // BOTÓN DE INICIAR
  fill(white);
  textAlign(CENTER, CENTER);
  textSize(30);
  text("EMPEZAR", 400, 240, ancho, largo);
  /*
  fill(white);
   rect(350, 200, 30, 30, 30);
   rect(450, 200, 30, 30, 30);
   fill(dark);
   rect(355, 200, 20, 20, 30);
   rect(420, 200, 20, 20, 30);
   fill(pink);
   rect(350, 250, 250, ancho, largo);
   */
}

void inicio() {
  can = m != 0 && k != 0;
  noStroke();
  image(scream0, 0, 0, width, height); 
  image(help_buttom, 140, 25, 40, 40); // Botón de ayuda

  FunKidsupbeat.pause();

  if (music) {
    BassyEnergy.pause();
    HiphopHappy.play();
    image(musicOn, 180, 25, 40, 40); // Botón de musica activado
  } else {
    image(musicOff, 180, 25, 40, 40); // Botón de musica desactivado
    HiphopHappy.pause();
  }  
  image(subir, 220, 25, 40, 40);
  //Boton para pasar a la siguiente pestaña
  if (can)
    fill(blue); 
  else
    fill(gris); 
  rect(627.6, 530, 127.6, 40, 7); // Boton de continua (gris si no se puede pasar aun, azul si ya se han digitado los datos suficientes)
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
  rect(627.6, 125, 127.6, 40, 5); // masa
  rect(627.6, 195, 127.6, 40, 5); // constante elastica 
  rect(627.6, 265, 127.6, 40, 5); // posición inicial
  rect(627.6, 335, 127.6, 40, 5); // velocidad inicial
  rect(627.6, 405, 127.6, 40, 5); // constante de amortiguamiento
  rect(627.6, 475, 127.6, 40, 5); // fuerza
  fill(dark); //Ahora se escriben los valores
  textAlign(CENTER, CENTER);
  text(""+m, 627.6, 125, 127.6, 40); // masa
  text(""+k, 627.6, 195, 127.6, 40); // constante elastica
  text(""+x0, 627.6, 265, 127.6, 40); // posición inicial
  text(""+v0, 627.6, 335, 127.6, 40); // velocidad inicial
  text(""+b, 627.6, 405, 127.6, 40); // constante de amortiguamiento
  text(""+f, 627.6, 475, 127.6, 40); // fuerza

  //BOTONES Izquierda y Derecha//
  //la pocición de inicio (587.6) de los botones esta dada por: 627.6 (x inicial de los cuadros) menos 40 (el ancho de los botones)// 
  image(izq, 587.6, 125, 40, 40); // menos masa
  image(izq, 587.6, 195, 40, 40); // menos constante elastica
  image(izq, 587.6, 265, 40, 40); // menos posición inicial
  image(izq, 587.6, 335, 40, 40); // menos velocidad inicial
  image(izq, 587.6, 405, 40, 40); // menos constante de amoritiguamiento
  image(izq, 587.6, 475, 40, 40); // menos fuerza
  //La posición de inicio esta dado por: 627.6 (x inicial de los cuadros) mas 127.6 (el ancho  de los cuadros)//
  image(der, 753.2, 125, 40, 40); // mas masa
  image(der, 753.2, 195, 40, 40); // mas constante elastica
  image(der, 753.2, 265, 40, 40); // mas posición inicial
  image(der, 753.2, 335, 40, 40); // mas velocidad inicial
  image(der, 753.2, 405, 40, 40); // mas constante de amortigüamiento
  image(der, 753.2, 475, 40, 40); // mas fuerza
}

void processing() {
  noStroke();
  image(scream1, 0, 0, width, height);
  image(izq, 20, 5, 40, 40);
  image(help_buttom, 65, 5, 40, 40);

  HiphopHappy.pause();

  if (music) {
    image(musicOn, 105, 5, 40, 40); // boton de musica on
    FunKidsupbeat.play();
  } else {
    image(musicOff, 105, 5, 40, 40); // boton de musica off
    FunKidsupbeat.pause();
  }

  if (guardar) {
    image(download, 145, 5, 40, 40); // boton de descaragar
  }

  if (play) {
    image(pause, 400, 68, 40, 40); // boton para pausar
    t += 0.1;
  } else {
    image(der, 400, 68, 40, 40); // boton de play
  }

  // DATOS
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
  
  // PROCESSO DE SOLUCIÓN, ANIMACION Y ALMACENAMIENTO DE DATOS
  sol = new solucion();
  animacion();
  datos();

}

void howToUse() {
  image(help, 0, 0, 1000, 580);
  image(izq, 380, 20, 40, 40);
  if(man!=1){
    image(izq, 70, 270, 40, 40);
  }
  if(man!=8){
    image(der, 890, 270, 40, 40);
  }
  fill(pink);
  rect(600, 30, 75, 25, 7); //Este corresponde al boton de ir al sitio web
  fill(white);
  textAlign(CENTER, CENTER);
  text("Sitio web", 600, 25, 75, 25);
 
   switch(man) {
    case 1:
      image(manual1, 120, 90, 765, 400);
      break;
    case 2: 
      image(manual2, 120, 90, 765, 400);
      break;
    case 3: 
     image(manual3, 120, 90, 765, 400);
      break;
    case 4: 
     image(manual4, 120, 90, 765, 400);
      break;
    case 5:
      image(manual5, 120, 90, 765, 400);
      break;
    case 6:
      image(manual6, 120, 90, 765, 400);
      break;
    case 7:
      image(manual7, 120, 90, 765, 400);
      break;
    case 8:
      image(manual8, 120, 90, 765, 400);
      break;
    }
}


void guardar1 () {
  image(guardar1, 0, 0, width, height);
  noStroke();
  fill(pink);
  rect(300, 350, 100, 40, 10); // boton de NO
  rect(600, 350, 100, 40, 10); // boton de SI
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
  rect(300, 380, 100, 40, 10); // boton de no
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

void guardar3 () {
  image(guardar3, 0, 0, width, height);
  
  fill(pink);
  rect(60, 20, 30, 30, 5); // boton para cerrar
  fill(dark);
  textSize(15);
  textAlign(CENTER, CENTER);
  text("X", 60, 20, 30, 30);
  
  fill(white);
  // DATOS DE ENTRADA
  rect(160, 130, 20, 20, 10); // Posición inicial
  rect(160, 185, 20, 20, 10); // velocidad inicial
  rect(160, 240, 20, 20, 10); // masa
  rect(160, 295, 20, 20, 10); // constante elastics 
  rect(160, 350, 20, 20, 10); // fuerza
  rect(160, 405, 20, 20, 10); // constante de amortigüamiento
  // DATOS DE SALIDA 
  rect(580, 130, 20, 20, 10); // posición
  rect(580, 185, 20, 20, 10); // tiempo
  rect(580, 240, 20, 20, 10); // amplitud 
  rect(580, 295, 20, 20, 10); // velocidad angular
  rect(580, 350, 20, 20, 10); // velocidad angular inicial
  
  fill(dark);
  if (row_PosicionInicial)
    rect(162.5, 132.5, 15, 15, 10); // Posición inicial
  if (row_VelocidadInicial)
    rect(162.5, 187.5, 15, 15, 10); // velocidad inicial
  if (row_Masa)
    rect(162.5, 242.5, 15, 15, 10); // masa
  if (row_ConstanteElastica)
    rect(162.5, 297.5, 15, 15, 10); // constante elastics 
  if (row_ConstantedeAmortiguamiento)
    rect(162.5, 407.5, 15, 15, 10); // constante de amortigüamiento
  if (row_Fuerza)
    rect(162.5, 352.5, 15, 15, 10); // fuerza
  if (row_VelocidadAngularInicial)
    rect(582.5, 352.5, 15, 15, 10); // velocidad angular inicial
  if (row_VelocidadAngular)
    rect(582.5, 297.5, 15, 15, 10); // velocidad angular
  if (row_Amplitud)
    rect(582.5, 242.5, 15, 15, 10); // amplitud
  if (row_Tiempo)
    rect(582.5, 187.5, 15, 15, 10); // tiempo
  if (row_Posicion)
    rect(582.5, 132.5, 15, 15, 10); // posición
}

void subir () {
  image(subir_pantalla, 0, 0, width, height);
  
  fill(pink);
  rect(60, 20, 30, 30, 5); // boton para cerrar
  fill(dark);
  textSize(15);
  textAlign(CENTER, CENTER);
  text("X", 60, 20, 30, 30);
  
  fill(blue);
  rect(470, 500, 100, 30, 5);
  fill(dark);
  text("Subir", 470, 500, 100, 30);
  
  fill(white);
  rect(160, 130, 20, 20, 10); // Posición inicial
  rect(160, 185, 20, 20, 10); // velocidad inicial
  rect(160, 240, 20, 20, 10); // masa
  rect(160, 295, 20, 20, 10); // constante elastics 
  rect(160, 350, 20, 20, 10); // fuerza
  rect(160, 405, 20, 20, 10); // constante de amortigüamiento
  rect(550, 185, 300, 30, 10); // ubicación
  
  fill(dark);
  textSize(12);
  textAlign(LEFT, CENTER);
  text(table_name, 555, 185, 300, 30);
  
  rect(162.5, 132.5, 15, 15, 10); // Posición inicial
  rect(162.5, 187.5, 15, 15, 10); // velocidad inicial
  rect(162.5, 242.5, 15, 15, 10); // masa
  rect(162.5, 297.5, 15, 15, 10); // constante elastics 
  if (row_ConstantedeAmortiguamiento)
    rect(162.5, 407.5, 15, 15, 10); // constante de amortigüamiento
  if (row_Fuerza)
    rect(162.5, 352.5, 15, 15, 10); // fuerza
  if (row_VelocidadAngularInicial);
  
  if (subiendo)
    subirdatos();
}

void pop_mensaje () {
  if (pop_time > 0 && hacer_pop) {
     pop_time -= 1.5;
     image(pop, 250, 250, 400, 161); // pop messang
     fill(dark);
     textSize(30);
     text(mensaje, 250, 250, 400, 161);
  }
}
