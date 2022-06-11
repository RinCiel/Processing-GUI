class ImGUI_Color extends ImGUI_Tab_Element{
  PShape colorPicker;
  int x = 0;
  int y = 0;
  int w;
  int h;
  int oldX;
  int oldY;
  // gradient
  PShape gradient;
  int gradX;
  int gradY;
  int gradW;
  int gradH;
  color normalColor = color(0,255,0);
  color gradientColor = color(0,255,0);
  
  color currentColor = color(0,255,0);
// colors
color[] colors = {
  color(255, 0, 0), // red
  color(255, 215, 0), // orange
  color(255, 255, 0), // yellow
  color(0, 255, 0), // green
  color(0, 0, 255), // blue
  color(127, 0, 255) // violet
};

ImGUI_Color(ImGUI gui, int _x, int _y, color _gradColor) {
  super(gui);
  x = _x;
  y = _y;
  oldX = x;
  oldY = y;
  colorSpread();
  gradient(_gradColor);
  update();
}

void colorSpread() {
  h = 20;
  int counter = x;
  noStroke();
  // width
  int sz = 5;
  colorPicker = createShape(GROUP);
  for (int i = 0; i < colors.length - 1; i++) {
    for (int j = 0; j < sz; j++) {
      PShape block = createShape(RECT, counter, y, 2, h);
      block.setFill(lerpColor(colors[i], colors[i+1], 1.0/sz * j));
      colorPicker.addChild(block);
      counter+=2;
    }
  }
  w = counter - x;
  addBorder(colorPicker, x, y, w, h);
}
void display(){
  super.display();
  x = int(oldX + (pos.x));
  y = int(oldY + int(pos.y));
  updatePress();

  shape(colorPicker);

}
void mousePressed(){
  update();
  //update();
}
void mouseDragged(){
  update();
}
void gradient(color gradColor) {
  gradX = x;
  gradY = y + h - 1;
  gradW = w;
  gradH = h;
  int counter = gradX;
  for (int i = 0; i < gradW/2; i++) {
    PShape block = createShape(RECT, counter, gradY, 2, gradH);
    if (i < gradW/4) {
      block.setFill(lerpColor(color(255), gradColor, i/(gradW/4.0)));
    }
    else {
      block.setFill(lerpColor(gradColor, color(0), (i-gradW/4.0)/(gradW/4.0)));
    }
    counter+=2;
    colorPicker.addChild(block);
  }
  addBorder(colorPicker, gradX, gradY, gradW, gradH);
}

void addBorder(PShape shape, int _x, int _y, int _w, int _h) {
  PShape wall0 = createShape(RECT, _x, _y, _w, 1);
  wall0.setFill(color(255));
  PShape wall1 = createShape(RECT, _x, _y, 1, _h);
  wall1.setFill(color(255));
  PShape wall2 = createShape(RECT, _x + _w-1, _y, 1, _h);
  wall2.setFill(color(255));
  PShape wall3 = createShape(RECT, _x, _y + _h-1, _w, 1);
  wall3.setFill(color(255));
  shape.addChild(wall0);
  shape.addChild(wall1);
  shape.addChild(wall2);
  shape.addChild(wall3);
}

void update() {
  noStroke();
  colorSpread();
  gradient(normalColor);
  pressed1();
  pressed2();
  strokeWeight(1);
  stroke(color(255));
  PShape block = createShape(RECT, x + w + 2, y, 38, 38);
  block.setFill(gradientColor);
  colorPicker.addChild(block);
  currentColor = gradientColor;
  noStroke();
}

void updatePress() {
  noStroke();
  colorSpread();
  gradient(normalColor);
  //pressed1();
  //pressed2();
  strokeWeight(1);
  stroke(color(255));
  PShape block = createShape(RECT, x + w + 2, y, 38, 38);
  block.setFill(gradientColor);
  colorPicker.addChild(block);
  currentColor = gradientColor;
  noStroke();
}
void pressed1() {
  if (mouseX > x && mouseX < x + w && mouseY > y && mouseY < y + h) {
    normalColor = get(mouseX, mouseY);
  }
}
void pressed2() {
  if (mouseX > gradX && mouseX < gradX + gradW && mouseY > y && mouseY < gradY + gradH) {
    gradientColor = get(mouseX, mouseY);
  }
}

}
