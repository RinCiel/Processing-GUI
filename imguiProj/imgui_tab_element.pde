class ImGUI_Tab_Element {
  
  ImGUI gui;
  PVector pos;
  ImGUI_Tab_Element(ImGUI gui) {
    this.gui = gui;
  }
  
  void display() {
    pos = new PVector(gui.pos.x, gui.pos.y + gui.headerHeight * 2 + 2);
    pos.add(new PVector(5, 5));
  }
  
  void keyPressed() {
  }
  
  void mousePressed() {
  }
  
  void mouseDragged() {
  }
  
  void mouseReleased() {
  }
}
