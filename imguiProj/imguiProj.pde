ImGUI gui;
ImGUI_Text tab2_text;

void setup() {
  size(500, 500);
  gui = new ImGUI("Debug");
  
  ImGUI_Tab tab1 = new ImGUI_Tab("tab1");
  tab1.addElement(new ImGUI_Textbox(gui, "hello", 0, 0));
  
  ImGUI_Tab tab2 = new ImGUI_Tab("tab2");
  tab2_text = new ImGUI_Text(gui, "", 0, 0);
  tab2.addElement(tab2_text);
  
  gui.newTab(tab1, true);
  gui.newTab(tab2);
}

void draw() {
  background(120);
  gui.display();
  tab2_text.text = Float.toString(frameRate);
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

void keyPressed() {
  gui.keyPressed();
}
