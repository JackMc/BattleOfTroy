public class Tile {
  PImage image;
  String tileName;
  int id;
  boolean collidable;
  
  public Tile(int id, String filename, String tileName, boolean collidable) {
    this.id = id;
    this.image = loadImage(filename + ".png");
    this.tileName = tileName;
    this.collidable = collidable;
  }
  
  public PImage getImage() {
    return image;
  }
  
  public boolean isCollidable() {
 //   println(collidable);
   // println(tileName);
    return collidable;
  }
}
