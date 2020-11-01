
public class solucion {
  float vAngular;
  float amplitud;

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
    movimiento = "Movimiento Armonico Simple";
    w = w0;
    A = sqrt(pow(x0, 2)+ pow(v0, 2)/pow(w0, 2));
    y = A*cos(w*t + desfase);
  }

  private void subA() {
    movimiento = "Movimiento sub-Amortiguado";
    w = sqrt(k/m - pow(b, 2)/(2*pow(m, 2)));
    A = sqrt(pow(x0, 2)+ pow(v0, 2)/pow(w0, 2));
    y = A*pow(e, -b/(2*m))*cos(w*t + desfase);
  }

  private void criticaA() {
    movimiento = "Movimiento Criticamente Amortiguado";
    w = sqrt(k/m - pow(b, 2)/(2*pow(m, 2)));
    A = sqrt(pow(x0, 2)+ pow(v0, 2)/pow(w0, 2));
    y = A*pow(e, -b/(2*m))*cos(w*t + desfase);
  }

  private void sobreA() {
    movimiento = "Movimiento Sobre Amortiguado";
    w = w0;
    A = sqrt(pow(x0, 2)+ pow(v0, 2)/pow(w0, 2));
  }

  private void subAf() {
    movimiento = "Movimiento sub-Amortiguado forzado";
    w = sqrt((k/m)-pow(b,2)/pow(4*m,2));
    A = (f/m)/sqrt(pow(pow(w,2)-pow(w0,2),2)+pow(b*w/m,2));
    //y
  }

  private void criticaAf() {
    movimiento = "Movimiento Criticamente Amortiguado forzado";
    w = sqrt((k/m)-pow(b,2)/pow(4*m,2));
    A = (f/m)/sqrt(pow(pow(w,2)-pow(w0,2),2)+pow(b*w/m,2));
    //y
  }

  private void sobreAf() {
    movimiento = "Movimiento Sobre Amortiguado forzado";
  }
  
}

void animacion (){

}

void grafica() {

}
