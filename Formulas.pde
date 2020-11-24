
public class solucion {
  float c1, c2;
  float l1, l2;

  public solucion () {
    w0 = sqrt(k/m);
    desfase = atan(-v0/(w0*x0));

    if (b == 0) {
      mas();
    } else if (b < 2*m*w0) {
      subA();
    } else if (b == 2*m*w0) {
      criticaA();
    } else {
      sobreA();
    }
  }

  public void mas () {
    movimiento = "Movimiento Armónico Simple";
    w = w0;
    A = sqrt(pow(x0, 2)+ pow(v0, 2)/pow(w0, 2));
    y = A*cos(w*t + desfase);
  }

  public void subA() {
    if (f == 0) {
      movimiento = "Movimiento sub-Amortiguado";
      w = sqrt(k/m - pow(b, 2)/(4*pow(m, 2)));
      A = sqrt(pow(x0, 2)+ pow(v0, 2)/pow(w0, 2));
    } else {
      movimiento = "Movimiento sub-Amortiguado forzado";
      w = sqrt((k/m)-pow(b, 2)/pow(4*m, 2));
      A = (f/m)/sqrt(pow(pow(w, 2)-pow(w0, 2), 2)+pow(b*w/m, 2));
    }
    y = A*pow(e, -b/(2*m)*t)*cos(w*t + desfase);
  }

  public void criticaA() {
    if (f == 0) {
      movimiento = "Movimiento Criticamente Amortiguado";
      w = sqrt(k/m - pow(b, 2)/(4*pow(m, 2)));
      A = sqrt(pow(x0, 2)+ pow(v0, 2)/pow(w0, 2));
    } else {
      movimiento = "Movimiento Criticamente Amortiguado forzado";
      w = sqrt((k/m)-pow(b, 2)/pow(4*m, 2));
      A = (f/m)/sqrt(pow(pow(w, 2)-pow(w0, 2), 2)+pow(b*w/m, 2));
    }
    y = A*pow(e, -b/(2*m)*t)*cos(w*t + desfase);
  }

  private void sobreA() {
    if (f == 0) {
      movimiento = "Movimiento Sobre Amortiguado";
      w = w0;
      A = sqrt(pow(x0, 2)+ pow(v0, 2)/pow(w0, 2));
    } else {
      movimiento = "Movimiento Criticamente Amortiguado forzado";
      w = sqrt((k/m));
      A = (f/m)/sqrt(pow(pow(w, 2)-pow(w0, 2), 2)+pow(b*w/m, 2));
    }

    l1 = ( -b / (2*m)) + sqrt(pow(b/(2*m), 2) - (k/m));
    l2 = ( -b / (2*m)) - sqrt(pow(b/(2*m), 2) - (k/m));
    matriz_2x2 sistema = new matriz_2x2(1, 1, x0, l1, l2, v0);
    println("ORIGINAL");
    sistema.escribir(sistema.cof, 2, 2); // Imprimir la matriz de coeficientes
    sistema.escribir(sistema.inversa(), 2, 2); // ejecutar la inversaa de la matriz de coeficientes
    sistema.producto(); // ejecutar el producto de la matriz con su inversa

    c1 = sistema.consultar()[0];
    c2 = sistema.consultar()[1];
    y = c1*pow(e, l1 * t) + c2*pow(e, l2 * t);
  }
}

public class matriz_2x2 {
  float cof[][] = new float[2][2]; // matriz de coeficientes
  float ind[][] = new float[2][1]; // matriz de terminos independes
  float inversa[][] = new float[2][2]; // matriz inverza
  float solucion[] = new float[2]; // c1 y c2

  public matriz_2x2 (float f1c1, float f1c2, float f1c3, float f2c1, float f2c2, float f2c3) {
    cof[0][0] = f1c1; 
    cof[1][0] = f2c1; 
    cof[0][1] = f1c2; 
    cof[1][1] = f2c2;

    ind[0][0] = f1c3; 
    ind[1][0] = f2c3;
  }

  public void escribir(float[][] A, int filas, int columnas) {
    for (int f = 0; f < filas; f ++) {
      for (int c = 0; c < columnas; c ++) {
        print(A[f][c] + "\t");
      }
      println();
    }
  }

  public float[][] inversa() {
    float det = cof[0][0] * cof[1][1] - cof[1][0]*cof[0][1];

    println("Determinante: "+det);
    float[][] adj = new float[2][2];
    adj[0][0] =  cof[1][1]; 
    adj[0][1] = -cof[1][0];
    adj[1][0] = -cof[0][1]; 
    adj[1][1] =  cof[0][0];
    println("Adjunta");
    escribir(adj, 2, 2);
    println("inversa");

    for (int f = 0; f < 2; f ++) {
      for (int c = 0; c < 2; c ++) {
        inversa[f][c] = adj[f][c] / det;
      }
    }
    return inversa;
  }

  public void producto () {
    for (int f = 0; f < 2; f++) {
      for (int c = 0; c < 1; c++) {
        float suma = 0;
        for (int k = 0; k < 2; k++) {
          suma = suma + inversa[f][k] * ind[k][c];
          print(suma+" ");
          //println(A[f][k] +"\t"+ B[f][0]);
        }
        println("");
        solucion[f] = suma;
      }
    }
  }

  public float[] consultar () {
    return solucion;
  }
}


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
    row = entradas.addRow();

    if (row_PosicionInicial)
      row.setFloat("Posicion inicial", x0);
    if (row_VelocidadInicial)
      row.setFloat("Velocidad inicial", v0);
    if (row_Masa)
      row.setFloat("Masa", m);
    if (row_ConstanteElastica)
      row.setFloat("Constante elastica", k);
    if (row_ConstantedeAmortiguamiento)
      row.setFloat("Constante de amortiguamiento", b);
    if (row_Fuerza)
      row.setFloat("Fuerza", f);

    row = salidas.addRow();
    if (row_VelocidadAngularInicial)
      row.setFloat("Velocidad angular inicial", w0);
    if (row_VelocidadAngular)
      row.setFloat("Velocidad angular", w);
    if (row_Amplitud)
      row.setFloat("Amplitud", A);
    if (row_Tiempo)
      row.setFloat("Tiempo", t);
    if (row_Posicion)
      row.setFloat("Posicion", y);
  }
}

void subirdatos () {

  println("hi hi");
  try {
    entradas = loadTable(table_name, "header");
    println("ok");
    for (TableRow r : entradas.rows()) {
      if (row_PosicionInicial)
        x0 = r.getFloat("Posicion inicial");
      if (row_VelocidadInicial)
        v0 = r.getFloat("Velocidad inicial");
      if (row_Masa)
        m = r.getFloat("Masa");
      if (row_ConstanteElastica)
        k = r.getFloat("Constante elastica");
      if (row_ConstantedeAmortiguamiento)
        b = r.getFloat("Constante de amortiguamiento");
      if (row_Fuerza)
        f = r.getFloat("Fuerza");
    }
  } 
  catch (Exception  e) {
    mensaje = "Error al cargar los datos, confirme la ruta del archivo por favor. "+e;
    println(e);
    hacer_pop = true; 
    pop_time = 225;
  }
  subiendo = false;
  ScreenId = 0;
}
