class ImGUI_Tab_Element {
  
  ImGUI gui;
  PVector pos;
  ImGUI_Tab_Element(ImGUI gui) {
    this.gui = gui;
  }
  
  void display() {
    pos = new PVector(gui.pos.x, gui.pos.y + gui.headerHeight * 2);
  }
}
