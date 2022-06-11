//GUI





//void setup() {
  //frameRate(30);
  //size(800, 800);
  //grid = new Grid(gridSize, conwayRule);
  //grid.display();
//}

//void draw() {
//  brc();
//  String msg = brcChanged();

//  if (msg.equals("Start")) {
//    started = true;
//  } else if (msg.equals("Step")) {
//    started = false;
//    step = true;
//    stepped = false;
//  } else if (msg.equals("Stop")) {
//    started = false;
//    step = false;
//  } else if (msg.equals("Clear")) {

//    brcSetMonitor("Population",0);
//    brcSetMonitor("Generation",0);
//  } else if (msg.equals("Frames")) {
//    frameRate(int(brcValue(msg)));
//  } else if (msg.equals("Mode")) {
//    if (brcValue(msg).equals("D")) {
//      drawing = true;
//    } else {
//      drawing = false;
//    }
//  } else if (msg.equals("Grid")) {
    //gridSize = int(brcValue(msg));
    //grid = new Grid(gridSize, conwayRule);
    //grid.loadSample(sample);
//  } else if (msg.equals("Rule")) {
//    if (brcValue(msg).equals("CONWAY")) {
      //conwayRule = true;
      //grid = new Grid(gridSize, conwayRule);
      //grid.loadSample(sample);
//    } else {
//      conwayRule = false;
//      grid = new Grid(gridSize, conwayRule);
//      grid.loadSample(sample);
//    }
//  } else if (msg.equals("Randomness")) {
    //grid = new Grid(gridSize, conwayRule);
    //grid.randomAlive(int(brcValue(msg)));
    //grid.display();
//  } else if (msg.equals("SAMPLE")) {
//    if (!brcValue(msg).equals("NA")) {
//      sample = int(brcValue(msg));
      //grid = new Grid(gridSize, conwayRule);
      //grid.loadSample(sample);
//    }
//  }

  //if (drawing) {
  //  if (mousePressed == true) {
  //    grid.isPressed(true);
  //  }
  //} else {
  //  if (mousePressed == true) {
  //    grid.isPressed(false);
  //  }
  //}

  //if (started) {
  //  grid.grow();
  //  grid.display();
  //}
  //if (step && !stepped) {
  //  grid.grow();
  //  grid.display();
  //  stepped = true;
  //}
//}
