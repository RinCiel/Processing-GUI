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
    rect(pos.x + x, pos.y + y, xSz, ySz);
  }
}
