PImage butterflyGrey;
PImage butterflyColorful;
float border = 128f;
void setup(){
  butterflyGrey = loadImage("Butterfly.jpg");
  butterflyColorful = loadImage("Butterfly.jpg");
  size(1166, 777);

}

void draw(){
    int index = 0;
  butterflyColorful.loadPixels();
  butterflyGrey.loadPixels();
  while(index < butterflyColorful.width * butterflyColorful.height){
    color c = butterflyColorful.pixels[index];
    float r = red(c);
    float g = green(c);
    float b = blue(c);
    float avg = (r+g+b)/3;
    if(avg < border){
    c = color(0);
    }
    else{
    c = color(255);
    }
    butterflyGrey.pixels[index] = c;
    index++;
  }
  butterflyGrey.updatePixels();
  butterflyColorful.updatePixels();
  index = 0;
  
    image(butterflyColorful, 0, 0);
    image(butterflyGrey, 583, 0);
}

void mouseWheel(MouseEvent event) {
  float e = event.getCount();
  border += e;
  if(border < 0) border = 255;
  if(border > 255) border = 0;
}
