class Invert extends Master
{
  //THIS CLASS INVERTS THE COLOUR VALUE OF THE IMAGE
  Invert(int x, int y, int w, int h, int a, PImage b, boolean f)
  {
    super(x, y, w, h, a, b, f);
  }

  void update()
  {
    for (int i = 0; i < img.pixels.length; i++)
    {
      //it loops through every pixel in the image
      //and get the red, green and blue value for that pixel in the current webcam frame
      float r = red(images[images.length-1].pixels[i]);
      float g = green(images[images.length-1].pixels[i]);
      float b = blue(images[images.length-1].pixels[i]); 
      //it then takes 255 and subtracts the r,g and b values from the to get the inverse colour value
      img.pixels[i] = color(255-r,255-g,255-b);
    }
    img.updatePixels();
    tint(255, 255, 255, 255);
    image(img, X, Y, W, H);
  }
}

