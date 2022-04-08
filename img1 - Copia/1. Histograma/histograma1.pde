void setup () {
 size (640, 470);
 background (255);
 noLoop ();
 }
 
 void draw (){
 PImage img = loadImage ("img1.JPG");
 int [] histR = new int [256];
 int [] histG = new int [256];
 int [] histB = new int [256];
 
 for (int i=0; i < 256; i++){
   histR[i] = histG[i] = histB [i] = 0; 
}
 
 for (int y=0; y< img.height; y++){
   for (int x=0; x< img.height; x++) {
     int pos = y*img.width + x;
     
     int valueRed = int (red (img.pixels[pos]));
     histR [valueRed] ++;
     
     int valueGreen = int (green (img.pixels[pos]));
     histG [valueGreen] ++;
     
     int valueBlue = int (blue (img.pixels[pos]));
     histB [valueBlue] ++;
}}
 
 int histMaxR = max (histR); //vai retornar o maior valor do canal vermelho
 int histMaxG = max (histG);
 int histMaxB = max (histB);
 
 int [] histMaxRGB = {histMaxR, histMaxG, histMaxB};
 int histMax = max (histMaxRGB);
 
 for (int i=0; i < 256; i++){
   int y = int (map (histR[i], 0, histMax, 0, 600));
   stroke (255,0,0);
   line (i, 600, i, 600-y);  //senmpre saem de baixo, de 600.
   
   y = int (map (histG[i], 0, histMax, 0, 600));
   stroke (0,255,0);
   line (i+260, 600, i+260, 600-y);
   
   y = int (map (histB[i], 0, histMax, 0, 600));
   stroke (0,0,255);
   line (i+520, 600, i+520, 600-y);
   
 }
 }
 
 
