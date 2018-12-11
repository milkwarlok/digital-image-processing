PImage butterflyGrey;
PImage butterflyColorful;
float range = 10;
float bottomColorBorder = 128 - range;
float topColorBorder = 128 + range;


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
      float rNew = map(0, 255, bottomColorBorder, topColorBorder, r);
      float gNew = map(0, 255, bottomColorBorder, topColorBorder, g);
      float bNew = map(0, 255, bottomColorBorder, topColorBorder, b);
      butterflyGrey.pixels[index] = color(rNew, gNew, bNew);
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
    range += 5*e;
    if(range < -127) range = 127;
    if(range > 127) range = -126;
    bottomColorBorder = 128 - range;
    topColorBorder = 128 + range;
}
