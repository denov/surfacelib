import processing.opengl.*;

import surface.*;

PQTorus s;
Slider[] sliders;

void setup(){
  size(600,600,OPENGL);
  textFont(loadFont("dialog.vlw"));
  s=new PQTorus(g, 20, 20);
 
  sliders=new Slider[5];
  sliders[0]=new Slider(20,50,100,10,20,4,55, "vertical Resolution");//Slider of vertical Resolution
  sliders[1]=new Slider(20,90,100,10,20,4,55, "horizontal Resolution");//Slider of horizontal Resolution
  
  sliders[2]=new Slider(20,140,100,10,20,0,10, "p");
  sliders[3]=new Slider(20,180,100,10,20,0,10, "q");
  sliders[4]=new Slider(20,220,100,10,20,0,10, "radius");
  
}


void draw(){
   background(255);
  
  lights();
  boolean moved=false;
  for(int i=0;i<sliders.length;i++){
    fill(200);
    stroke(100);
    sliders[i].update();
    sliders[i].draw();
    if(sliders[i].moved)moved=true;
  }
  if(moved){
    int vResolution=floor(sliders[0].getPos());
    int hResolution=floor(sliders[1].getPos());
    
    float p=(sliders[2].getPos());
    float q=(sliders[3].getPos());
    float radius=(sliders[4].getPos());

    s=new PQTorus(g, vResolution, hResolution, p,q,radius);
  }
  
  translate(400,250);
 
  noStroke();
  fill(#A6D3EA);
  rotateX(radians(frameCount));
  rotateY(radians(frameCount));
  rotateZ(radians(frameCount));
   s.setScale(mouseX);
  s.draw();
}
