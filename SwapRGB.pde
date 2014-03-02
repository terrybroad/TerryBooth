class SwapRGB extends Master
{
  SwapRGB(int x, int y, int w, int h, int a, PImage b, boolean f)
  {
    super(x, y, w, h, a, b, f);
  }

  void update()
  {
    for (int i = 0; i < img.pixels.length; i++)
    {
      float r = red(images[images.length-1].pixels[i]);
      float g = green(images[images.length-1].pixels[i]);
      float b = blue(images[images.length-1].pixels[i]); 
      img.pixels[i] = color( sin(theta)*r + 47, g , sin(theta + radians(180))*b) + 47;
    }
    theta+=0.05;
    img.updatePixels();
    tint(255, 255, 255, 255);
    image(img, X, Y, W, H);
   
  }
}
