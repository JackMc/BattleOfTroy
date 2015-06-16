private ArrayList<Tile> tilesById = new ArrayList<Tile>();

public void loadTiles() {
    String[] strings = loadStrings("tiles.txt");
    int numTiles = strings.length;
    
    for (int i = 0; i < numTiles; i++) {
      String[] split = split(strings[i], ',');
      // The format is image,name. Id is determined by position in the file.
      tilesById.add(new Tile(i, split[0], split[1], split[2].equals("1") ? true : false));
    }
}

public class TileManager implements Drawable {
  
  private ArrayList<ArrayList<Integer>> tiles = new ArrayList<ArrayList<Integer>>();
  private final int TILE_DIMENSION = 32;

  public TileManager(String sceneName) {
    String[] strings = loadStrings(sceneName + ".txt");
    
    for (String s : strings) {
      ArrayList<Integer> innerTiles = new ArrayList<Integer>();
      for (String s2 : split(s, ",")) {
        innerTiles.add(Integer.parseInt(s2));
      }
      tiles.add(innerTiles);
    }
  }

  public void draw() {
    int x = 0, y = 0;
    for (int i = 0; i < tiles.size(); i++) {
      ArrayList<Integer> current = tiles.get(i);
      for (int j = 0; j < current.size(); j ++) {
        Integer index = current.get(j);
        Tile t = tilesById.get(index); 
        
        image(t.getImage(), x, y);
        
        x += TILE_DIMENSION;
      }
      
      x = 0;
      y += TILE_DIMENSION;
    }
  }
  
  public void update() {}
  
  private Tile getTileType(float x, float y){
    int xIndex = (int) x / TILE_DIMENSION;
    int yIndex = (int) y / TILE_DIMENSION;
    return tilesById.get(tiles.get(yIndex).get(xIndex)); 
  }
}
