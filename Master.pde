class Master
{
  //THE MASTER CLASS HAS ALL THE FUNCTIONS AND VARIABLES WHICH ARE UNIVERSAL TO EVERY EFFECT
  //ALL OF THE EFFECTS INHERIT FROM THIS CLASS
  //THIS MADE IT NEATER TO JUST HAVE ALL THE MAIN VARIABLES IN HERE
  //AND FOR CALLING ALL THE EFFECTS

  int X, Y, W, H, Ar, fX, fY, fW, fH, pX, pY, pW, pH;
  PImage img, img1, img2, img3, img4, img5, background, profile;
  float theta;
  boolean imageCap, fullScr, backgroundSet;

  Master(int _X, int _Y, int _W, int _H, int _Ar, PImage _B, boolean _fullScr)
  {
    X = _X; //current origin of image on X axis
    Y = _Y; //current origin of image on Y axis
    W = _W; //current Width
    H = _H; //current Height
    Ar = _Ar; //int variable used for knowing how many images from the array want to be used for an effect
    background = _B; //background image for effect screens, (and kaleidoscope in menu screen)
    fullScr = _fullScr; //variable for telling the effect it is in fullscreen mode
    fX = 16; //origin of x axis in fullscreen mode
    fY = 12; //origin of Y axis in fullscreen mode
    fW = camW; //width in fullscreen mode
    fH = camH; // height in fullscreen mode
    pX = X; //origin of x axis in menu mode
    pY = Y; //origin of y axis in menu mode
    pW = W; //width in fullscreen mode
    pH = H; //origin of Y axis in fullscreen mode
    img = new PImage(camW, camH, ARGB); //these are just generic PImages which get used differently by different effects
    img1 = new PImage(camW, camH, ARGB);
    imageCap = false; //boolean variable for when the background has been set
    profile = loadImage("profile.png"); //image of silhouette of head used in background subtract menu screens
    theta = 0; 
    backgroundSet = false;
  }

  void update()
  {
    tint(255, 255, 255, 255); //just to ensure that the tint from another function doesnt make this transparent, this is in all classes
    image(images[images.length-1], X, Y, W, H); //just displays the most recent image from the webcam array
  }

  void fullScreen()
  {
    //this function is sets the X,Y,width and height to what it should be in fullscreen mode
    X = fX;
    Y = fY;
    W = fW;
    H = fH;
    gridV = false;
    fullScr = true;
  }

  void smallScreen()
  {
    //this function is sets the X,Y,width and height to what it should be in grid 'menu' mode
    X = pX;
    Y = pY;
    W = pW;
    H = pH;
    gridV = true;
    fullScr = false;
    vid.stop();
    backgroundSet = false;
  }
}

