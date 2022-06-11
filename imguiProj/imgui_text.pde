class ImGUI_Text extends ImGUI_Tab_Element {
  
  String text;
  int x;
  int y;
  
  ImGUI_Text(ImGUI gui, String text, int x, int y) {
    super(gui);
    this.text = text;
    this.x = x;
    this.y = y;
  }
  
  void display() {
    super.display();
    fill(255);
    textAlign(BASELINE,CENTER);
    text(text, pos.x + x, pos.y + y);
  }
}
