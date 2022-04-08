void setup () {
  size (1200,900);
  noLoop ();
}

void draw () {
  PImage img = loadImage ("imgBrilho.jpg");
  PImage aux = createImage (img.width, img.height, RGB);

  //filtro de média com janela deslizante
  for (int y=0; y < img.height; y++) {
    for (int x=0; x <img.width; x++) {
      int pos = y*img.width + x;
      int jan = 1, qtde = 0; //jantela e quantidade
      float media = 0;

      for (int i = jan*(-1); i <= jan; i++) {
        for (int j = jan*(-1); j <= jan; j++) {
          int nx = x + j;
          int ny = y + i;

          if (ny >=0 && ny < aux.height && //para garantir que esta dentro da image
            nx >= 0 && nx < aux.width) {
            int pos_aux = ny*aux.width + nx;
            media += (blue (img.pixels[pos_aux]));
            qtde++;
          }
        }
      }
      media = media / qtde;
      aux.pixels [pos] = color (media);
    }
  }

  // filtro de Limiarização
  for (int y=0; y < img.height; y++) {
    for (int x=0; x <img.width; x++) {
      int pos = y*img.width + x;
      if (blue(aux.pixels[pos]) > 230 && y < 1200) aux.pixels [pos] = color (0);
      else aux.pixels[pos] = color (255);
    }
  }

  image (aux, 0, 0);
  save ("img.jpg");
}
