//GOL Stuff




Grid grid;
boolean started = false;

boolean drawing = true; // false is erase

boolean step = false;
boolean stepped = false;
boolean conwayRule = true; // false is highlife rule

int sample = 0;

int gridSize = 50;



//name elements
ImGUI gui;
ImGUI_Button startButton;
ImGUI_Button stepButton;
ImGUI_Button stopButton;
ImGUI_Button clearButton;
ImGUI_Slider frames;
ImGUI_Dropdown mode;
ImGUI_Slider size;
ImGUI_Text rulesInfo;
ImGUI_Radio rule;
ImGUI_Text popInfo;
ImGUI_Slider alive;
ImGUI_Text sampleInfo;
ImGUI_Text sampleInfo1;
ImGUI_Dropdown sampleChoice;
ImGUI_Text pop;
ImGUI_Text gen;
ImGUI_Color colors;
ImGUI_Text r;
ImGUI_Text g;
ImGUI_Text b;




String modeDropdown[] = {"Draw", "Erase"};
String ruleRadio[] = {"Conway's Rule", "Highlife Rule"};
String sampleDropdown[] = {"None", "Gosper's Glider Gun", "Pulsar", "Rake", "--Below requires Highlife--", "Replicator", "Bomber"};
int aliveNum = 0;
int ruleNum = 0;

void setup() {
  frameRate(30);
  size(800, 800);
  grid = new Grid(gridSize, conwayRule);
  grid.display();
  gui = new ImGUI("Debug", 295, 155);
  //define lists for dropdowns

  // create actual elements
  ImGUI_Tab tab1 = new ImGUI_Tab("Setup");
  ImGUI_Tab tab2 = new ImGUI_Tab("Options");
  ImGUI_Tab tab3 = new ImGUI_Tab("Population");
  ImGUI_Tab tab4 = new ImGUI_Tab("Color");

  startButton = new ImGUI_Button(gui,"Start", 5, 0, 40);
  stepButton = new ImGUI_Button(gui,"Step", 60, 0, 40);
  stopButton = new ImGUI_Button(gui,"Stop", 115, 0, 40);
  clearButton = new ImGUI_Button(gui,"Clear",170 , 0, 40);
  frames = new ImGUI_Slider(gui,"Frame rate", 5, 20, 150, 5, 100, 30, 5);
  size = new ImGUI_Slider(gui,"Grid Size", 5, 40, 150, 50, 200, 75, 5);
  pop = new ImGUI_Text(gui,"Population: 0",0,80);
  gen = new ImGUI_Text(gui,"Generation : 0",125,80);
  mode = new ImGUI_Dropdown(gui, modeDropdown, "Draw", 75, 0, 55);
  rulesInfo = new ImGUI_Text(gui, "Default is Conway's Rule.However,", 0, 25);
  rule = new ImGUI_Radio(gui, ruleRadio, 0, 0, 90, 235);
  popInfo = new ImGUI_Text(gui, "For random population", 0, 0);
  alive = new ImGUI_Slider(gui, "Percent alive", 5, 10, 150, 0, 100, 0, 1);
  sampleInfo = new ImGUI_Text(gui, "These are some cool samples.", 0, 35);
  sampleInfo1 = new ImGUI_Text(gui, "Replicator samples only work w/ Highlife", 0, 46);
  sampleChoice = new ImGUI_Dropdown(gui,sampleDropdown, "None", 0, 57,180);
  colors = new ImGUI_Color(gui, 0, 0, color(0,255,0));
  r = new ImGUI_Text(gui, "R: "+ str(red(colors.currentColor)), 100, 0);
  g = new ImGUI_Text(gui, "G: "+ str(green(colors.currentColor)), 100, 11);
  b = new ImGUI_Text(gui, "B: "+ str(blue(colors.currentColor)), 100, 22);

  //variables for values
  
  //add elements to tab
  tab1.addElement(startButton);
  tab1.addElement(stepButton);
  tab1.addElement(stopButton);
  tab1.addElement(clearButton);
  tab1.addElement(frames);
  tab1.addElement(size);
  tab1.addElement(pop);
  tab1.addElement(gen);
  
  tab2.addElement(new ImGUI_Text(gui,"Edit mode:", 0, 7));
  tab2.addElement(rulesInfo);
  tab2.addElement(new ImGUI_Text(gui, "Highlife Rule is required to run", 0, 35));
  tab2.addElement(new ImGUI_Text(gui, "replicator samples. Highlife rule", 0, 46)); 
  tab2.addElement(new ImGUI_Text(gui, "allows cells to grow if there are 3", 0, 57));
  tab2.addElement(new ImGUI_Text(gui,"and 6 neighbors,compared to the", 0, 68));
  tab2.addElement(new ImGUI_Text(gui, "default 3 neighbors.", 0, 79));
  tab2.addElement(rule);
  tab2.addElement(mode);
  
  tab3.addElement(popInfo);
  tab3.addElement(alive);
  tab3.addElement(sampleInfo);
  tab3.addElement(sampleInfo1);
  tab3.addElement(sampleChoice);
  
  tab4.addElement(colors);
  tab4.addElement(r);
  tab4.addElement(g); 
  tab4.addElement(b);
   
  gui.newTab(tab1, true);
  gui.newTab(tab2);
  gui.newTab(tab3);
  gui.newTab(tab4);
}

