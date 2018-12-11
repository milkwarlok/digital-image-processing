PImage butterflyInverse;
PImage butterflyColorful;
boolean redOn = true, greenOn = false, blueOn = false;
void setup(){
  butterflyInverse = loadImage("Butterfly.jpg");
  butterflyColorful = loadImage("Butterfly.jpg");
  size(1166, 777);
}

void draw(){
  int index = 0;
  butterflyColorful.loadPixels();
  butterflyInverse.loadPixels();
  while(index < butterflyColorful.width * butterflyColorful.height){
    color c = butterflyColorful.pixels[index];
    float r = red(c);
    float g = green(c);
    float b = blue(c);
    if(redOn)
      butterflyInverse.pixels[index] = color(255 - r, 0, 0);
    else if(greenOn)
      butterflyInverse.pixels[index] = color(0, 255 - g, 0);
    else if(blueOn)
      butterflyInverse.pixels[index] = color(0, 0, 255 - b);
    index++;
  }
  butterflyInverse.updatePixels();
  butterflyColorful.updatePixels();
  index = 0;
    image(butterflyColorful, 0, 0);
    image(butterflyInverse, 583, 0);
}

void mouseClicked(){
if(redOn){ 
  redOn = !redOn;
  greenOn = !greenOn;
}
else if(greenOn){ 
  greenOn = !greenOn;
  blueOn = !blueOn;
}
else if(blueOn){ 
  blueOn = !blueOn;
  redOn = !redOn;
}
}
