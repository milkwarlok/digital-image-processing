PImage butterflyGrey;
PImage butterflyColorful;

void setup(){
  butterflyGrey = loadImage("Butterfly.jpg");
  butterflyColorful = loadImage("Butterfly.jpg");
  size(1166, 777);
  int index = 0;
  butterflyGrey.loadPixels();
  while(index < butterflyGrey.width * butterflyGrey.height){
    color c = butterflyGrey.pixels[index];
    float r = red(c);
    float g = green(c);
    float b = blue(c);
    int avg = (int)((r+g+b)/3);
    c = color((r+g+b)/3);
    butterflyGrey.pixels[index] = c;
    index++;
  }
  butterflyGrey.updatePixels();
}

void draw(){
    image(butterflyColorful, 0, 0);
    image(butterflyGrey, 583, 0);
}
