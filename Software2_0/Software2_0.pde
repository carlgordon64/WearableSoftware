 PImage photo;
 
 int texSiz=14;
 float texHeight=height/2-230;
 float expandFinder=0;
  float expandPlayer=0;
   float expandBrowser=0;
   float x=0;
float y=200;
float y2=200;
   float y3=0;
float reversey=0;
float easing = 0.03;
float easing2 = 0.2;
   
   boolean finderON=true;
   boolean playerON=false;
   boolean browserON=false;
   
     float fx,fy,fw,fh;
  float px,py,pw,ph;
  float bx,by,bw,bh;
  
  
   // This array stores the Prefabs
// Integer for stepping through array Prefabs
int arrayCount = 0;
int arrayCount2 = 0;
      String[] hovertoggle = { "null", "null","active", "active", };
   
   
    String hoverState = (hovertoggle[arrayCount2]);
   
   String[] toggleState = { "finder", "player", "browser" };
   int iterate =0;
void setup(){
  size(1280,760);
  photo = loadImage("blur2.jpg");


}
void Update()
{
  
    if (keyPressed == true) {
      if(keyCode == UP){
         y=200;
         y2=200;
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
        if(keyCode == SHIFT){
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


void draw(){
  frameRate(120);
  background(146,211,194);
  image(photo, 0, 0);
   float targetX = 40;
  float dx = targetX - x;
  x += dx * easing;
  float targetY = height*0.9;
  float targetY2 = width*0.9;
  float target3 = width/2;
  float dy = targetY - y;
   float dy2 = targetY2 - y2;
    float dy3 = target3 - y3;
  y += dy * easing2;
   y2 += dy2 * easing2;
    y3 += dy3 * easing;
  
  //ellipse(x, y, 66, 66);
     fx=width/2;
  fy=height/2;
  px=width/2-230;
  py=height/2;
   bx=width/2+230;
  by=height/2;
 //Update();
  //println(toggleState[arrayCount]);
  println(hovertoggle[arrayCount2]);
   hoverState = (hovertoggle[arrayCount2]);
   if(hoverState=="active"){
     println("YES");
     
   }else{
     println("NO");
   }
 String softwareState = (toggleState[arrayCount]);
  if(softwareState=="finder"){
    expandFinder=x;
    expandPlayer=0;
    expandBrowser=0;
    finderON=true;
    playerON=false;
    browserON=false;
  }
   if(softwareState=="player"){
     expandFinder=0;
    expandPlayer=x;
    expandBrowser=0;
    playerON=true;
    browserON=false;
    finderON=false;
  }
   if(softwareState=="browser"){
     expandFinder=0;
    expandPlayer=0;
    expandBrowser=x;
    browserON=true;
    finderON=false;
     playerON=false;
  }
    fw=200+expandFinder;
  fh=200+expandFinder;
    pw=200+expandPlayer;
  ph=200+expandPlayer;
   bw=200+expandBrowser;
  bh=200+expandBrowser;
  
   if(hoverState == "active"){
        //finder is selected
      if(finderON==true){
        fx=width/2;
        fy=height/2;
         fw=y2;
        fh=y;
        
      }
          //player is selected
      if(playerON==true){
         px=width/2;
        py=height/2;
         pw=y2;
        ph=y;
        
      }
          //finder is selected
      if(browserON==true){
        //put the width on an ease
         bx=width/2+230;
        by=height/2;
        bw=y2;
        bh=y;
        browserdata();
        
      }
}
 carousel_indicator();
  Update();
  fill(255);
  rectMode(CENTER);
 
  textSize(texSiz);
  stroke(255);
  //

 
  
  
  //listner events for handling user interaction
  //println(mouseX, mouseY);
  //player hover
  if(mouseX>=310&&mouseX<=510){
     if(mouseY>=283&&mouseY<=483){
   println("User Hover Player"); 
   //hover player box animation
   px=width/2-230;
  py=height/2-20;
  expandPlayer=30;
  //playerON=true;
  //finderON=false;
  }
  }else{
    expandPlayer=0; 
    // playerON=false;
     
  }
    //finder hover
  if(mouseX>=540&&mouseX<=740){
     if(mouseY>=283&&mouseY<=483){
   println("User Hover Finder"); 
   //hover finder box animation
   fx=width/2;
  fy=height/2-20;
  //finderON=true;
  expandFinder=30;
  }
  }else{
    expandFinder=0; 
    //finderON=false;
  }
  
     //browser hover
  if(mouseX>=770&&mouseX<=970){
     if(mouseY>=283&&mouseY<=483){
   println("User Hover Browser"); 
   //hover browser box animation
   bx=width/2+230;
  by=height/2-20;
  expandBrowser=30;
  // browserON=true;
   //finderON=false;
  }
  }else{
    expandBrowser=0; 
   // browserON=false;
  }
  
  //
  //Finder
  finder(fx,fy,fw,fh);
  //Player
   player(px,py,pw,ph);
   //Browser
   browser(bx,by,bw,bh);
   //
   finderdata();
    playerdata();
  browserdata();
 
}
void carousel_indicator(){
  strokeWeight(2);
  stroke(255);
  
   noFill();
      //shape
   //l
  ellipse(width/2-20,height/2+200,40,40);
  //r
  ellipse(width/2+20,height/2+200,40,40);
  fill(163,182,196);
  noStroke();
   ellipse(width/2,height/2+200,50,50);
   strokeWeight(2);
  stroke(255);
   //connectors
   line(623,560,655,560);
    line(623,600,655,600);
fill(255);
//indicator
float push=0;
if(finderON==true){
//center
push=50;
  //ellipse(width/2+push,height/2+200,20,20);
}


if(playerON==true){
   //left
   push=0;
 //  ellipse(width/2+push,height/2+200,20,20);
   
}
if(browserON==true){
   //right
    push=100;
  //ellipse(width/2+push,height/2+200,20,20);
 
}
float push2=lerp(-20,20,push/100);
ellipse(width/2+push2,height/2+200,20,20);
}

void player(float x,float y,float w, float h){
    //Player
    //center
  text("Player",(width/2-230)-(texSiz/2*3),height/2-230);
   rect(x,y,w,h);
   //
  
}
void finder(float x,float y,float w, float h){
    //Finder
  //center
  text("Finder",(width/2)-(texSiz/2*3.5),height/2-230);
  rect(x,y,w,h);
  //
  
}
void browser(float x,float y,float w, float h){
   //Browser
     //center
   text("Browser",(width/2+230)-(texSiz/2*3.5),height/2-230);
    rect(x,y,w,h);
  
}
void finderdata(){
if(finderON==true){
  if(hoverState=="active"){
  //put the width on an ease
         fx=width/2;
        fy=height/2;
        fw=y2;
        fh=y;
        fill(0,100,0,50);
 rect(fx,fy,fw,fh);
        
  }
   }
}
void playerdata(){
if(playerON==true){
  if(hoverState=="active"){
  //put the width on an ease
         px=width/2;
        py=height/2;
        pw=y2;
        ph=y;
        fill(0,0,100,50);
 rect(px,py,pw,ph);
        
  }
   }
}
void browserdata(){
if(browserON==true){
  if(hoverState=="active"){
  //put the width on an ease
         bx=width/2;
        by=height/2;
        bw=y2;
        bh=y;
        fill(0,0,0,50);
 rect(bx,by,bw,bh);
        
  }
   }
}