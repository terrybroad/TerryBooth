class UI
{
  PImage camera, frameSave, left, right, squares;

  UI()
  {
    camera = loadImage("cameraicon.jpg");
    left = loadImage("left.jpg");
    right = loadImage("right.jpg");
    squares = loadImage("4-squares.gif");
    frameSave = new PImage(camW, camH);
  }

  void update()
  {
    controller();
    if (gridV)
    {
      image(left, 35, 525, 76, 76);
      image(right, width-35-76, 525, 76, 76);
    }
    if (fullVid)
    {
      tint(255, 255, 255, 255);
      image(camera, width/2 + 50 - 76/2, 525, 76, 76);
      image(squares, width/2 - 50 - 76/2, 525, 76, 76);
    }
  }

  void controller()
  {
    if (mousePressed && mouseX > width/2 + 50 - 76/2 && mouseX < width/2 + 50 - 76/2 + 76 && mouseY > 525 && mouseY < 525 + 76 && fullVid && pressed)
    {
      frameSave = get(grid.px1, grid.py1, camW, camH);
      frameSave.save("images/pic" + millis()+".jpg");
      music.trigger(); 
      fill(255);
      rect(0,0,width,height);
      pressed = !pressed;
       
    }
    if (mousePressed && mouseX > 35 && mouseX < 35 + 76 && mouseY > 525 && mouseY < 525 + 76 && gridV && pressed)
    {
      if (grid.screeny > 1)
      {
        grid.screeny--;
        pressed = !pressed;
      }
      else
      {
        grid.screeny = 5;
        pressed = !pressed;
      }
    }
    if (mousePressed && mouseX > width-35-76 && mouseX < width - 35 && mouseY > 525 && mouseY < 525 + 76 && gridV && pressed)
    {
      if (grid.screeny < 5)
      {
        grid.screeny++;
        pressed = !pressed;
      }
      else
      {
        grid.screeny = 1;
        pressed = !pressed;
      }
    }
    if (mousePressed && mouseX > width/2 - 50 - 76/2 && mouseX < width/2 - 50 - 76/2 + 76 && mouseY > 525 && mouseY < 525 + 76 && fullVid && pressed)
    {
      grid.pf1 = false;
      grid.pf2 = false;
      grid.pf3 = false;
      grid.pf4 = false;
      fullVid = false;
      gridV = true;
    }
  }
}

