PImage butterflyGrey;
PImage butterflyColorful;
boolean switcher = true;

void setup(){
  butterflyGrey = loadImage("Butterfly.jpg");
  butterflyColorful = loadImage("Butterfly.jpg");
  size(720, 540);
  int index = 0;
  butterflyGrey.loadPixels();
  while(index < 720*540){
    color c = butterflyGrey.pixels[index];
    float r = red(c);
    float g = green(c);
    float b = blue(c);
    c = color((r+g+b)/3);
    butterflyGrey.pixels[index] = c;
    index++;
  }
  butterflyGrey.updatePixels();
}
void draw(){
  if(switcher){
    image(butterflyColorful, 0, 0);
  }
  else{
    image(butterflyGrey, 0, 0);
  }
  switcher = !switcher;
}
