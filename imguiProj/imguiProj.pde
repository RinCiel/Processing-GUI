ImGUI gui;
ImGUI_Text tab2_text;
ImGUI_Button button;
ImGUI_Toggle toggle;

void setup() {
  size(500, 500);
  gui = new ImGUI("Debug", 275, 125);
  
  ImGUI_Tab tab1 = new ImGUI_Tab("tab1");
  tab1.addElement(new ImGUI_Textbox(gui, "hello", 0, 0));
  String dropdown_options[] = {"test0", "test1", "test2", "test3", "test4", "test5", "test6", "test7"};
  String[] radioOptions = {"one", "two", "three"};
  tab1.addElement(new ImGUI_Radio(gui,radioOptions, 2, 0, 40, 140));
  tab1.addElement(new ImGUI_Dropdown(gui, dropdown_options, 0, 20, 80));
  
  ImGUI_Tab tab2 = new ImGUI_Tab("tab2");
  tab2_text = new ImGUI_Text(gui, "", 90, 50);
  tab2.addElement(tab2_text);
  toggle = new ImGUI_Toggle(gui, "toggle", 0, 0);
  tab2.addElement(new ImGUI_Checkbox(gui,"checker2",0, 40,false));
  tab2.addElement(new ImGUI_Checkbox(gui, "checker1", 0, 20, false));
  button = new ImGUI_Button(gui, "button",90,0, int(textWidth("button")) + 4);
  tab2.addElement(button);
  tab2.addElement(toggle);
  tab2.addElement(new ImGUI_Slider(gui,"slider", 90, 25, 120, 0, 100, 0, 5));
  
  
  gui.newTab(tab1, true);
  gui.newTab(tab2);
  //gui.newTab(tab3);
}

void draw() {
  background(120);
  gui.display();
  tab2_text.text = Float.toString(frameRate);
  if (button.pressed) println(random(8));
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
