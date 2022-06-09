class ImGUI_Slider extends ImGUI_Tab_Element {
  int C_BUTTON = color(37, 69, 112);
  int x;
  int y;
  int xSz;
  int ySz;
  String text = "";
  int start;
  int end;
  int val;
  int step;
  int currVal;
  float circleX;
  int valThing;
  ImGUI_Slider(ImGUI gui, String text, int x, int y, int xSz,int start, int end, int val, int step) {
    super(gui);
    //this.options = new ArrayList<String>();
    this.x = x;
    this.y = y;
    this.xSz = xSz;
    this.ySz = 17;
    //for (int i = 0; i < options.length; i++) {
    //  this.options.add(options[i]);
    //}
    this.start = start;
    this.end = end;
    this.val = val;
    this.text = text;
    this.step = step;
    super.display();
  }
  
  ImGUI_Slider(ImGUI gui, String text, int x, int y, int start, int end, int val, int step) {
    this(gui,text, x, y, 80,start,end,val,step);
  }
  
  void display() {
    super.display();
    if (val >= end) val = stepHelper(end,step,false);
    if (val <= start) val = stepHelper(start,step,true);
    circleX = map(val,start,end,x + pos.x,x+pos.x+xSz);
    fill(C_BUTTON);
    stroke(C_BUTTON);
    rect(pos.x + x,pos.y + y+ySz/6,xSz,ySz/3);
    textAlign(BASELINE,CENTER);
    text(str(start), pos.x+x,pos.y+y+(5 * ySz/6));
    text(str(end), pos.x+x+xSz - (str(end).length() * 8),pos.y+y+(5 * ySz/6));

    stroke(50);
    fill(97,139,172);
    circle(circleX,y+pos.y+ySz/3,ySz - 5);
    fill(255);
    textAlign(LEFT,CENTER);
    text(text,pos.x+x+xSz + 15, pos.y+y+ySz/3);

    textAlign(CENTER,CENTER);
    text(str(val),circleX,y + pos.y+ySz/3);
  }
  
  boolean pressed = false;
  void mousePressed(){
      if (pow((mouseX - circleX),2) + pow((mouseY -  (y+pos.y+ySz/3)),2) < pow(ySz/2f,2)){
        pressed = true;
      }
  }
  void mouseDragged() {
      if (pressed){
      valThing  = int(map(mouseX,x+pos.x,x+pos.x+xSz,start,end));
      val = valThing;

   
    }
    
  }
  void mouseReleased(){
    pressed = false;
    if (valThing % step != 0){
      if (valThing % step > step/2f) val = valThing + (step - (valThing % step));
      else val = valThing - (valThing % step);
    }
  }
  int stepHelper(int valThing,int step, boolean start){
    if (valThing % step != 0){
      if (!start){
       return valThing - (valThing % step);
      }
      if (start) {
        return valThing + (step - (valThing % step));
      }
    }
    return valThing;
  }
}
