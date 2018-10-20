class Map {
    static final int mapHeight = 4;
    int mapSizeX, mapSizeY;
    Block[][][] map;

    Map(int mapSizeX, int mapSizeY) {
        initiateMap();        
        println("the size of this map in pixels is: " + Block.BLOCK_SIZE * mapSizeX + ", " + Block.BLOCK_SIZE * mapSizeY); //Better delete this crap.
    }

    Map(int mapSizeX, int mapSizeY, String mapFile) {
        loadMap(mapFile);
        println("the size of this map in pixels is: " + Block.BLOCK_SIZE * mapSizeX + ", " + Block.BLOCK_SIZE * mapSizeY); //Better delete this crap.
    }

    Map(String mapFile) {
        loadMap(mapFile);
    }

    void initiateMap() { //TODO
        map = new Block[mapSizeX][mapSizeY][mapHeight];
    }

    void loadMap(String mapFile) {
        String[] temp = loadStrings(mapFile+".txt");
        int mapSizeX = temp[0], mapSizeY = temp[1];
        map = new Block[mapSizeX][mapSizeY][mapHeight];
        for (int i = 0; i < mapSizeX; i++)
            for (int j = 0; j < mapSizeY; j++)
                for (int k  = 0; k < mapHeight; k++) {
                    String dataString = temp[i * mapSizeX + j * mapSizeY + k];
                    String textData = split(dataString, ",");
                    map[i][j][k] = new Block(int(textData[0]), int(textData[1]), int(textData[2]));
                }
    }

    void displayMap() {
        pushMatrix();
        rotate(PI/4);
        for (int i = 0; i < map.length; i++) {
            for (int j = 0; j < map[i].length; j++) {
                for (int k = 0; k < map[i][j].length; k++) {
                    map[i][j][k].display();
                }
            }
        }
        popMatrix();
    }
}

}
