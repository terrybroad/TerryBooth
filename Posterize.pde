class Posterize extends Master
{
  //THIS IS THE CLASS CONTROLLING THE POSTERIZE EFFECT
  Posterize(int x, int y, int w, int h, int a, PImage b, boolean f)
  {
    super(x, y, w, h, a, b, f);
  }

  void update()
  {
    for (int i = 0; i < img.pixels.length; i++)
    {
      //it takes the brightness value of the current pixel
      float col = brightness(images[images.length-1].pixels[i]);   
      //and if the brightness is above a certain threshold (100) it sets the pixel value to white
      if (col > 100)
      {
        img.pixels[i] = color(255, 255, 255);
      }
      //and if its below it it sets that pixel value to black
      else
      {
        img.pixels[i] = color(0, 0, 0);
      }
    }
    img.updatePixels();
    tint(255, 255, 255, 255);
    image(img, X, Y, W, H);
  }
}

