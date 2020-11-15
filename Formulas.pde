
public class solucion {
  
  public solucion () {
    w0 = sqrt(k/m);
    desfase = atan(-v0/(w0*x0));

    if (b == 0) {
      mas();
    } else if (b < 2*m*w0) {
      if (f == 0) {
        subA();
      } else { 
        subAf();
      }
    } else if (b == 2*m*w0) {
      if (f == 0) {
        criticaA();
      } else { 
        criticaAf();
      }
    } else {
      if (f == 0) {
        sobreA();
      } else {
        sobreAf();
      }
    }
  }

  private void mas () {
    movimiento = "Movimiento Armónico Simple";
    w = w0;
    A = sqrt(pow(x0, 2)+ pow(v0, 2)/pow(w0, 2));
    y = A*cos(w*t + desfase);
  }

  private void subA() {
    movimiento = "Movimiento sub-Amortiguado";
    w = sqrt(k/m - pow(b, 2)/(4*pow(m, 2)));
    A = sqrt(pow(x0, 2)+ pow(v0, 2)/pow(w0, 2));
    y = A*pow(e, -b/(2*m)*t)*cos(w*t + desfase);
  }

  private void criticaA() {
    movimiento = "Movimiento Criticamente Amortiguado";
    w = sqrt(k/m - pow(b, 2)/(4*pow(m, 2)));
    A = sqrt(pow(x0, 2)+ pow(v0, 2)/pow(w0, 2));
    y = A*pow(e, -b/(2*m)*t)*cos(w*t + desfase);
  }

  private void sobreA() {
    movimiento = "Movimiento Sobre Amortiguado";
    w = w0;
    A = sqrt(pow(x0, 2)+ pow(v0, 2)/pow(w0, 2));
  }

  private void subAf() {
    movimiento = "Movimiento sub-Amortiguado forzado";
    w = sqrt((k/m)-pow(b, 2)/pow(4*m, 2));
    A = (f/m)/sqrt(pow(pow(w, 2)-pow(w0, 2), 2)+pow(b*w/m, 2));
    //y
  }

  private void criticaAf() {
    movimiento = "Movimiento Criticamente Amortiguado forzado";
    w = sqrt((k/m)-pow(b, 2)/pow(4*m, 2));
    A = (f/m)/sqrt(pow(pow(w, 2)-pow(w0, 2), 2)+pow(b*w/m, 2));
    //y
  }

  private void sobreAf() {
    movimiento = "Movimiento Sobre Amortiguado forzado";
  }
}

FloatList wave;

void animacion () {
  fill(dark);
  textSize(12);
  text("-A", 60, 150);
  text("A", 60, 3*150);
  
  //MOVIMIENTO DE LA MASA Y EL RESORTE
  image(masa, 90, 2*150 + 150*(y/A), 80, 80);
  image(resorte, 90, 100, 80, 220 + 150*(y/A));

  rect(140, 40.5 + 2*150 + 150*(y/A), 200, 1);
  
  //GRAFICA
  if (play) 
    wave.append(40 + 2*150 + 150*(y/A));
  wave.reverse();

  noFill();
  stroke(dark);
  beginShape();
  for (int i = 0; i < wave.size(); i++) {
    //circle(340 + i, wave.get(i), 2);
    curveVertex(340 + i, wave.get(i));
    if (i == 400) {
      wave.remove(i);
    }
  }
  endShape();
  fill(pink);
  circle(340, 40.5 + 2*150 + 150*(y/A), 10);
  wave.reverse();
}

void datos () {
  if (guardar && play) {
    //row.setString("Movimiento");
    row = table.addRow();
    row.setString("Movimiento", movimiento);
    row.setDouble("Posición inicial", x0);
    row.setDouble("Velocidad inicial", v0);
    row.setDouble("Masa", m);
    row.setDouble("Constante elastica", k);
    row.setDouble("Constante de amortigüamiento", b);
    row.setDouble("Fuerza", f);
    row.setDouble("Velocidad angular inicial", w0);
    row.setDouble("Velocidad angular", w);
    row.setDouble("Amplitud", A);
    row.setDouble("Tiempo", t);
    row.setDouble("Posición", y);
  }
}
