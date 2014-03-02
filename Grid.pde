class Grid
{
  //THE GRID CLASS IS BASICALLY THE MENU CLASS
  //AND THE CLASS USED FOR INITIALISING AND DISPLAYING ALL THE WEBCAM EFFECTS
  //I CHOSE TO DO IT LIKE THIS SO THAT ONLY A MAXIMUM OF 4 EFFECTS ARE BEING PROCESSED AT ONE TIME
  //PERHAPS THE NAME GRID IS A BIT MISLEADING, I CHOSE THE NAME BECAUSE IT WAS INITIALY MADE TO DISPLAY EFFECTS ALL THE THE SAME TIME IN A GRID

  Master s1, s2, s3, s4, s5, s6, s7, s8, s9, s10, s11, s12, s13, s14, s15, s16, s17, s18, s19, s20;
  int screeny;
  int px1, py1, px2, py2, px3, py3, px4, py4;
  boolean pf1, pf2, pf3, pf4;
  PImage russ, rave, bigben, park, kscope, kscope2;
  Grid(int _screeny)
  {
    screeny = _screeny; // this is the int value telling grid class what menu screen to display, this is set by UI and mousepressed in terrybooth class
    //the x and y origin coordinates for all four of the screens
    px1 = 16;
    py1 = 12;
    px2 = camWs+32;
    py2 = 12;
    px3 = 16;
    py3 = camHs+24;
    px4 = camWs+32;
    py4 = camHs+24;

    //booleans for determining which out of the four screens is set to fullscreen
    pf1 = false; //top left
    pf2 = false; //top right
    pf3 = false; //bttom left
    pf4 = false; //bottom right

    //all the background images used for the background subtraction and kaleidoscope class
    russ = loadImage("russ.JPG");
    rave = loadImage("rave.jpg");
    bigben = loadImage("bigben.jpg");
    park = loadImage("park.jpg");
    kscope = loadImage("kscope.jpg");
    kscope2 = loadImage("kscope2.jpg");

    //This is where each effect is initialised
    //grouped in the groups of four used in the menus
    s1 = new Fading(px1, py1, camWs, camHs, 14, null, false);
    s2 = new Posterize(px2, py2, camWs, camHs, 14, null, false);
    s3 = new Invert(px3, py3, camWs, camHs, 20, null, false);
    s4 = new Edges(px4, py4, camWs, camHs, images.length, russ, false);

    s5 = new RollingVertical(px1, py1, camWs, camHs, images.length, null, false);
    s6 = new RollingHorizontal(px2, py2, camWs, camHs, images.length, null, false);
    s7 = new RandomSlices(px3, py3, camWs, camHs, 20, null, false);
    s8 = new Interlaced(px4, py4, camWs, camHs, 15, null, false);   

    s9 = new Dissolve(px1, py1, camWs, camHs, 14, null, false);
    s10 = new Mirror(px2, py2, camWs, camHs, 3, null, false);
    s11 = new ColShift(px3, py3, camWs, camHs, 20, null, false);
    s12 = new SwapRGB(px4, py4, camWs, camHs, images.length, null, false);

    s13 = new Kaleidoscope(px1, py1, camWs, camHs, 1, kscope, false);
    s14 = new Kaleidoscope(px2, py2, camWs, camHs, 2, kscope2, false);
    s15 = new Mirror(px3, py3, camWs, camHs, 1, null, false);
    s16 = new Mirror(px4, py4, camWs, camHs, 2, null, false);

    s17 = new BackgroundDiff(px1, py1, camWs, camHs, images.length, russ, false);
    s18 = new BackgroundDiffVid(px2, py2, camWs, camHs, images.length, rave, false);
    s19 = new BackgroundDiff(px3, py3, camWs, camHs, images.length, bigben, false);
    s20 = new BackgroundDiff(px4, py4, camWs, camHs, images.length, park, false);
  }

  void update()
  {
    //These are the controls for what effects are displayed under what conditions
    //Its a bit long, and if I were to re-write it i would neaten it up and put it in one function or someting
    //but it just evolved into this mess as i slowly added more and more effects
    if (screeny == 1)
    {
      if (!pf1 && !pf2 && !pf3 && !pf4)
      {
        //if none of them are in fullscreen mode, therefore grid 'menu' mode is set.
        //so all off the smallscreen functions of all the effects are called, and all the effects are called
        controller();
        s1.smallScreen();
        s2.smallScreen();
        s3.smallScreen();
        s4.smallScreen();
        s1.update();
        s2.update();
        s3.update();
        s4.update();
      }
      if (pf1)
      {
        //if one of the four possible options is called then the fullscreen function for that is called, and only that effect is called
        s1.fullScreen();
        s1.update();
      }
      if (pf2)
      {
        s2.fullScreen();
        s2.update();
      }
      if (pf3)
      {
        s3.fullScreen();
        s3.update();
      }
      if (pf4)
      {
        s4.fullScreen();
        s4.update();
      }
    }

    if (screeny == 2)
    {
      if (!pf1 && !pf2 && !pf3 && !pf4)
      {
        controller();
        s5.smallScreen();
        s6.smallScreen();
        s7.smallScreen();
        s8.smallScreen();
        s5.update();
        s6.update();
        s7.update();
        s8.update();
      }
      if (pf1)
      {
        s5.fullScreen();
        s5.update();
      }
      if (pf2)
      {
        s6.fullScreen();
        s6.update();
      }
      if (pf3)
      {
        s7.fullScreen();
        s7.update();
      }
      if (pf4)
      {
        s8.fullScreen();
        s8.update();
      }
    }

    if (screeny == 3)
    {
      if (!pf1 && !pf2 && !pf3 && !pf4)
      {
        controller();
        s9.smallScreen();
        s10.smallScreen();
        s11.smallScreen();
        s12.smallScreen();
        s9.update();
        s10.update();
        s11.update();
        s12.update();
      }
      if (pf1)
      {
        s9.fullScreen();
        s9.update();
      }
      if (pf2)
      {
        s10.fullScreen();
        s10.update();
      }
      if (pf3)
      {
        s11.fullScreen();
        s11.update();
      }
      if (pf4)
      {
        s12.fullScreen();
        s12.update();
      }
    }

    if (screeny == 4)
    {
      if (!pf1 && !pf2 && !pf3 && !pf4)
      {
        controller();
        s13.smallScreen();
        s14.smallScreen();
        s15.smallScreen();
        s16.smallScreen();
        s13.update();
        s14.update();
        s15.update();
        s16.update();
      }
      if (pf1)
      {
        s13.fullScreen();
        s13.update();
      }
      if (pf2)
      {
        s14.fullScreen();
        s14.update();
      }
      if (pf3)
      {
        s15.fullScreen();
        s15.update();
      }
      if (pf4)
      {
        s16.fullScreen();
        s16.update();
      }
    }

    if (screeny == 5)
    {
      if (!pf1 && !pf2 && !pf3 && !pf4)
      {
        controller();
        s17.smallScreen();
        s18.smallScreen();
        s19.smallScreen();
        s20.smallScreen();
        s17.update();
        s18.update();
        s19.update();
        s20.update();
      }
      if (pf1)
      {
        s17.fullScreen();
        s17.update();
      }
      if (pf2)
      {
        s18.fullScreen();
        s18.update();
      }
      if (pf3)
      {
        s19.fullScreen();
        s19.update();
      }
      if (pf4)
      {
        s20.fullScreen();
        s20.update();
      }
    }
  }

  void controller()
  {
    //this function determens whether the mouse is pressed over a one of the four effects
    //and then sets that effect to fullscreen mode
    //depending on wether it is the top left, top right, bottom left or bottom right is pressed
    if (mousePressed && mouseX > px1 && mouseX < camWs + px1 && mouseY > py1 && mouseY < camHs + py1)
    {
      pf1 = true;
      fullVid = true;
      gridV = false;
    }
    if (mousePressed && mouseX > px2 && mouseX < camWs + px2 && mouseY > py2 && mouseY < camHs + py2)
    {
      pf2 = true;
      fullVid = true;
      gridV = false;
    }
    if (mousePressed && mouseX > px3 && mouseX < camWs + px3 && mouseY > py3 && mouseY < camHs + py3)
    {
      pf3 = true;
      fullVid= true;
      gridV = false;
    }
    if (mousePressed && mouseX > px4 && mouseX < camWs + px4 && mouseY > py4 && mouseY < camHs + py4)
    {
      pf4 = true;
      fullVid = true;
      gridV = false;
    }
  }
}

