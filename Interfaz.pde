
void inicio() {
  noStroke();
  boolean can = m != 0 && k != 0;
  //la variable can determina si ya se puede saltar a la siguiente pestaña, es decir, si ya se han dijitado los datos necesarios

  image(scream0, 0, 0, 1000, 580); 
  image(help_buttom, 140, 25, 40, 40);
  if (music)
    image(musicOn, 180, 25, 40, 40);
  else
    image(musicOff, 180, 25, 40, 40);

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
  text("Constante Elastica", 685, 190);
  text("Posición Inicial", 685, 260);
  text("Velocidad Inicial", 685, 330);
  text("Constante de Amortiguamiento", 685, 400);
  text("Fuerza", 685, 470);

  //CUADRO DE VALORES//
  fill(white); //primero se dibuja un cuadro blanco
  rect(627.6, 125, 127.6, 40);
  rect(627.6, 195, 127.6, 40);
  rect(627.6, 265, 127.6, 40);
  rect(627.6, 335, 127.6, 40);
  rect(627.6, 405, 127.6, 40);
  rect(627.6, 475, 127.6, 40);
  fill(dark); //Ahora se escriben los valores
  textAlign(CENTER, CENTER);
  text(""+m, 627.6, 125, 127.6, 40);
  text(""+k, 627.6, 195, 127.6, 40);
  text(""+x0, 627.6, 265, 127.6, 40);
  text(""+w0, 627.6, 335, 127.6, 40);
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

  //ZONAS ACTIVAS (ESPECIAL CUIDADO)//
  //Esta zona corresponde al boton de ayuda
  if (mouseX > 140 && mouseY > 25 && mouseX < 140 + 40 && mouseY < 25 + 40) {
    cursor(HAND);
    if (mousePressed) {
      beforeScreen = ScreenId; //Con esta variable, cuandro se regrese de la pagina de ayuda volvera aquí
      ScreenId = 2;
    }
    //Esta zona corresponde al boton de volver, solo estara activo si la variable can es verdadera
  } else if (mouseX > 627.6 && mouseY > 530 && mouseX < 627.6 + 127.6 && mouseY < 530 + 40 && can) {
    cursor(HAND);
    if (mousePressed) {
      ScreenId = 1;
    }
    //Boton de musica
  } else if (mouseX > 180 && mouseY > 25 && mouseX < 180 + 40 && mouseY < 25 + 40) {
    cursor(HAND);
    if (mousePressed) {
      music = !music;
    }
    //El resto son los controladores correspondeientes a los botones de las variables
  } else if (mouseX > 587.6 && mouseY > 125 && mouseX < 627.6 && mouseY < 125 + 40) {
    cursor(HAND);
    if (mousePressed) {
      if (m - spin > 0) {
        m -= spin;
      }
    }
  } else if (mouseX > 587.6 && mouseY > 195 && mouseX < 587.6 + 40 && mouseY < 195 + 40) {
    cursor(HAND);
    if (mousePressed) {
      if (k - spin > 0) {
        k -= spin;
      }
    }
  } else if (mouseX > 587.6 && mouseY > 265 && mouseX < 587.6 + 40 && mouseY < 265 + 40) {
    cursor(HAND);
    if (mousePressed) {
      x0 -= spin;
    }
  } else if (mouseX > 587.6 && mouseY > 335 && mouseX < 587.6 + 40 && mouseY < 335 + 40) {
    cursor(HAND);
    if (mousePressed) {
      w0 -= spin;
    }
  } else if (mouseX > 587.6 && mouseY > 405 && mouseX < 587.6 + 40 && mouseY < 405 + 40) {
    cursor(HAND);
    if (mousePressed) {
      b -= spin;
    }
  } else if (mouseX > 587.6 && mouseY > 475 && mouseX < 587.6 + 40 && mouseY < 475 + 40) {
    cursor(HAND);
    if (mousePressed) {
      f -= spin;
    }
  } else if (mouseX > 753.2 && mouseY > 125 && mouseX < 753.2 + 40 && mouseY < 125 + 40) {
    cursor(HAND);
    if (mousePressed) {
      m += spin;
    }
  } else if (mouseX > 753.2 && mouseY > 195 && mouseX < 753.2 + 40 && mouseY < 195 + 40) {
    cursor(HAND);
    if (mousePressed) {
      k += spin;
    }
  } else if (mouseX > 753.2 && mouseY > 265 && mouseX < 753.2 + 40 && mouseY < 265 + 40) {
    cursor(HAND);
    if (mousePressed) {
      x0 += spin;
    }
  } else if (mouseX > 753.2 && mouseY > 335 && mouseX < 753.2 + 40 && mouseY < 335 + 40) {
    cursor(HAND);
    if (mousePressed) {
      w0 += spin;
    }
  } else if (mouseX > 753.2 && mouseY > 405 && mouseX < 753.2 + 40 && mouseY < 405 + 40) {
    cursor(HAND);
    if (mousePressed) {
      b += spin;
    }
  } else if (mouseX > 753.2 && mouseY > 475 && mouseX < 753.2 + 40 && mouseY < 475 + 40) {
    cursor(HAND);
    if (mousePressed) {
      f += spin;
    }
  } else {
    cursor(ARROW);
  }
}

