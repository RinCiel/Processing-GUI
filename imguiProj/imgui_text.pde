class ImGUI_Text extends ImGUI_Tab_Element {
  
  String text;
  ImGUI_Text(ImGUI gui, String text) {
    super(gui);
    this.text = text;
  }
  
  void display() {
    super.display();
    fill(255);
    text(text, pos.x + 3, pos.y + 10);
  }
}