void draw() {
  background(0);

  if (startButton.pressed){
    started = true;
    println("startpress");
  }
  else if (stepButton.pressed){
    step = true;
    stepped = false;
    //println("Steppress");
  }
  else if (stopButton.pressed){
    started = false;
    step = false;
  }
  else if (clearButton.pressed){
    started = false;
    step = false;
    grid = new Grid(gridSize, conwayRule);
    pop.text = "Population: " + str(0);
    gen.text = "Generation: " + str(0);
  }
  frameRate(frames.val);
  if (mode.text.equals(modeDropdown[1])){
    drawing = false;
  }
  else drawing = true;
  //clear
  if (size.val != gridSize){
    gridSize = int(size.val);
    grid = new Grid(gridSize, conwayRule);
    grid.loadSample(sample);
  }
  if (rule.pressedOne != ruleNum){
    ruleNum = rule.pressedOne;
    if (ruleNum == 0){
      conwayRule = true;
      grid = new Grid(gridSize, conwayRule);
      grid.loadSample(sample);    
    }
    else{
      conwayRule = false;
      grid = new Grid(gridSize, conwayRule);
      grid.loadSample(sample);   
    }
  }
    //clear

  if (alive.val != aliveNum){
    aliveNum = alive.val;
    grid = new Grid(gridSize, conwayRule);
    grid.randomAlive(int(aliveNum));
    grid.display();
  }
  if (sampleChoice.options.indexOf(sampleChoice.text) != sample){
    sample = sampleChoice.options.indexOf(sampleChoice.text);
  //println(sample);
    if (sample == -1) sample = 0;
    if (sample != 0 && sample != 4){
        grid = new Grid(gridSize, conwayRule);
        grid.loadSample(sample);  
    }
  }
  //if (drawing) {
  //  if (!gui.drag && !gui.pressed){
  //    if (mousePressed == true) {
  //      grid.isPressed(true);
  //    }
  //  } else {
  //    if (mousePressed == true) {
  //      grid.isPressed(false);
  //    }
  //  }
  //}
  if (!gui.drag && !gui.pressed) {
    if (mousePressed == true) {
      if (drawing) {
        grid.isPressed(true);
      }
      else {
        grid.isPressed(false);
      }
    }
  }
  if (started) {
    grid.grow();
    grid.display();
  }
  else if (step && !stepped) {
    grid.grow();
    stepped = true;
  }
  r.text =   "R: "+ str(red(colors.currentColor));
  g.text =   "G: "+ str(green(colors.currentColor));
  b.text =   "B: "+ str(blue(colors.currentColor));
  
  grid.display();
  gui.display();

}
void mousePressed() {
  gui.mousePressed();
  //if (!gui.pressed){
  //  if (drawing) grid.isPressed(true);
  //  else grid.isPressed(false);
  //}
}

void mouseDragged() {
  gui.mouseDragged();
  //if (!gui.drag){
  //  if (drawing) grid.isPressed(true);
  //  else grid.isPressed(false);   
  //}
}

void mouseReleased() {
  gui.mouseReleased();
}

void keyPressed() {
  gui.keyPressed();
}
