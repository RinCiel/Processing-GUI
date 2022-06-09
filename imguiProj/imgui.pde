class ImGUI {

  //=========================================================
  // globals - customizable
  int C_BACKGROUND = color(21, 22, 23);
  int C_HEADER = color(42, 74, 123);
  int C_BUTTON = color(37, 69, 112);
  //int C_TEXTBOX = color(34, 49, 80);
  //int C_SLIDER = color(69, 130, 218);
  int C_STROKE = color(76, 92, 115);
  int C_STROKE_2 = color(126, 142, 165);
  int C_TAB_STROKE = color(57, 57, 63);
  //=========================================================

  PVector pos;
  PVector size;
  boolean opened = true;
  int radius = 5;
  int headerHeight = 20;
  String headerText;

  PFont font;

  ArrayList<ImGUI_Tab> tabs;

  ImGUI(String name) {
    this(name, 200, 100);
  }

  ImGUI(String headerText, int xSz, int ySz) {
    this.headerText = headerText;
    pos = new PVector(0, 0);
    size = new PVector(xSz, ySz);
    tabs = new ArrayList<ImGUI_Tab>();

    font = createFont("ProggyClean.ttf", 128);
    textFont(font, 16);
  }

  PVector tab_pos;
  public void display() {
    // displays main box thingie and header
    stroke(C_STROKE);
    if (opened) {
      fill(C_BACKGROUND);
      rect(pos.x, pos.y, size.x, size.y, radius);
      fill(C_HEADER);
      rect(pos.x, pos.y, size.x, headerHeight, radius, radius, 0, 0);
      stroke(255);
      fill(255);
      triangle(pos.x + 6, pos.y + 14, pos.x + 10, pos.y + 6, pos.x + 14, pos.y + 14);
    } else {
      fill(C_HEADER);
      rect(pos.x, pos.y, size.x, headerHeight, radius);
      stroke(255);
      fill(255);
      triangle(pos.x + 6, pos.y + 6, pos.x + 10, pos.y + 14, pos.x + 14, pos.y + 6);
    }
    textAlign(LEFT, CENTER);
    text(headerText, pos.x + 19, pos.y + headerHeight/2);

    // update tab positions
    tab_pos = new PVector(pos.x + 1, pos.y + headerHeight + 1);

    // display tabs
    if (opened) {
      if (tabs.size() > 0) {
        stroke(C_TAB_STROKE);
        line(pos.x + 1, pos.y + headerHeight * 2 + 1, pos.x + size.x - 1, pos.y + headerHeight * 2 + 1);
      }
      for (int i = 0; i < tabs.size(); i++) {
        tabs.get(i).display(tab_pos, headerHeight);
        tab_pos.x += int(tabs.get(i).tabWidth);
      }
    }
  }

  void newTab(ImGUI_Tab tab) {
    tabs.add(tab);
  }

  boolean current_tab_set = false;
  ImGUI_Tab current_tab;
  void newTab(ImGUI_Tab tab, boolean current) {
    if (current && !current_tab_set) {
      current_tab = tab;
      tab.current = true;
      current_tab_set = true;
    } else {
      println("Current tab already set");
      current = false;
    }
    tabs.add(tab);
  }

  void changeTab() {
    boolean pressed = false;
    for (int i = 0; i < tabs.size(); i++) {
      // make sure one of them is pressed
      if (tabs.get(i).pressed()) {
        pressed = true;
      }
    }
    if (pressed) {
      for (int i = 0; i < tabs.size(); i++) {
        tabs.get(i).current = tabs.get(i).pressed();
        if (tabs.get(i).current) {
          current_tab = tabs.get(i);
        }
      }
    }
  }
  boolean headerPressed = false;
  boolean pressed = false;
  void mousePressed() {
    // header triangle
    if (mouseX > pos.x && mouseX < pos.x + size.x && mouseY > pos.y && mouseY < pos.y + size.y) {
      pressed = true;
      if (mouseX > pos.x && mouseX < pos.x + size.x && mouseY > pos.y && mouseY < pos.y + headerHeight) {
        headerPressed = true;
      } 
      else headerPressed = false;
    }
    else pressed = false;
    if (mouseX > pos.x + 6 && mouseX < pos.x + 14 && mouseY > pos.y + 6 && mouseY < pos.y + 14) {
      opened = !opened;
      return;
    }
    if (mouseX > pos.x && mouseX < pos.x + size.x && mouseY > pos.y + headerHeight && mouseY < pos.y + headerHeight * 2) {
      changeTab();
      //println("changerav");
    }

    current_tab.mousePressed();
  }

  boolean drag = false;
  void mouseDragged() {
    // draggable header - should be the last thing checked
    if (mouseX > pos.x && mouseX < pos.x + size.x && mouseY > pos.y && mouseY < pos.y + headerHeight && headerPressed) {
      drag = true;
    }
    if (drag) {
      pos.x += mouseX - pmouseX;
      pos.y += mouseY - pmouseY;
    }

    current_tab.mouseDragged();
  }

  void mouseReleased() {
    drag = false;

    current_tab.mouseReleased();
  }

  void keyPressed() {
    current_tab.keyPressed();

    if (key == CODED) {
      if (keyCode == 36) {
        gui.pos = new PVector(0, 0);
       // gui2.pos = new PVector(100, 100);
      }
    }
    if (key == CODED) {

      if (keyCode == DOWN) {
        if (gui.pos.x >= width / 2 - gui.pos.x) {

          gui.pos = new PVector(width - size.x, height - size.y);
        } else {
          gui.pos = new PVector(0, height - size.y);
        }
      }
    }
    if (key == CODED) {
      if (keyCode == RIGHT) {

        if (gui.pos.y >= height / 2) {

          gui.pos = new PVector(width - size.x, height - size.y);
        } else {
          gui.pos = new PVector(width - size.x, 0);
        }
      }
    }
    if (key == CODED) {
      if (keyCode == LEFT) {
        if (gui.pos.y >= height / 2) {
          gui.pos = new PVector(0, height - size.y);
        } else {
          gui.pos = new PVector(0, 0);
        }
      }
    }
    if (key == CODED) {
      if (keyCode == UP) {

        if (gui.pos.x >= 100) {

          gui.pos = new PVector(width - size.x, 0);
        } else {
          gui.pos = new PVector(0, 0);
        }
      }
    }
  }
}
