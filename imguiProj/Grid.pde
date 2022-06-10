class Grid {
  int size;
  boolean conwayRule;
  Cell[][] cellArray;
  int[][] neighbors;
  int population = 0;
  int generation = 0;
  Grid(int gridSize, boolean rule) {
    size = gridSize;
    background(0);
    conwayRule = rule;
    cellArray = new Cell[gridSize][gridSize];
    for (int i = 0; i < gridSize; i++) {
      for (int j = 0; j < gridSize; j++) {
        cellArray[i][j] = new Cell(i * width / float(gridSize), j * width / float(gridSize), width / float(gridSize));
      }
    }
    drawGridLines();
  }
  
  void drawGridLines() {
    for (int i = 1; i <= cellArray.length; i++) {
      stroke(40);
      line(i * width / float(cellArray.length), 0, i * width / float(cellArray.length), height);
      line(0, i * height / float(cellArray.length), width, i * height / float(cellArray.length));
    }
  }
  
  void grow() {
    population = 0;
    background(0);
    drawGridLines();
    neighbors = new int[cellArray.length][cellArray.length];
    for (int i = 0; i < cellArray.length; i++) {
      for (int j = 0; j < cellArray[i].length; j++) {
        neighbors[i][j] = 0;
      }
    }
    for (int i = 0; i < cellArray.length; i++) {
      for (int j = 0; j < cellArray[i].length; j++) {
        if (cellArray[i][j].alive) {
          updateNeighbors(i, j);
        }
      }
    }
    for (int i = 0; i < neighbors.length; i++) {
      for (int j = 0; j < neighbors[i].length; j++) {
        if (conwayRule) {
          conwayRule(i, j);
        }
        else {
          highLifeRule(i, j);
        }
      }
    }
    pop.text = "Population: " + str(population);
    //brcSetMonitor("Population", population);
    generation++;
    gen.text = "Generation: " + str(generation);
    //brcSetMonitor("Generation", generation);
  }
  
  void conwayRule(int i, int j) {
    if (neighbors[i][j] < 2 && cellArray[i][j].alive) {
          cellArray[i][j].alive = false;
          cellArray[i][j].generationsAlive = 0;
        }
        else if (neighbors[i][j] > 3 && cellArray[i][j].alive) {
          cellArray[i][j].alive = false;
          cellArray[i][j].generationsAlive = 0;
        }
        
        else if (neighbors[i][j] == 3 && !cellArray[i][j].alive) {
          cellArray[i][j].alive = true;
          cellArray[i][j].generationsAlive = 0;
        }
        else {
          cellArray[i][j].generationsAlive++;
        }
        
        if (cellArray[i][j].alive) {
          population++;
        }
  }
  
  void highLifeRule(int i, int j) {
    if (neighbors[i][j] < 2 && cellArray[i][j].alive) {
          cellArray[i][j].alive = false;
          cellArray[i][j].generationsAlive = 0;
        }
        else if (neighbors[i][j] > 3 && cellArray[i][j].alive) {
          cellArray[i][j].alive = false;
          cellArray[i][j].generationsAlive = 0;
        }
        
        else if ((neighbors[i][j] == 3 || neighbors[i][j] == 6) && !cellArray[i][j].alive) {
          cellArray[i][j].alive = true;
          cellArray[i][j].generationsAlive = 0;
        }
        else {
          cellArray[i][j].generationsAlive++;
        }
        
        if (cellArray[i][j].alive) {
          population++;
        }
  }
  void display() {
    drawGridLines();
    for (int i = 0; i < cellArray.length; i++) {
      for (int j = 0; j < cellArray.length; j++) {
        if (cellArray[i][j].alive) {
          cellArray[i][j].display();
        }
      }
    }
  }
  
  void updateNeighbors(int i, int j) {
    int im1 = i - 1;
    int ip1 = i + 1;
    int jm1 = j - 1;
    int jp1 = j + 1;
    if (im1 < 0) {
      im1 = cellArray.length - 1;
    }
    else if (ip1 >= cellArray.length) {
      ip1 = 0;
    }
    if (jm1 < 0) {
      jm1 = cellArray.length - 1;
    }
    else if (jp1 >= cellArray.length) {
      jp1 = 0;
    }
    else {
      jm1 = j - 1;
      jp1 = j + 1;
    }
    neighbors[im1][j]++;
    neighbors[ip1][j]++;
    neighbors[i][jm1]++;
    neighbors[i][jp1]++;
    neighbors[im1][jm1]++;
    neighbors[im1][jp1]++;
    neighbors[ip1][jm1]++;
    neighbors[ip1][jp1]++;
  }
  
  void isPressed(boolean draw) {
    int x = int(mouseX / (width / float(cellArray.length)));
    int y = int(mouseY / (height / float(cellArray.length)));
    if (x >= 0 && x <= size - 1 && y >= 0 && y <= size - 1) {
      if (draw) {
        cellArray[x][y].alive = true;
        cellArray[x][y].generationsAlive = 0;
      }
      else {
        cellArray[x][y].alive = false;
        fill(0);
        square(cellArray[x][y].xCoord,cellArray[x][y].yCoord,cellArray[x][y].size);
        drawGridLines();
      }
    }
    display();
  }
  
  void randomAlive(int percent) {
    for (int i = 0; i < cellArray.length; i++) {
      for (int j = 0; j < cellArray.length; j++) {
        if (percent == 100 || int(random(100)) + 1 <= percent) {
          cellArray[i][j].alive = true;
          cellArray[i][j].generationsAlive = 0;
        }
      }
    }
  }
  
  void loadSample(int sampleNum) {
    int[][] sample = {};
    if (sampleNum == 0) {
      return;
    }
    else if (sampleNum == 1) {
      sample = gosperGliderGun;
    }
    else if (sampleNum == 2) {
      sample = pulsar;
    }
    else if (sampleNum == 3) {
      sample = rake;
    }
    else if (sampleNum == 4) {
      sample = replicator;
    }
    else {
      sample = bomber;
    }
    for (int i = 0; i < sample.length; i++) {
      for (int j = 0; j < sample[i].length; j++) {
        if (sample[i][j] == 1) {
          cellArray[j][i].alive = true;
          cellArray[j][i].generationsAlive = 0;
        }
        else {
          cellArray[j][i].alive = false;
        }
      }
    }
    display();
  }
}

class Cell {
  boolean alive = false;
  int generationsAlive = 0;
  float xCoord;
  float yCoord;
  float size;
  
  Cell(float xIn, float yIn, float sizeIn) {
    xCoord = xIn;
    yCoord = yIn;
    size = sizeIn;
  }
  
  void display() {
    if (alive) {
      stroke(0);
      fill(lerpColor(color(255), color(0,255,0), 0.05 * generationsAlive));
      square(xCoord, yCoord, size);
    }
  }
}
