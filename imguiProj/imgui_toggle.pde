class ImGUI_Toggle extends ImGUI_Tab_Element {
  
  String text;
  int x;
  int y;
  int xSz = 34;
  int ySz = 17;
  
  boolean on;
  
  ImGUI_Toggle(ImGUI gui, String text, int x, int y, boolean on) {
    super(gui);
    this.text = text;
    this.x = x;
    this.y = y;
    this.on = on;
    super.display();
  }
  
  ImGUI_Toggle(ImGUI gui, String text, int x, int y) {
    this(gui, text, x, y, false);
  }
  
  void display() {
    super.display();
    if (on) {
      fill(52, 138, 255);
      stroke(76, 92, 115);
      rect(pos.x + x, pos.y + y, xSz, ySz);
      fill(255);
      //noStroke();
      rect(pos.x + x + xSz/2 + 1, pos.y + y + 1, xSz/2 - 1, ySz - 1);
    }
    else {
      fill(30);
      stroke(76, 92, 115);
      rect(pos.x + x, pos.y + y, xSz, ySz);
      fill(255);
      //noStroke();
      rect(pos.x + x + 1, pos.y + y + 1, xSz/2 - 1, ySz - 1);
    }
    stroke(1);
    text(text, pos.x + x + xSz + 2, pos.y + y + ySz/2);
  }
  
  void mousePressed() {
    if (mouseX > pos.x + x && mouseX < pos.x + x + xSz && mouseY > pos.y + y && mouseY < pos.y + y + ySz) {
      on = !on;
    }
  }
}
