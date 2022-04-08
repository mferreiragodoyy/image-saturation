float gauss (int x, int y, float param) {
  float valor;
  valor = (1 / (2 * PI * pow(param, 2))) * (exp(-(pow(x, 2)+(pow(y, 2))) / (2*pow(param, 2))));
  return valor;
}



void setup() {
  size(1200,900);
  noLoop();
}

void draw() {
  PImage img = loadImage("img4.jpg"); /* carrega a imagem */
  PImage aux = createImage(img.width, img.height, RGB); /* cria uma imagem em vazia do mesmo tamanho da img */
  PImage aux2 = createImage(img.width, img.height, RGB);

  // Filtro escala de cinza
  /* percorre a imagem */
  for (int y = 0; y < img.height; y++) {
    for (int x = 0; x < img.width; x++) {

      int pos = (y)*img.width + (x); /* acessa o ponto em forma de vetor */
      float media = blue(img.pixels[pos]);
      aux.pixels[pos] = color(media, media, media);
    }
  }
  image(aux, 0, 0);
 // save("PretoBranco.jpg");

  float paramGauss = 2;

  float[][] gx = {{gauss(-1, -1, paramGauss), gauss(0, -1, paramGauss), gauss(1, -1, paramGauss)},
    {gauss(-1, 0, paramGauss), gauss(0, 0, paramGauss), gauss(1, 0, paramGauss)},
    {gauss(-1, 1, paramGauss), gauss(0, 1, paramGauss), gauss(1, 1, paramGauss)}};

  float[][] gy = {{gauss(-1, -1, paramGauss), gauss(0, -1, paramGauss), gauss(1, -1, paramGauss)},
    {gauss(-1, 0, paramGauss), gauss(0, 0, paramGauss), gauss(1, 0, paramGauss)},
    {gauss(-1, 1, paramGauss), gauss(0, 1, paramGauss), gauss(1, 1, paramGauss)}};

  // Filtro Gaussiano
  for (int y = 0; y < img.height; y++) {
    for (int x = 0; x < img.width; x++) {
      int jan = 1;
      int pos = (y)*img.width + (x); /* acessa o ponto em forma de vetor */

      float mediaOx = 0, mediaOy = 0;
      int qtde = 0;

      // janela tamanho 1
      for (int i = jan*(-1); i <= jan; i++) {
        for (int j = jan*(-1); j <= jan; j++) {
          int disy = y+i;
          int disx = x+j;
          if (disy >= 0 && disy < img.height &&
            disx >= 0 && disx < img.width) {
            int pos_aux = disy * img.width + disx;
            float Ox = blue(aux.pixels[pos_aux]) * gx[i+1][j+1];
            float Oy = blue(aux.pixels[pos_aux]) * gy[i+1][j+1];
            mediaOx += Ox;
            mediaOy += Oy;
          }
        }
      }

      // Raiz da soma ao quadrado
      float mediaFinal = sqrt(mediaOx*mediaOx + mediaOy*mediaOy);


      aux2.pixels[pos] = color(mediaFinal);
    }
  }

  image(aux2, 0, 0);
  save("imgGauss.jpg");
}
