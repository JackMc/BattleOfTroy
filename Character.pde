public class MainCharacter extends Entity {
  private final int CHARACTER_DIAMETER = 10;
  private final int VELOCITY_ABS = 3;
  
  public MainCharacter(int x, int y, TileManager tileManager) {
    // Makes a character at a given x,y
    super(x, y, tileManager);
  }

  public MainCharacter(TileManager tileManager) {
    // Makes a character in the center of the screen
    super(width/2, height/2, tileManager);
  }

  public void draw() {
    ellipse(x, y, CHARACTER_DIAMETER, CHARACTER_DIAMETER);
    super.draw();
  }
  
  public int getWidth() {
    return CHARACTER_DIAMETER;
  }

  public int getHeight() {
    return CHARACTER_DIAMETER;
  }
  
  public void keyPressed() {
    if (key == 'w') {
      dy = -VELOCITY_ABS;
    }
    if (key == 's') {
      dy = VELOCITY_ABS;
    }
    if (key == 'a') {
      dx = -VELOCITY_ABS;
    }
    if (key == 'd') {
      dx = VELOCITY_ABS; 
    }
  }
  public void keyReleased() {
    if (key == 'w') {
      dy = 0;
    }
    if (key == 's') {
      dy = 0;
    }
    if (key == 'a') {
      dx = 0;
    }
    if (key == 'd') {
      dx = 0;
    }
  }
}
