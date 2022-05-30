ImGUI gui;

void setup() {
  size(500, 500);
  gui = new ImGUI("Debug");
  ImGUI_Tab tab1 = new ImGUI_Tab("tab1");
  tab1.addElement(new ImGUI_Text(gui, "hello"));
  ImGUI_Tab tab2 = new ImGUI_Tab("tab2");
  tab2.addElement(new ImGUI_Text(gui, "bye"));
  gui.newTab(tab1, true);
  gui.newTab(tab2);
}

void draw() {
  background(120);
  gui.display();
}

void mousePressed() {
  gui.mousePressed();
}

void mouseDragged() {
  gui.mouseDragged();
}

void mouseReleased() {
  gui.mouseReleased();
}
