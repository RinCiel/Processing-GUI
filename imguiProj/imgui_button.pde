class ImGUI_Button extends ImGUI_Tab_Element{
  boolean pressed;
  String text;
  float size;
  float sizey = 17;
  //float size2;
  //float sizey2;
  int x;
  int y;
  //int xSz;
  boolean doOnce = false;
  int startTime = 0;
  ImGUI_Button(ImGUI gui,String text,int x, int y){
    super(gui);
    this.text = text;
    size = 8 * text.length();
    //size2 = size * 1.02;
    //sizey2 = sizey * 1.02;
    pressed = false;
    this.x = x;
    this.y = y;
    size = 100;
    super.display();
  }
  ImGUI_Button(ImGUI gui,String text,int x, int y, int xSz){
    super(gui);
    this.text = text;
    size = 8 * text.length();
    //size2 = size * 1.05;
    //sizey2 = sizey * 1.05;
    pressed = false;
    this.x = x;
    this.y = y;
    this.size = xSz;
    
    super.display();
  }
  
  int pressed_counter = 0;
  void display(){
   // println(pressed);

    super.display();
    fill(color(27,59,102));
    stroke(76, 92, 115);
    if (pressed){
      fill(color(47,79,122));
      rect(pos.x+x,pos.y+y,size,sizey);
    }
    else{
      rect(pos.x+x,pos.y+y,size,sizey);
    }
    //fill(35);
    //text(text,pos.x,pos.y);
    fill(255);
    text(text, pos.x + 3+x, pos.y + 7+y);
    if (pressed) {
      pressed_counter++;
    }
    if (pressed_counter == 2) {
      pressed = false;
      pressed_counter = 0;
    }
  }

  void mouseReleased(){
     if (mouseX >= pos.x +x && mouseY >= pos.y +y&& mouseX < pos.x +x + size && mouseY < pos.y + y+ sizey){
      pressed = true;
    }
  }
}
