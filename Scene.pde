public class Scene {
  private ArrayList<Drawable> drawables = new ArrayList<Drawable>();
  // This will also be the filename of the associated scene data in the data/ folder (appended with a .txt)
  private String name;
  private MainCharacter character;
  private TileManager tileManager;
  
  public Scene(String name) {
    this.name = name;
    drawables.add(tileManager = new TileManager(name));
    drawables.add(character = new MainCharacter(tileManager));
  }
  
  public Scene draw() {
    for (Drawable d : drawables) {
      d.update();
      d.draw();
    }

    return this;
  }
  
  public void keyPressed() {
    character.keyPressed();
  }
  
  public void keyReleased() {
    character.keyReleased();
  }
}
