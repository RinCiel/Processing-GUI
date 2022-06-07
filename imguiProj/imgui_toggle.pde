class ImGUI_Toggle extends ImGUI_Tab_Element {
  
  String text;
  float x;
  float y;
  float xSz;
  float h;
  
  float xButton;
  float yButton;
  float wButton;
  float hButton;
  boolean on;
  boolean anim = false;
  ImGUI_Toggle(ImGUI gui, String text, int _x, int _y, float _xSz, boolean _on) {
    super(gui);
    this.text = text;
    super.display();
    x = pos.x + _x;
    y = pos.y + _y;
    xSz = _xSz;
    h = 17;
    on = _on;
    if (_on) {
      xButton = x + xSz/2.0;
    }
    else {
      xButton = x;
    }
    yButton = y;
    wButton = xSz/2.0;
    hButton = h;
  }
  
  void display() {
    super.display();
    fill(255);
    text(text, x+pos.x, y + h  +h/4f+pos.y);
        noStroke();
    // whole slider
    if (!on) {
      fill(129, 131, 132);
    }
    else {
      fill(83, 141, 78);
    }
    
    rect(x+pos.x, y+pos.y, xSz, h, 6);
    
    fill(255);
    if (anim) {
      if (!on) {
        xButton += 2;
        if (xButton > x + xSz/2 - 1) {
          anim = false;
        }
      }
      else {
        xButton -= 2;
        if (xButton < x) {
          anim = false;
        }
      }
      if (!anim) {
        on = !on;
      }
    }
    if (!on) { // smaller slider inside
      rect(xButton+pos.x, yButton+pos.y, wButton, hButton, 6);
    }
    else {
      rect(xButton+pos.x, yButton+pos.y, wButton, hButton, 6);
    }
  }
  
  void mousePressed() {
    if (mouseX > x && mouseX < x + xSz && mouseY >y && mouseY < y + h) {
      anim = true;
      }
  }
}

//class Toggle {
  //float x;
  //float y;
  //float w;
  //float h;
  
  //float xButton;
  //float yButton;
  //float wButton;
  //float hButton;
  
//  boolean on;
  
//  Toggle(float _x, float _y, float _w, float _h, boolean _on) {
  //  x = _x;
  //  y = _y;
  //  w = _w;
  //  h = _h;
  //  on = _on;
  //  if (_on) {
  //    xButton = x + w/2.0;
  //  }
  //  else {
  //    xButton = x;
  //  }
  //  yButton = y;
  //  wButton = w/2.0;
  //  hButton = h;
  //}
  
//  void display() {
    //noStroke();
    //// whole slider
    //if (!on) {
    //  fill(129, 131, 132);
    //}
    //else {
    //  fill(83, 141, 78);
    //}
    
    //rect(x, y, w, h, 6);
    
    //fill(255);
    //if (anim) {
    //  if (!on) {
    //    xButton += 2;
    //    if (xButton > x + w/2 - 1) {
    //      anim = false;
    //    }
    //  }
    //  else {
    //    xButton -= 2;
    //    if (xButton < x) {
    //      anim = false;
    //    }
    //  }
    //  if (!anim) {
    //    on = !on;
    //  }
    //}
    //if (!on) { // smaller slider inside
    //  rect(xButton, yButton, wButton, hButton, 6);
    //}
    //else {
    //  rect(xButton, yButton, wButton, hButton, 6);
    //}
//  }
  
//  boolean anim = false;
  
  //void pressed() {
  //  if (mouseX > x && mouseX < x + w && mouseY >y && mouseY < y + h) {
  //    if (gInterface.currentRow == 0) {
  //      anim = true;
  //      gEngine.hardMode = !gEngine.hardMode;
  //    }
  //    else {
  //      gInterface.message("Hard mode can only be switched at the start of a round", 320.0, 13);
  //    }
  //  }
  //}
//}
