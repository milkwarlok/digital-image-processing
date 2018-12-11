PImage butterflyInverse;
PImage butterflyColorful;
void setup(){
  butterflyInverse = loadImage("Butterfly.jpg");
  butterflyColorful = loadImage("Butterfly.jpg");
  size(1166, 777);
   int index = 0;
  butterflyColorful.loadPixels();
  butterflyInverse.loadPixels();
  while(index < butterflyColorful.width * butterflyColorful.height){
    color c = butterflyColorful.pixels[index];
    float r = red(c);
    float g = green(c);
    float b = blue(c);
    butterflyInverse.pixels[index] = color(255 - r, 255 - g, 255 - b);
    index++;
  }
  butterflyInverse.updatePixels();
  butterflyColorful.updatePixels();

}

void draw(){
    image(butterflyColorful, 0, 0);
    image(butterflyInverse, 583, 0);
}
