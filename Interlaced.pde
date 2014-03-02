class Interlaced extends Master
{
  Interlaced(int x, int y, int w, int h, int a, PImage b, boolean f)
  {
    super(x, y, w, h, a, b, f);
  }

  void update()
  {
    boolean interlaced = true;
    int c = 0;
    for (int i = 0; i < camH; i++) 
    {
      int randomIndex = floor(random(images.length-Ar, images.length-1));
      for (int j = 0; j < camW; j++)
      {
        int k = i*640 + j;
        if (interlaced)
        {
          img.pixels[k] = images[images.length-1].pixels[k];
        }
        else
        {
          img.pixels[k] = images[images.length-20].pixels[k];
        }
      }
      if (i > c+1)
      {
      interlaced = !interlaced;
      c = i;
      }
    }
    img.updatePixels();
    tint(255, 255, 255, 255);
    image(img, X, Y, W, H);
  }
}

