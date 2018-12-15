PImage butterflyGrey;
PImage butterflyColorful;
int[] intensities = new int[256];
int maxIntensity = 0;
int bottomMargin = 40;
void setup(){
    butterflyGrey = loadImage("Butterfly.jpg");
    butterflyColorful = loadImage("Butterfly.jpg");
    size(1095, 777);
    int index = 0;
    butterflyGrey.loadPixels();
    while(index < butterflyGrey.width * butterflyGrey.height){
      color c = butterflyGrey.pixels[index];
      float r = red(c);
      float g = green(c);
      float b = blue(c);
      int avg = (int)((r+g+b)/3);
      intensities[avg]++;
      c = color((r+g+b)/3);
      butterflyGrey.pixels[index] = c;
      index++;
    }
    butterflyGrey.updatePixels();  
    for(int i = 0; i < intensities.length; i++){
      if(maxIntensity < intensities[i]){
        maxIntensity = intensities[i];
      }
    }
    
    fill(0);
    background(255, 192, 255);
    image(butterflyGrey, 0, 0);
    text("Gray image histogram", 800, 30);

    for(int i = 0; i < intensities.length; i++){
    stroke(i);
    line(butterflyColorful.width+2 + i*2, height - bottomMargin,
    butterflyColorful.width+2 + i*2, height - bottomMargin - map(intensities[i], 0, maxIntensity, 0, height - bottomMargin));

    if(i%64 == 0)
      text(i, butterflyColorful.width+2 + i*2, height - 20);
    }
    
}

void draw(){

}
