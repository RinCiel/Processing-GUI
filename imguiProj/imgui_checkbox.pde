class ImGUI_Checkbox extends ImGUI_Tab_Element{
  boolean checked;
  String text;
  float size = 16;
  int x;
  int y;
  
  ImGUI_Checkbox(ImGUI gui,String text,int x, int y, boolean checked){
    super(gui);
    this.text = text;
    this.checked = checked;
    this.x = x;
    this.y = y;
    super.display();
  }
  void display(){

    super.display();
    fill(color(8, 228, 255));
    if (checked){
      noStroke();
      square(pos.x + x + 3, pos.y + y + 3, 11);
    }
    stroke(8, 228, 255);
    noFill();
    square(pos.x+x,pos.y+y,size);
    fill(255);
    text(text, pos.x + x + size+3, pos.y + 7+ y);
  }
  
  void mousePressed(){
    if (mouseX >= pos.x +x && mouseY >= pos.y +y&& mouseX < pos.x +x + size && mouseY < pos.y + y+ size){
      checked = !checked;
    } 
  }
  
  
  
}
