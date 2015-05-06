import processing.serial.*;
import ddf.minim.*;
import ddf.minim.effects.*;

Serial _port;
int buttonValue = 0;
int lastbutton = 0;

//<------Static States------>
PImage bg;
PImage Dolphin;

//<-----Jump Pose----->
PImage P1;


//<-----Place Holders---->
PImage place;
PImage DolphinP;

//<-----


void setup() {
  size(1149, 858);
  frameRate(10);
  //Background
  bg = loadImage ("Ocean.jpg");
  //Dolphin
  
  Pink=loadImage ("dolphin1.png");

  //Jump
  P1=loadImage ("dophin2.png");

  place = bg;
  DolphinP = Pink;


  

  _port = new Serial(this, "/dev/tty.usbmodem1451", 9600);
  _port.bufferUntil('\n');
}
void serialEvent(Serial p) {
  try {
    String str = p.readStringUntil('\n');

    String[] tokens = splitTokens(str, " \r\n\t,");
    //splitTokens(s, " "); //we didn't do this
    if (tokens.length >= 1) {

      buttonValue = (Integer.parseInt(tokens[0])); 
      //<-----Calling Audio----->
      if ( buttonValue!=lastbutton) {
        if ( buttonValue == 1) w.trigger();

        if ( buttonValue == 2) s.trigger();
        if ( buttonValue == 3) d.trigger();
        if ( buttonValue == 4) a.trigger();
        //<----Calling Images---->
        if (buttonValue == 1) {  //curly brace! no semicolon.
          DolphinP = P1;
        }

      
        if (buttonValue == 0) {
          keyReleased();  //stop the sounds
          //<-----reset the bear----->
          DolphinP = Pink;    
         
        }

        lastbutton=buttonValue;
      }

      println(buttonValue);
    } //test sensor
  }
  catch (Exception ex) {
    println(ex.getMessage());
  }
}  //close out our function
void draw() {
  background (0);
  imageMode(CENTER);
  image(place, width/2, height/2);
  image(DolphinP, width/2, height/2);
  

  //<--->
}


