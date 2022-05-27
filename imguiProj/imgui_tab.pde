class ImGUI_Tab {
  
  int C_TAB = color(21, 22, 23);
  int C_TAB_CURRENT = color(38, 38, 39);
  
  String name;
  boolean current = false;
  PVector pos;
  float tabWidth;
  int headerHeight;
  
  ArrayList<ImGUI_Tab_Element> elements;
  
  ImGUI_Tab(String name) {
    this(name, false);
  }
  
  ImGUI_Tab(String name, boolean current) {
    this.name = name;
    this.current = current;
    tabWidth = textWidth(name) * 1.2;
    elements = new ArrayList<ImGUI_Tab_Element>();
  }
    
  void display(PVector pos, int headerHeight) {
    this.headerHeight = headerHeight;
    
    if (current) {
      fill(C_TAB_CURRENT);
    }
    else {
      fill(C_TAB);
    }
    noStroke();
    rect(pos.x, pos.y, tabWidth, headerHeight);
    this.pos = new PVector(pos.x, pos.y);
    textAlign(LEFT, CENTER);
    fill(255);
    text(name, pos.x + 2, pos.y + headerHeight/2);
    
    if (current) {
      for (int i = 0; i < elements.size(); i++) {
        elements.get(i).display();
      }
    }
  }
  
  void addElement(ImGUI_Tab_Element element) {
    elements.add(element);
  }
  
  boolean pressed() {
    if (mouseX > pos.x && mouseX < pos.x + tabWidth && mouseY > pos.y && mouseY < pos.y + headerHeight) {
      return true;
    }
    return false;  
  }
}
