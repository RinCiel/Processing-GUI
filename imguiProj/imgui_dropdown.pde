class ImGUI_Dropdown extends ImGUI_Tab_Element {
  
  ArrayList<String> options;
  int x;
  int y;
  int xSz;
  int ySz;
  
  int c_border;
  int c_fill;
  int c_fill_options;
  int c_border_clicked;
  
  int current_stroke;
  
  String text = "";
    
  ImGUI_Dropdown(ImGUI gui, String[] options, int x, int y, int xSz) {
    super(gui);
    this.options = new ArrayList<String>();
    this.x = x;
    this.y = y;
    this.xSz = xSz;
    this.ySz = 17;
    for (int i = 0; i < options.length; i++) {
      this.options.add(options[i]);
    }
    
    c_border = gui.C_STROKE;
    current_stroke = c_border;
    c_border_clicked = gui.C_STROKE_2;
        
    c_fill = gui.C_BUTTON;
    c_fill_options = color(29, 47, 70);
  }
  
  ImGUI_Dropdown(ImGUI gui, String[] options, int x, int y) {
    this(gui, options, x, y, 80);
  }
  
  void display() {
    super.display();
    stroke(current_stroke);
    fill(c_fill);
    rect(pos.x + x, pos.y + y, xSz, ySz);
    fill(255);
    noStroke();
    text(text, pos.x + x + 3, pos.y + y + ySz/2);
    if (pressed) {
      triangle(pos.x + xSz - 13, pos.y + ySz + ySz - 1, pos.x + xSz - 8, pos.y + ySz + ySz/2, pos.x + xSz - 3, pos.y + ySz + ySz - 1);
    }
    else {
      triangle(pos.x + xSz - 13, pos.y + ySz + ySz/2, pos.x + xSz - 8, pos.y + ySz + ySz - 1, pos.x + xSz - 3, pos.y + ySz + ySz/2);
    }
    
    if (pressed) {
      // load in options
      float optionsX = pos.x + x;
      float optionsY = pos.y + y + ySz + 1;
      stroke(80, 80, 80, 50);
      for (int i = 0; i < options.size() && i < 7; i++) {
        // if mouse is over it, highlight it
        if (mouseX > optionsX && mouseX < optionsX + xSz && mouseY > optionsY && mouseY < optionsY + ySz) {
          fill(c_fill);
        }
        else {
          fill(c_fill_options);
        }
        rect(optionsX, optionsY, xSz, ySz);
        fill(255);
        text(options.get(i), optionsX + 3, optionsY + ySz/2);
        optionsY += ySz;
      }
    }
  }
  
  boolean pressed = false;
  void mousePressed() {
    if (pressed) {
      // check if any options were pressed
      float optionsX = pos.x + x;
      float optionsY = pos.y + y + ySz + 1;
      for (int i = 0; i < options.size(); i++) {
        if (mouseX > optionsX && mouseX < optionsX + xSz && mouseY > optionsY + ySz * i && mouseY < optionsY + ySz * (i + 1)) {
          text = options.get(i);
        }
      }
    }
    if (mouseX > pos.x + x && mouseX < pos.x + x + xSz && mouseY > pos.y + y && mouseY < pos.y + y + ySz) {
        current_stroke = c_border_clicked;
        pressed = !pressed;
      }
      else {
        current_stroke = c_border;
        pressed = false;
      }
  }
}
