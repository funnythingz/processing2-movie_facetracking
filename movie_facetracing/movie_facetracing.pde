/**
* movie facetracking
* @Processing2.0b7
*/
import hypermedia.video.*;
import java.awt.Rectangle;

OpenCV opencv;

//propaty
int w = 400;
int h = 240;

PImage mask;

void setup(){
  size(w, h);
  opencv = new OpenCV(this);
  opencv.movie("sample.mp4", w, h);
  opencv.cascade(OpenCV.CASCADE_FRONTALFACE_ALT);
  mask = loadImage("blue.png");
}
void draw(){
  frameRate(30);
 
  opencv.read();
  Rectangle[] faces = opencv.detect(1.2, 2, OpenCV.HAAR_DO_CANNY_PRUNING, 5, 5);
  image(opencv.image(), 0, 0);
  for(int i = 0; i < faces.length; i++){
    switch(i){
      //red
      case 0:
        image(mask, faces[0].x, faces[0].y, faces[0].width, faces[0].height + (faces[0].height/8));
        break;
    }
  }
}
