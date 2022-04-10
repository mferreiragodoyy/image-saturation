void setup() {
  size(1200, 900);
  noLoop();
}

void draw() {
  PImage img1 = loadImage("img1.jpg");
  PImage img2 = loadImage("img2.jpg");

  int acerto = 0;
  int falso_p = 0;
  int falso_n = 0;

  for (int y = 0; y < img1.height; y++) {
    for (int x = 0; x < img1.width; x++) {
      int pos = y*img1.width + x;

      if (blue(img1.pixels[pos]) == 0 && blue(img2.pixels[pos]) == 0) {
        acerto = acerto +1;
      }
      if (blue(img1.pixels[pos]) == 255 && blue(img2.pixels[pos]) == 255) {
        acerto = acerto +1;
      }

      if (blue(img1.pixels[pos]) == 255 && blue(img2.pixels[pos]) == 0){
          falso_p = falso_p + 1;
      }
      
      if (blue(img1.pixels[pos]) == 0 && blue(img2.pixels[pos]) == 255){
          falso_n = falso_n + 1;
      }      
    }
  }
println(acerto);
println(falso_p);
println(falso_n);

}
