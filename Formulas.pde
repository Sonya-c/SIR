
public class solucion {
  float x0, v0, m, k, b, f; //DATOS DE ENTRADA
  float w0, w, A0, A, t, y, desfase; //DATOS DE SALIDA

  public solucion() {
    x0 = 0;
    v0 = 0;
    m = 0;
    b = 0;
    f = 0;
  }
  
  public float w0_inicial(float kresorte, float masa) {
    w0 = sqrt(kresorte/masa);
    return w0;
  }
  
  public float a_desfase(float vinicial, float winicial, float xinicial) {
    desfase = atan(-vinicial/(winicial * xinicial));
    return desfase;
  }
  
  
}  
