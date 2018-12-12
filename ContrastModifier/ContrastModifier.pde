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
      float rNew = map(r, 0, 255, bottomColorBorder, topColorBorder);
      float gNew = map(g, 0, 255, bottomColorBorder, topColorBorder);
      float bNew = map(b, 0, 255, bottomColorBorder, topColorBorder);
      butterflyGrey.pixels[index] = color(rNew, gNew, bNew);
      index++;
    }
    butterflyGrey.updatePixels();
    butterflyColorful.updatePixels();
    index = 0;
    image(butterflyColorful, 0, 0);
    image(butterflyGrey, 583, 0);
    text("Color is mapped to " + bottomColorBorder + " - " + topColorBorder, 593, 10);
}

void mouseWheel(MouseEvent event) {
    float e = event.getCount();
    range += e;
    if(range < -127) range = 127;
    if(range > 127) range = -127;
    bottomColorBorder = 128 - range;
    topColorBorder = 128 + range;
}
