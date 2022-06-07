ImGUI gui;
ImGUI_Text tab2_text;


void setup() {
  size(500, 500);
  gui = new ImGUI("Debug", 400, 250);
  
  ImGUI_Tab tab1 = new ImGUI_Tab("tab1");
  tab1.addElement(new ImGUI_Textbox(gui, "hello", 0, 0));
  String dropdown_options[] = {"test0", "test1", "test2", "test3", "test4", "test5", "test6", "test7"};
  tab1.addElement(new ImGUI_Dropdown(gui, dropdown_options, 0, 40, 80));
  
  ImGUI_Tab tab2 = new ImGUI_Tab("tab2");
  tab2_text = new ImGUI_Text(gui, "", 0, 0);
  tab2.addElement(new ImGUI_Textbox(gui, "hi", 0, 15));
  tab2.addElement(new ImGUI_Dropdown(gui, dropdown_options, 0, 40, 60));
  tab2.addElement(tab2_text);
  String[] radioOptions = {"one", "two", "three"};
  tab2.addElement(new ImGUI_Radio(gui,radioOptions, 2, 0, 60, 150));
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
