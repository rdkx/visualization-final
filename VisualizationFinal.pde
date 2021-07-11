// Declare variable for dataset
Table dataset;
String[] dataSelect = {"2020.csv", "2021.csv"};
String[] regionSelect = {"Western Europe", "South Asia", "Middle East and North Africa", "North America and ANZ", "Latin America and Caribbean", "Sub-Saharan Africa"};

// Declare object world map
PShape worldMapObj;

int i = 0;
int data = 0;

// Initializing default display
void setup(){
  size(1440, 900);
  background(255);
  worldMapObj = loadShape("world.svg");
  instruction();
  stroke(255);

}

// To allow interaction 
void draw(){
  //shape(worldMap, 0, 200, 1280, 540);   
}

// Add interaction
void keyPressed(){
  if(key == '1'){
    clear();
    setup();
    fill(255);
    rect(0, 0, width, height);
    data = 1;
    worldMap(worldMapObj, data);
  }
  
  if(key == '2'){
    clear();
    setup();
    fill(255);
    rect(0, 0, width, height);
    textSize(10);
    i = 1;
    data = 1;
    ladderScore(i, data);
  }
  
  if(key == '3'){
    clear();
    setup();
    fill(255);
    rect(0, 0, width, height);
    textSize(10);
    i = 2;
    data = 0;
    ladderScore(i, data);
  }
  
  if(key == '4'){
    clear();
    setup();
    fill(255);
    rect(0, 0, width, height);
    textSize(10);
    i = 3;
    data = 1;
    ladderScore(i, data);
  }
  
  if(key == '5'){
    clear();
    setup();
    fill(255);
    rect(0, 0, width, height);
    textSize(10);
    i = 4;
    data = 0;
    ladderScore(i, data);
  }
  
  if(key == '6'){
    clear();
    setup();
    fill(255);
    rect(0, 0, width, height);
    textSize(10);
    i = 5;
    data = 1;
    ladderScore(i, data);
  }
}

// For displaying the ladder score
void ladderScore(int i, int data){
  // Load dataset
  dataset = loadTable(dataSelect[data], "header");
  
  // Displaying line and label
  graphLine(); 
  
  // Create indicator for circle and country label
  int xIndicator = 150;
  
  // Iterate dataset
  for(TableRow row: dataset.rows()){   
    String country = row.getString("Country name");
    String region = row.getString("Regional indicator");
    float level = row.getFloat("Ladder score");
    
    if(region.contains(regionSelect[i])){
      // Print to console
      println(country + " " + region + " " + level);
      
      // Display circle indicator
      fill(255);
      strokeWeight(1);
      stroke(0);
      circle(xIndicator + 30, height - 50, 6);
      
      // Display country indicator
      fill(0);
      textSize(7);
      text(country, xIndicator + 17, height - 30); 
     
      // Iterate indicator
      xIndicator = xIndicator + 55;
      
      // Display bar graph
      stroke(15, 255, 183);
      strokeWeight(25);
      line(xIndicator - 25, height - 62, xIndicator - 25, height - (level * 75));
      text(level, xIndicator - 38, height - (level * 75) - 20);
    }  
  }  
  stroke(255);
  strokeWeight(0);
}

// Class for displaying line and label 
void graphLine(){
  fill(0);
  strokeWeight(1);
  stroke(0);
  line(150, height - 50, width - 120, height - 50);
  line(150, 50, 150, height - 50);
  text("Countries", width - 110, height - 45);
  text("Happiness Level", 112, 30);
  line(150, 50, 160, 60);
  line(150, 50, 140, 60);
  line(width - 120, height - 50, width - 130, height - 60);
  line(width - 120, height - 50, width - 130, height - 40);
}


// Add instructions
void instruction(){
  fill(0);
  textSize(20);
  text("Press 1 to show data happiness level from Western Europe (2020)", 120, 300);
  text("Press 2 to show data happiness level from South Asia (2021)", 120, 340);
  text("Press 3 to show data happiness level from Middle East and North Africa (2020)", 120, 380);
  text("Press 4 to show data happiness level from North America and ANZ (2021)", 120, 420);
  text("Press 5 to show data happiness level from Latin America and Caribbean (2020)", 120, 460);
  text("Press 5 to show data happiness level from Sub-Saharan Africa (2021)", 120, 500);
}

// Show world map
void worldMap(PShape worldMapObj, int data){
  background(100);
  shape(worldMapObj, 50, 200, 1440, 540);
  
  // Load dataset
  dataset = loadTable(dataSelect[data], "header");
  
  // Iterate dataset
  for(TableRow row: dataset.rows()){  
    
    float latitude = row.getFloat("Latitude");
    float longitude = row.getFloat("Longitude");
    
    // Print latitude and longitude
    println(latitude + " " + longitude + " ");
    
    float xMap = (longitude*1280)/360;
    float yMap = (latitude*540)/180;
    
    fill(0);
    circle(xMap, height - yMap, 5);

  }
}
