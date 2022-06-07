class ImGUI_Radio extends ImGUI_Tab_Element {
  
  ArrayList<String> buttons;
  int x;
  int y;
  int xSz;
  int ySz;
  String text = "";
 int pressedOne;
 float newTempx;
 float temp;
  ImGUI_Radio(ImGUI gui, String[] buttons, int pressedOne, int x, int y, int xSz) {
    super(gui);
    this.buttons = new ArrayList<String>();
    this.x = x;
    this.y = y;
    this.xSz = xSz;
    this.ySz = 17;
    this.pressedOne = pressedOne;
    for (int i = 0; i < buttons.length; i++) {
      this.buttons.add(buttons[i]);
    }
    super.display();
  }
  
  ImGUI_Radio(ImGUI gui, String[] buttons, int x, int y) {
    this(gui, buttons, 0, x, y, 80);
  }
  
  void display() {
    float xOffset = xSz / float(buttons.size());
    super.display();
    for (int i = 0; i < buttons.size();i++){
      temp = (i * xOffset);
      println(i, xOffset,temp);
      if (i == 0) newTempx = x + pos.x;
      else{
        newTempx = x + pos.x + (i * xOffset);
      }
      stroke(8,228,255);
      strokeWeight(3);
      if (pressedOne == i){
        fill(8,228,255);
        square(newTempx + int(ySz/4)+0.99899,y+pos.y + int(ySz/4),int(ySz/2));
      }
      noFill();
      square(newTempx,y + pos.y,ySz);
      fill(255);
      text(buttons.get(i),newTempx + ySz+5, y + pos.y+17/2);
      strokeWeight(1);
    }
  }
  
  boolean pressed = false;
  void mousePressed() {
    float xOffset = xSz / float(buttons.size());
    for (int i = 0; i < buttons.size();i++){
      if (i == 0) newTempx = x + pos.x;
      else{
        newTempx = x + pos.x + (i * xOffset);
      }
      
      if (mouseX > newTempx && mouseX < newTempx + ySz && mouseY > y + pos.y && mouseY < y + pos.y + ySz){
        pressedOne = i;
      }
      
    }
  
  }
}
