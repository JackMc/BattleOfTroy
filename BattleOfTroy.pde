import java.util.ArrayList;

private boolean debug = false;
private Scene current;

void setup() {
  size(1024, 640);
  // Add drawables
  loadTiles();
  
  current = new Scene("first");
}

void draw() {
  current = current.draw();
  if (debug) {
    textAlign(LEFT, TOP);
    text("FPS: " + frameRate, 0,0);
  }
}

void keyPressed() {
  if (key == '`') {
    debug = !debug;
  }
  current.keyPressed();
}

void keyReleased() {
  current.keyReleased();
}
