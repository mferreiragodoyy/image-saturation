import java.util.ArrayList;
import java.util.Collections;

void setup() {
  size(1200,900);
  noLoop();
}

void draw() {
  PImage img = loadImage("img5.jpg");
  PImage aux = createImage(img.width, img.height, RGB);


  // Filtro de Mediana
  for (int y = 0; y < img.height; y++) {
    for (int x = 0; x < img.width; x++) {
      int jan = 2;
      int pos = y*img.width + x;
      ArrayList<Integer> valores = new ArrayList<>();

      // Percorrer a janela
      for (int i = jan*(-1); i <= jan; i++) {
        for (int j = jan*(-1); j <= jan; j++) {
          int ny = y+i;
          int nx = x+j;
          if (ny >= 0 && ny < img.height &&
            nx >= 0 && nx < img.width) {
            int pos_aux = ny * img.width + nx;
            valores.add((int)(blue(img.pixels[pos_aux])));
          }
        }
      }
      // Calculo da Mediana
      Collections.sort (valores);
      aux.pixels[pos] = color (valores.get(valores.size()/2));

    }
  }
  image(aux, 0, 0);
  save("imgMediana.jpg");
}