void howToUse() {
  image(help, 0, 0, 1000, 580);
  image(izq, 380, 20, 40, 40);

  //BOTONES
  fill(pink);
  rect(600, 30, 75, 25, 7); //Este corresponde al boton de ir al sitio web
  fill(white);
  textAlign(CENTER, CENTER);
  text("Sitio web", 600, 25, 75, 25);

  //ZONAS ACTIVAS//
  //esta zona corresponde al boton de volver
  if (mouseX > 380 && mouseY > 20 && mouseX < 380 + 40 && mouseY < 20 + 40) {
    cursor(HAND);
    if (mousePressed) {
      ScreenId = beforeScreen; //de esta forma podemos volver a la pantalla original
    }
    //Esta zona corresponde al link al sitio web
  } else if (mouseX > 600 && mouseY > 30 && mouseX < 600 + 75 && mouseY < 30 + 25) {
    cursor(HAND);
    if (mousePressed) {
      link("https://sites.google.com/view/el-proyectoc-cmw/home"); //link al sitio web
    }
  } else {
    cursor(ARROW);
  }
}

void processing() {
  noStroke();
  image(scream1, 0, 0, 1000, 580);
  image(izq, 20, 5, 40, 40);
  image(help_buttom, 65, 5, 40, 40);
  if (music)
    image(musicOn, 105, 5, 40, 40);
  else
    image(musicOff, 105, 5, 40, 40);

  image(masa, 85, 170, 80, 80);
  image(resorte, 100, 90, 40, 100);
  
  fill(dark);
  textSize(12);
  textAlign(CENTER, CENTER);
  text(""+m, 850, 90, 115, 30);
  text(""+k, 850, 90 + 50, 115, 30);
  text(""+x0, 850, 90 + 2*50, 115, 30);
  text(""+v0, 850, 90 + 3*50, 115, 30);
  text(""+b, 850, 90 + 4*50, 115, 30);
  text(""+f, 850, 90 + 5*50, 115, 30);
  text(""+w, 850, 90 + 6*50, 115, 30);
  text(""+A, 850, 90 + 7*50, 115, 30);
  text(""+desfase, 850, 90 + 8*50, 115, 30);

  fill(white);
  textSize(20);
  textAlign(CENTER, CENTER);
  text(movimiento, 500, 20);

  //--->ZONAS ACTIVAS<---//
  if (mouseX > 20 && mouseY > 5 && mouseX < 20 + 40 && mouseY < 5 + 40) {
    //VOLVER
    cursor(HAND);
    if (mousePressed) {
      ScreenId = 0;
    }
  } else if (mouseX > 65 && mouseY > 5 && mouseX < 65 + 40 && mouseY < 5 + 40) {
    //AYUDA
    cursor(HAND);
    if (mousePressed) {
      beforeScreen = ScreenId;
      ScreenId = 2;
    }
  } else if (mouseX > 105 && mouseY > 5 && mouseX < 105 + 40 && mouseY < 5 + 40) {
    //SONIDO
    cursor(HAND);
    if (mousePressed) {
      music = !music;
    }
  } else {
    cursor(ARROW);
  }
}
