class RollingHorizontal extends Master
{
  RollingHorizontal(int x, int y, int w, int h, int a, PImage b, boolean f)
  {
    super(x, y, w, h, a, b, f);
  }

  void update()
  {
    int r = camW / Ar;
    for (int i = 0; i < camH; i++) 
    {
      for (int j = 0; j < camW; j++)
      {
        int k = i*camW + j;
        int l = floor(j/r);
        img.pixels[k] = images[l].pixels[k];
      }
    }
    img.updatePixels();
     tint(255, 255, 255, 255);
    image(img, X, Y, W, H);
  }
}

