/*
MDDN 351 - Wearable Tech
 Avail - Operating System
 Written by: Carl Gordon - 12/10/16 
 */

PImage photo;
PImage playericos;
//SYSTEM DIRECTORY
int counter;
//this sketch path
String workingDIR = sketchPath("");
//System path
String path = "/Users/macuser/Desktop/NavTest";
String Finderpath = "/Users/macuser/Desktop/NavTest/Finder";
String Appspath = "/Users/macuser/Desktop/NavTest/Finder/Applications";
String Docspath = "/Users/macuser/Desktop/NavTest/Finder/Documents";
String Browserpath = "/Users/macuser/Desktop/NavTest/Browser/browsers";
String Bookmarkspath = "/Users/macuser/Desktop/NavTest/Browser/bookmarks";
String Playerpath = "/Users/macuser/Desktop/NavTest/Player";
String Musicpath = "/Users/macuser/Desktop/NavTest/Player/Music";
String Videopath = "/Users/macuser/Desktop/NavTest/Player/Video";
//
//colors
PFont font;
PFont font2;
color lightgrey = (#f1f3f2);
color mediumgrey = (#e0e0e0);
color darkgrey = (#383838);
color indicate = (mediumgrey);
int c = 255;
boolean colorDown = false;

float selector = 0;
int texSiz=16;
float texHeight=height/2+160;
float expandFinder=0;
float expandPlayer=0;
float expandBrowser=0;
float x=0;
//easing

//
PFont H2;

//y= height of app teaser hover expansion
float y=200;
//y2 = width of app teaser hover expansion
float y2=300;

float y3=0;
float y4=0;
float reversey=0;
float easing = 0.2;
float easing2 = 0.3;

boolean finderON=true;
boolean playerON=false;
boolean browserON=false;

float fx, fy, fw, fh;
float px, py, pw, ph;
float bx, by, bw, bh;

int s = second(); 
int m = minute(); 

int h = hour(); 
String ampm;

float colPush= 255;

// This array stores the Prefabs
// Integer for stepping through array Prefabs
int arrayCount = 0;
int arrayCount2 = 0;
String[] hovertoggle = { "null", "null", "active", "active", };


String hoverState = (hovertoggle[arrayCount2]);

String[] toggleState = { "finder", "player", "browser" };
int iterate =0;

int FR= 60;

void setup() {
  size(1280, 760);
  H2 = loadFont("Helvetica-24.vlw");
  photo = loadImage("blur2.jpg");
  playericos = loadImage("Player_Ico.png");
}
void Update()
{

  if (keyPressed == true) {
    if (keyCode == UP) {
      y=200;
      y2=200;
      colPush= 0;
      //slows down the loop to crete a toggle effect on key event
      frameRate(10);
      // Step to next position in array
      arrayCount2++;
      // If Array count excedes Array index then go back to first position in array
      if (arrayCount2 >= 4)
      {
        arrayCount2 = 0;
      }
      //println("Array count= "+arrayCount);
    }
    if (keyCode == SHIFT) {
      selector=0;
      colPush= 0;
      colorDown = false;
      c=255;
      x=0;
      y2=0;
      //slows down the loop to crete a toggle effect on key event
      frameRate(10);
      // Step to next position in array
      arrayCount++;
      // If Array count excedes Array index then go back to first position in array
      if (arrayCount >= 3)
      {
        arrayCount = 0;
      }
      //println("Array count= "+arrayCount);
    }
  }
}


void draw() {
  frameRate(FR);
  smooth();
  background(#f1f2f3);
  //background(#00BBD6);
  //image(photo, 0, 0);
  
 float targetX = 40;
  float targetFocusHeight = height;
  float targetFocusWidth = width;
  float dx = targetX - x;
  x += dx * easing;
  float targetY = height*0.9;
  float targetY2 = width*0.9;
  float target3 = width/2;
  float dy = targetY - y;
  float dy2 = targetY2 - y2;
  float dy3 = target3 - y3;

  float fullscreenW = targetY2 - y2;
  y += dy * easing2;
  y2 += dy2 * easing2;
  y3 += dy3 * easing;
  //if set to y4 shape will fill screen width
  y4 += fullscreenW *easing;

  //vars to control placement of app teasers
  fx=width/2;
  fy=height/2;
  px=width/2-325;
  py=height/2;
  bx=width/2+325;
  by=height/2;
  //Update();
  //println(toggleState[arrayCount]);
  //println(hovertoggle[arrayCount2]);
  hoverState = (hovertoggle[arrayCount2]);

  //array that helps toggle through the possible software states
  String softwareState = (toggleState[arrayCount]);
  if (softwareState=="finder") {
    expandFinder=x;
    expandPlayer=0;
    expandBrowser=0;
    finderON=true;
    playerON=false;
    browserON=false;
  }
  if (softwareState=="player") {
    expandFinder=0;
    expandPlayer=x;
    expandBrowser=0;
    playerON=true;
    browserON=false;
    finderON=false;
  }
  if (softwareState=="browser") {
    expandFinder=0;
    expandPlayer=0;
    expandBrowser=x;
    browserON=true;
    finderON=false;
    playerON=false;
  }

//both width and height of app teasers are expanded by expand<TYPE>

  fh=200+expandFinder;
  fw=300+expandFinder;

  ph=200+expandPlayer;
  pw=300+expandPlayer;

  bh=200+expandBrowser;
  bw=300+expandBrowser;

  if (hoverState == "active") {
    //finder is selected
    if (finderON==true) {
      fx=width/2;
      fy=height/2;
      fw=y2+130;
      fh=y+80;
    }
    //player is selected
    if (playerON==true) {
      px=width/2;
      py=height/2;
      pw=y2+130;
      ph=y+80;
    }
    //finder is selected
    if (browserON==true) {
      //put the width on an ease
      bx=width/2;
      by=height/2;
      bw=y2+130;
      bh=y+80;
    }
  }
  carousel_indicator2();
  Update();
  fill(mediumgrey);
  rectMode(CENTER);
  textSize(texSiz);
  noStroke();
  //
  //listner events for handling user interaction
  //println(mouseX, mouseY);

  //TAB IN TOP-RIGHT CORNER .. STATUS DISPLAY
  statusTab(width/2+100, 30);
  //

  //Finder
  finder(fx, fy, fw, fh);
  //Player
  player(px, py, pw, ph);
  //Browser
  browser(bx, by, bw, bh);
  //
  finderdata();
  playerdata();
  browserdata();

  //save frame for preview.mov
  //saveFrame("frame-######.png");
}

//status text
void statusTab(int x, int y) {
  boolean GStatus = true;
  boolean GInput = false;

  if (mouseX>= 680 && mouseX<= width) {
    if (mouseY<= 50 && mouseY>= 0) {
      fill(255, 255, 255, 200);
      rect(width-300, 0, 600, 100);
    }
  }

  //println(mouseX,mouseY);

  fill(darkgrey);
  font = loadFont("Inconsolata-Regular-16.vlw");
  textFont(font, 16);
  String Opad ="";
  //status indicator
  text("Garment Status:", x, y);
  //input indicator
  text("Garment Input:", x+200, y);
  //time
  if (h>11) {
    h=h-12;
    ampm="am";
  } else {
    ampm="pm";
  }
  if (m<=9) {
    Opad = "0";
  } else {
    Opad = "";
  }

  text( h+":"+Opad+m+" "+ampm, width-80, y);

  //indicator conditionals
  if (GStatus == true) {
    fill(0, 255, 0, 200);
    ellipse(x+130, y-5, 10, 10);
  } else {
    fill(225, 0, 0, 200);
    ellipse(x+130, y-5, 10, 10);
  }
  //
  if (GInput == true) {
    fill(0, 255, 0, 200);
    ellipse(x+330, y-5, 10, 10);
  } else {
    fill(225, 0, 0, 200);
    ellipse(x+330, y-5, 10, 10);
  }
}

//second carousel indicator design
void carousel_indicator2() {
  selector=0;
  strokeWeight(2);
  noStroke();
  //container for carousel indicator 
  //rect(width/2,height/2+260,200,60);
  //
  fill(darkgrey);
  font2 = loadFont("Helvetica-16.vlw");
  textFont(font2, 16);
  text("PLAYER", (width/2-325)-(texSiz/2*3), height/2+150);
  text("FINDER", (width/2)-(texSiz/2*3.5), height/2+150);
  text("BROWSER", (width/2+325)-(texSiz/2*3.5), height/2+150);

  //placeholders
  fill(mediumgrey);
  rect(width/2, height/2+200, 60, 10);
  rect(width/2-100, height/2+200, 60, 10);
  rect(width/2+100, height/2+200, 60, 10);

  if (finderON==true) {
    colorDown = true;
    //if color down is true and c is greater than 0
    //start subtracting color
    if (colorDown && c > 80) c-=15;
    //else if color down is false and c is less than 255
    //start adding color
    else if (colorDown==false && c < 255) c+=5;
    fill(c, c, c);
    rect(width/2, height/2+200, 60, 10);
  }
  if (playerON==true) {
    colorDown = true;
    //if color down is true and c is greater than 0
    //start subtracting color
    if (colorDown && c > 80) c-=15;
    //else if color down is false and c is less than 255
    //start adding color
    else if (colorDown==false && c < 255) c+=5;
    fill(c, c, c);
    rect(width/2-100, height/2+200, 60, 10);
  }
  if (browserON==true) {
    colorDown = true;
    //if color down is true and c is greater than 0
    //start subtracting color
    if (colorDown && c > 80) c-=15;
    //else if color down is false and c is less than 255
    //start adding color
    else if (colorDown==false && c < 255) c+=5;
    fill(c, c, c);
    rect(width/2+100, height/2+200, 60, 10);
  }
}


//call all boxes
void player(float x, float y, float w, float h) {
  noStroke();
  //Player
  //center
  if (playerON==true) {
    stroke(0, 0, 0, 10);
  } else {
    noStroke();
  }
  fill(mediumgrey);
  rect(x, y, w, h);

  //
}
void finder(float x, float y, float w, float h) {
  noStroke();
  //Finder
  //center
  if (finderON==true) {
    stroke(0, 0, 0, 10);
  } else {
    noStroke();
  }
  fill(mediumgrey);
  rect(x, y, w, h);
}
void browser(float x, float y, float w, float h) {
  noStroke();
  //Browser
  //center
  if (browserON==true) {
    stroke(0, 0, 0, 10);
  } else {
    noStroke();
  }
  fill(mediumgrey);
  rect(x, y, w, h);
}
void finderdata() {
  if (finderON==true) {
    if (hoverState=="active") {
      //put the width on an ease
      fx=width/2;
      fy=height/2;
      //
      fw=y2;
      fh=y;
      fill(0, 100, 0, 50);
      rect(fx, fy, fw, fh);
      finderContent();
    }
  }
}
void playerdata() {
  if (playerON==true) {
    if (hoverState=="active") {

      //VOLUME CONTROLS
      if (keyPressed==true) {
        if (keyCode == RIGHT) {
          //launches max volume app from working directory
          launch(workingDIR+"./MaxVolume.app");
        } else if (keyCode == LEFT) {
          //launches mute app from working directory
          launch(workingDIR+"./LowVolume.app");
        } else if (keyCode == DOWN) {
          launch(workingDIR+"./Spot_PausePlay.app");
        }
      }
      //END VOLUME CONTROLS

      //put the width on an ease
      //this is the coloured player box
      px=width/2;
      py=height/2;
      //
      pw=y2;
      ph=y;
      fill(0, 0, 100, 50);
      rect(px, py, pw, ph);

      playerContent();
    }
  }
}
void browserdata() {
  if (browserON==true) {
    if (hoverState=="active") {
      //put the width on an ease
      //this is the coloured area box
      bx=width/2;
      by=height/2;
      //
      bw=y2;
      bh=y;
      fill(0, 0, 0, 50);
      rect(bx, by, bw, bh);

      browserContent();
    }
  }
}
void playerContent() {
  //colPush fades in content
  colPush+=8;
  println(colPush);
  fill(255, 255, 255, colPush);
  pushMatrix();
  textFont(H2, 24);
  text("Player", width/2-6*7, 100);
  noFill();
  stroke(255, 255, 255, colPush);
  rect(width/2, height/2, 848, 506);
  rect(width/2, height/2, 848, 60);
  tint(255, colPush);
  imageMode(CENTER);
  image(playericos, width/2, height/2);
  popMatrix();
}
//
void finderContent() {
  //colPush fades in content
  colPush+=8;
  println(colPush);
  fill(255, 255, 255, colPush);
  pushMatrix();
  textFont(H2, 24);
  text("Finder", width/2-6*7, 100);
  text("Applications", width/2-212-(12*7), 200);
  String[] appnames = listFileNames(Appspath);
  //println(filenames);
  for (int o = 1; o <appnames.length; o++) {
    text(appnames[o], 227, 250+o*30);
  }
  text("Documents", width/2+212-(9*7), 200);
  //SHOW ALL DOCUMENTS IN documents
  String[] docnames = listFileNames(Docspath);
  //println(filenames);
  for (int o = 1; o <docnames.length; o++) {
    text(docnames[o], width/2+10, 250+o*30);
  }
  noFill();
  stroke(255, 255, 255, colPush);
  rect(width/2, height/2, 848, 506);
  rect(width/2-212, height/2, 424, 506);
  popMatrix();
}
void browserContent() {
  //colPush fades in content
  colPush+=8;
  println(colPush);
  fill(255, 255, 255, colPush);
  pushMatrix();
  textFont(H2, 24);
  text("Browser", width/2-6*7, 100);

  //Path to all installed browsers
  String[] browsernames = listFileNames(Browserpath);
  //print all installed browsers
  //println(browsernames);
  for (int i2 = 1; i2 < browsernames.length; i2++) {
    text(browsernames[i2], width/2, height/2+i2*60);
  }

  noFill();
  stroke(255, 255, 255, colPush);
  rect(width/2, height/2, 100, 100);
  popMatrix();
}
//FILE HANDLERS

// This function returns all the files in a directory as an array of Strings  
String[] listFileNames(String dir) {
  File file = new File(dir);
  if (file.isDirectory()) {
    String names[] = file.list();
    return names;
  } else {
    // If it's not a directory
    return null;
  }
}

// This function returns all the files in a directory as an array of File objects
// This is useful if you want more info about the file
File[] listFiles(String dir) {
  File file = new File(dir);
  if (file.isDirectory()) {
    File[] files = file.listFiles();
    return files;
  } else {
    // If it's not a directory
    return null;
  }
}

// Function to get a list of all files in a directory and all subdirectories
ArrayList<File> listFilesRecursive(String dir) {

  ArrayList<File> fileList = new ArrayList<File>(); 
  recurseDir(fileList, dir);
  return fileList;
}

// Recursive function to traverse subdirectories
void recurseDir(ArrayList<File> a, String dir) {

  File file = new File(dir);
  if (file.isDirectory()) {
    // If you want to include directories in the list
    a.add(file);  
    File[] subfiles = file.listFiles();
    for (int i = 0; i < subfiles.length; i++) {
      // Call this function on all files in this directory
      counter ++;
      recurseDir(a, subfiles[i].getAbsolutePath());
    }
  } else {
    a.add(file);
  }
}