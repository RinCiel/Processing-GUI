class ImGUI_Radio extends ImGUI_Tab_Element {
  
  ArrayList<String> buttons;
  int x;
  int y;
  int xSz;
  int ySz;
  String text = "";
 int pressedOne;
 float newTempx;

  ImGUI_Radio(ImGUI gui, String[] buttons, int x, int y, int xSz) {
    super(gui);
    this.buttons = new ArrayList<String>();
    this.x = x;
    this.y = y;
    this.xSz = xSz;
    this.ySz = 17;
    for (int i = 0; i < buttons.length; i++) {
      this.buttons.add(buttons[i]);
    }
    super.display();
  }
  
  ImGUI_Radio(ImGUI gui, String[] buttons, int x, int y) {
    this(gui, buttons, x, y, 80);
  }
  
  void display() {
    super.display();
    for (int i = 0; i < buttons.size();i++){
      if (i == 0) newTempx = x + pos.x;
      else{
        newTempx = x + pos.x + (xSz - (i-1) * (xSz / float(buttons.size())));
      }
      fill(8,228,255);
      square(newTempx,y + pos.y,ySz);
      fill(255);
      text(buttons.get(i),newTempx + ySz, y + pos.y+17/2);
      
    }
    
    //stroke(current_stroke);
    //fill(c_fill);
    //rect(pos.x + x, pos.y + y, xSz, ySz);
    //fill(255);
    //noStroke();
    //text(text, pos.x + x + 3, pos.y + y + ySz/2);
    //if (pressed) {
    //  triangle(pos.x + xSz - 13, pos.y + ySz * 3 + ySz/5, pos.x + xSz - 8, pos.y + ySz * 3 - ySz/2.5, pos.x + xSz - 3, pos.y + ySz * 3 + ySz/5);
    //}
    //else {
    //  triangle(pos.x + xSz - 13, pos.y + ySz * 3 - ySz/2.5, pos.x + xSz - 8, pos.y + ySz * 3 + ySz/5, pos.x + xSz - 3, pos.y + ySz * 3 - ySz/2.5);
    //}
    
    //if (pressed) {
    //  // load in options
    //  float optionsX = pos.x + x;
    //  float optionsY = pos.y + y + ySz + 1;
    //  stroke(80, 80, 80, 50);
    //  for (int i = 0; i < options.size() && i < 7; i++) {
    //    // if mouse is over it, highlight it
    //    if (mouseX > optionsX && mouseX < optionsX + xSz && mouseY > optionsY && mouseY < optionsY + ySz) {
    //      fill(c_fill);
    //    }
    //    else {
    //      fill(c_fill_options);
    //    }
    //    rect(optionsX, optionsY, xSz, ySz);
    //    fill(255);
    //    text(options.get(i), optionsX + 3, optionsY + ySz/2);
    //    optionsY += ySz;
    //  }
      
    //}
  }
  
  boolean pressed = false;
  void mousePressed() {
    
    for (int i = 0; i < buttons.size();i++){
      if (i == 0) newTempx = x + pos.x;
      else{
        newTempx = x + pos.x + (buttons.get(i).length() * 16);
      }
      
      if (mouseX > newTempx && mouseX < newTempx + ySz && mouseY > y + pos.y && mouseY < y + pos.y + ySz){
        pressedOne = i;
      }
      
    }
  
  }
}
