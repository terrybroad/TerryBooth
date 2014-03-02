import processing.video.*;
Capture cam;
Movie vid;
import ddf.minim.*;
Minim minim;
AudioSample music;
PImage[] images;
Grid grid;
UI ui;
int camW, camH, camWs, camHs;
boolean fullVid, gridV, left, right, pressed;

void setup()
{
  camW = 640; //Variables for full width and height captured from / displayed from cam
  camH = 480;
  camWs = floor(camW/2.05); // Variable for width and height of display when in menu mode
  camHs = floor(camH/2.05);
  fullVid = false; //boolean variables for what state the software is in this is fullscreen effect mode
  gridV = true; // this is grid 'menu' mode
  cam = new Capture(this, camW, camH, 25); //call to get webcam image
  cam.start();
  vid = new Movie(this, "rave.mov"); // initialised rave video for backround subtraction effect
  minim = new Minim(this); 
  music = minim.loadSample("camerasound.mp3"); //imports camera sound
  frameRate(25);
  size(floor(camW+32), floor(camH+160), P2D); 
  //this is the global array of the last 80 frames from the webcam, lots of the effects use certain frames and manipulate them
  images = new PImage[80]; 
  for (int i=0; i<images.length; i++)
  {
    images[i]= new PImage(camW, camH);
  }
  grid = new Grid(1); // grid class with paramater calling menu screen 1
  ui = new UI(); // class for doing UI
}

void draw()
{
  background(255);
  webcamArray(); 
  grid.update(); //grid controls all of the calls for displaying the images
  ui.update(); 
}

//Function for controlling the global webcam images array
void webcamArray()
{
  if (cam.available() == true)
  {
    cam.read();
    cam.loadPixels();
  }
  images[0] = null; //each time this function is called the oldest image 'images[0]' is deleted
  
  //and then each image in the array is made to be the one before it
  for (int i = 0; i<images.length-1; i++)
  {
    images[i] = images[i+1];
  }
  //and the newest image 'images[images.length-1] is set to be the current frame from the webcam
  images[images.length-1] = cam.get(0, 0, camW, camH);
}

//This function controls all the kepboard inputs for interaction in the menu screen
void keyReleased()
{
  //this goes from a fullscreen view back to the grid 'menu' view
  if (keyCode == BACKSPACE)
  {
    grid.pf1 = false;
    grid.pf2 = false;
    grid.pf3 = false;
    grid.pf4 = false;
    fullVid = false;
    gridV = true;
  }
  //this switch left and right between the different menu screens
  if (keyCode == LEFT && !fullVid)
  {
    if (grid.screeny > 1)
    {
      grid.screeny--;
    }
    else
    {
      grid.screeny = 5;
    }
  }
  if (keyCode == RIGHT && !fullVid)
  {
    if (grid.screeny < 5)
    {
      grid.screeny++;
    }
    else
    {
      grid.screeny = 1;
    }
  }
}

void mousePressed()
{
  //this boolean prevents the camera pressed function and left and right menu funtions from continously being called as long as the mouse is pressed
  pressed = true;
}

void movieEvent(Movie m) {
  m.read(); // this reads the rave video
}

