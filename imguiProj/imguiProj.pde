ImGUI gui;
ImGUI_Text tab2_text;
ImGUI_Button button;
ImGUI_Toggle toggle;

void setup() {
  size(500, 500);
  gui = new ImGUI("Debug", 400, 250);
  
  ImGUI_Tab tab1 = new ImGUI_Tab("tab1");
  button = new ImGUI_Button(gui, "buttonthatdoessomething",0,70,165);
  //tab1.addElement(button);
  tab1.addElement(new ImGUI_Textbox(gui, "hello", 0, 0));
  String dropdown_options[] = {"test0", "test1", "test2", "test3", "test4", "test5", "test6", "test7"};
  tab1.addElement(new ImGUI_Dropdown(gui, dropdown_options, 0, 30, 80));
  String[] radioOptions = {"one", "two", "three"};
  tab1.addElement(new ImGUI_Radio(gui,radioOptions, 2, 0, 60, 150));
  
  ImGUI_Tab tab2 = new ImGUI_Tab("tab2");
  tab2_text = new ImGUI_Text(gui, "", 0, 0);
  tab2.addElement(new ImGUI_Textbox(gui, "hi", 0, 15));
  tab2.addElement(new ImGUI_Dropdown(gui, dropdown_options, 0, 40, 60));
  tab2.addElement(tab2_text);
  
  ImGUI_Tab tab3 = new ImGUI_Tab("tab3");
  
  toggle = new ImGUI_Toggle(gui, "toggle", 0, 0);
  tab3.addElement(new ImGUI_Checkbox(gui,"checker",0, 50,false));
  tab3.addElement(new ImGUI_Checkbox(gui, "checker2", 0, 20, false));
  tab3.addElement(button);
  tab3.addElement(toggle);
  
  
  gui.newTab(tab1, true);
  gui.newTab(tab2);
  gui.newTab(tab3);
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
