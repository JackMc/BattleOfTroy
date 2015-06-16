public abstract class Entity implements Drawable {
  protected float dx, dy;
  protected float x, y;
  private TileManager tileManager;

  public Entity(float x, float y, TileManager tileManager) {
    this.x = x;
    this.y = y;
    this.tileManager = tileManager;
  }

  public Entity(TileManager tileManager) {
    this(0, 0, tileManager);
  }
  
  protected boolean collideX(float x) {
    return x < getWidth() || x > width - getWidth() || tileManager.getTileType(x, y).isCollidable();
  }
  protected boolean collideY(float y) {
    return y < getHeight() || y > height - getHeight() || tileManager.getTileType(x, y).isCollidable();
  }
  
  protected abstract int getWidth();
  protected abstract int getHeight();
  
  public void draw() {
    if (debug) {
      String text = "(" + x + " (" + dx + ")" + ", " + y + " (" + dy + ")" + ")";
      float tWidth = textWidth(text);
      
      text(text, x-tWidth, y-(textAscent() + textDescent() + 1));
    }
  }
  
  public void update() {
    float newX = x + dx;
    float newY = y + dy;
    
    // We use separate functions to allow us to skid on both sides
    if (!collideX(newX)) {
      x = newX;
    }
    
    if (!collideY(newY)) {
      y = newY;
    }
  }
}
