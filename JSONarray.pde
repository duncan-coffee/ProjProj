JSONArray json;

int x = 50; 
int y = 50; 

int myDesiredPositionX; 
int myDesiredPositionY; 

void setup() {
  size(720, 640);
  printInit(); 
  json = loadJSONArray("data.json");
  fill(255); 
  
}

void draw(){
  background(102); 
   
  JSONArray values = json.getJSONArray(0);
  
  for (int i = 0; i < values.size(); i++) {
    
    JSONObject item = values.getJSONObject(i); 

    String name = item.getString("name");
    String city = item.getString("city");
    String position = item.getString("position"); 
    String number = item.getString("number"); 
    
    text(name, 600, i*140+40);
    text(city, 600, i*140+70);
    text(position, 600, i*140+100);
    
    PImage img = loadImage(number + ".jpeg"); 
    image(img, 500, i*140+20); 
    if(i == 3){
      myDesiredPositionX = 500; 
      myDesiredPositionY = i*140+20; 
    }
  }
  
  PImage myImage = loadImage("data/willie2.jpeg"); 
  image(myImage, x-70,y-40,100,100); 
  text("Willie", x+40, y-20);
  text("Austin", x+40, y+10);
  text("Developer", x+40, y+40);

  
  if (needToMatch == true){
    move(); 
  } else {   
      text("It's a match!", 100, 100); 
    }

}

int value = 0; 

void keyPressed(){
  if (key == ' '){
   move(); 
  }
}

boolean needToMatch = true; 

void move(){
  if(x < myDesiredPositionX-160){
    x++; 
   } else {x--; 
      }
    
  if(y < myDesiredPositionY-100){
    y++; 
  } else {y--; 
    } 
    
  if((x == myDesiredPositionX-160) && (y == myDesiredPositionY-100)){
    needToMatch = false; 
   
  }
}