class BackgroundDiff extends Master
{
  //THIS EFFECT USES A BACKGROUND SUBRTRACTION TECHNIQUE TO SUPERIMPOSE THE VIEWER ONTO A SET BACKGROUND IMAGE
  BackgroundDiff(int x, int y, int w, int h, int a, PImage b, boolean f)
  {
    super(x, y, w, h, a, b, f);
  }

  void update()
  {
    if (fullScr == false)
    {
      //in menu mode it just displays what the background image will be with what the profile silhoutte ontop
      tint(255, 255, 255, 255);
      image(background, X, Y, W, H);
      tint(255, 255, 255, 175);
      image(profile, X+ W*0.14, Y, W/1.4, H);
      tint(255, 255, 255, 255);
    }

    if (fullScr == true)
    {
      if (keyPressed) 
      {
        //when the spacebar is pressed the background image is set and it will start the background subtraction
        if (key == ' ')
        {
          backgroundSet = true;
          img1 = cam.get(0, 0, camW, camH);
        }
      }
      if (!backgroundSet)
      {
        //when the background is not set it just show the current frame from the webcam, and gives the command to step out the screen and press spacebar
        image(images[images.length-1], X, Y, W, H);
        textAlign(CENTER);
        textSize(30);
        text("Step out of frame and press spacebar", X + W/2, Y + 400);
      }
      if (backgroundSet)
      {
        //when the background is set the effect takes place
        for (int i = 0; i < img.pixels.length; i++) 
        {
          //it loops through every pixel
          //and compares the red, green and blue value of each pixel between the set background image and the current image from the webcam
          float r1 = red(img1.pixels[i]);
          float r2 = red(images[images.length-1].pixels[i]);
          float rDiff = abs(r1 - r2); // it takes an absolute value for the difference

          float g1 = green(img1.pixels[i]);
          float g2 = green(images[images.length-1].pixels[i]);
          float gDiff = abs(g1 - g2);

          float b1 = blue(img1.pixels[i]);
          float b2 = blue(images[images.length-1].pixels[i]);
          float bDiff = abs(b1 - b2);
          
          //it also takes an average of all these differences
          float avDiff = (rDiff + gDiff + bDiff)/3;

          //it then checks whether the difference between the two pixels is sufficiently past a certain threshold, in the red, green, blue or average difference
          if (avDiff > 50 || rDiff > 20 || gDiff > 20 || bDiff > 20)
          {
            //if it is it displays the colour value for the pixel from the current image from the webcam
            img.pixels[i] = color(images[images.length-1].pixels[i]);
          }
          else
          {
            //if not it shows the colour value of the pixel from the background image
            img.pixels[i] = color(background.pixels[i]);
          }
        }
        img.updatePixels();
        tint(255, 255, 255, 255);
        image(img, X, Y, W, H); // it then displays this new image
      }
    }
  }
}

