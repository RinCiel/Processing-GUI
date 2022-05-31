class ImGUI_Textbox extends ImGUI_Tab_Element {

    int x, y, xSz, ySz;
    String text;
    String visible_text;
    
    int c_border;
    int c_fill;
    int c_border_clicked;
    
    int current_stroke;

    ImGUI_Textbox(ImGUI gui, String text, int x, int y, int xSz) {
        super(gui);
        c_border = gui.C_STROKE;
        current_stroke = c_border;
        c_border_clicked = gui.C_STROKE_2;
        
        c_fill = gui.C_BUTTON;
        
        this.text = text;
        this.x = x;
        this.y = y;
        this.xSz = xSz;
        this.ySz = 17;
    }
    
    ImGUI_Textbox(ImGUI gui, String text, int x, int y) {
      this(gui, text, x, y, 80);
    }
    
    ImGUI_Textbox(ImGUI gui, int x, int y) {
      this(gui, "", x, y, 80);
    }
    
    void textTrim() {
      visible_text = text;
      while (textWidth(visible_text) > xSz - 4) {
        visible_text = visible_text.substring(1);
      }
    }
    
    int m;
     void blinkingCursor() {
      m = millis() % 1000;
      if (m > 500) {
        visible_text += "|";
      }
    }

    void display() {
        super.display();
        stroke(current_stroke);
        fill(c_fill);
        rect(pos.x + x, pos.y + y, xSz, ySz);
        fill(255);
        textAlign(LEFT, CENTER);
        textTrim();
        if (pressed) {
          blinkingCursor();
        }
        text(visible_text, pos.x + x + 3, pos.y + y + ySz/2);
    }
    
    boolean pressed = false;
    void mousePressed() {
      if (mouseX > pos.x + x && mouseX < pos.x + x + xSz && mouseY > pos.y + y && mouseY < pos.y + y + ySz) {
        current_stroke = c_border_clicked;
        pressed = true;
      }
      else {
        current_stroke = c_border;
        pressed = false;
      }
    }
    
    void keyPressed() {
      if (pressed) {
        if (key == DELETE || key == BACKSPACE) {
          if (text.length() >= 1) {
            text = text.substring(0, text.length() - 1);
          }
        }
        else {
          if (int(key) > 31 && int(key) < 127) {
            text += key;
          }
        }
      }
    }
}
