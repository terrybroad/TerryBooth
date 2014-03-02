class BackgroundDiffVid extends Master
{
  //THIS EFFECT IS VERY SIMILAR TO THE BACKGROUNDDIFF EFFECT BUT INSTEAD OF AN IMAGE IT USES A VIDEO
  //CHECK COMMENTS FOR HOW THE BACKGROUND SUBTRACTION METHOD WORKS
  BackgroundDiffVid(int x, int y, int w, int h, int a, PImage b, boolean f)
  {
    super(x, y, w, h, a, b, f);
  }

  void update()
  {
    if (fullScr == false)
    {
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
        if (key == ' ')
        {
          backgroundSet = true;
          img1 = cam.get(0, 0, camW, camH);
        }
      }
      if (!backgroundSet)
      {
        image(images[images.length-1], X, Y, W, H);
        textAlign(CENTER);
        textSize(30);
        text("Step out of frame and press spacebar", X + W/2, Y + 400);
      }
      if (backgroundSet)
      {
        vid.play();
        //this displays the video
        image(vid,X,Y);
        for (int i = 0; i < img.pixels.length; i++) 
        {
          float r1 = red(img1.pixels[i]);
          float r2 = red(images[images.length-1].pixels[i]);
          float rDiff = abs(r1 - r2);

          float g1 = green(img1.pixels[i]);
          float g2 = green(images[images.length-1].pixels[i]);
          float gDiff = abs(g1 - g2);

          float b1 = blue(img1.pixels[i]);
          float b2 = blue(images[images.length-1].pixels[i]);
          float bDiff = abs(b1 - b2);

          float avDiff = (rDiff + gDiff + bDiff)/3;

          if (avDiff > 40 || rDiff > 20 || gDiff > 20 || bDiff > 20)
          {
            img.pixels[i] = color(images[images.length-1].pixels[i]);
          }
          else
          {
            //the only major difference is that instead of setting it to the pixel value of the current image, it sets it too transparent
            img.pixels[i] =  color(0, 0, 0, 0);
          }
        }
        img.updatePixels();
        tint(255, 255, 255, 255);
        //and then the image with the background made transparent is superimposed on top
        image(img, X, Y, W, H);
      }
    }
  }
}

