void setup() {
  size(1200, 900);
  noLoop();
}

void draw() {
  PImage img = loadImage("imgGauss.jpg");
  PImage aux = createImage(img.width, img.height, RGB);

  // Brilho
  for (int y = 0; y < img.height; y++) {
    for (int x = 0; x < img.width; x++) {
      int pos = y * img.width + x;
      float valor = blue(img.pixels[pos])*2;
      if (valor > 255) valor = 255;
      else if (valor < 0) valor = 0;
      aux.pixels[pos] = color(valor);
    }
  }
  image(aux, 0, 0);
  save("imgBrilho.jpg");
}
