class Kaleidoscope extends Master
{
  //THIS CLASS IS NOT TO BE ASSESSED FOR THIS PROJECT
  //THIS METHOD IS ALSO BEING USED IN MY CREATIVE PROJECTS PROJECT FOR MICKS CLASS
  //AND I WANT THE MARKS FOR THIS METHOD TO BE CONTRIBUTED TO HIS PROJECT
  //I JUST LEFT IT IN BECAUSE IT WAS A NICE EFFECT
  
  KHex h1, h2, h3, h4, h5, h6, h7, h8, h9, h10, h11;
  Kaleidoscope(int x, int y, int w, int h, int a, PImage b, boolean f)
  {
    super(x, y, w, h, a, b, f);
    img2 = new PImage(160, 160, ARGB);
    img3 = new PImage(160, 160, ARGB);
    img4 = new PImage(160, 160, ARGB);
    img5 = new PImage(fW, fH);

    X = width/2;
    Y = height/2;
    W = ceil(136.83202);
    H = 98 + ceil(W);
    img2 = new PImage(160, 160, ARGB);
    img3 = new PImage(160, 160, ARGB);
    img4 = new PImage(160, 160, ARGB);

    h1 = new KHex(X, Y,Ar);
    h2 = new KHex(X+2*W, Y,Ar);
    h3 = new KHex(X-2*W, Y,Ar);

    h4 = new KHex(X + W, Y + H,Ar);
    h5 = new KHex(X+3*W, Y + H,Ar);
    h6 = new KHex(X - W, Y + H,Ar);
    h7 = new KHex(X - 3*W, Y + H,Ar);

    h8 = new KHex(X + W, Y - H,Ar);
    h9 = new KHex(X+3*W, Y - H,Ar);
    h10 = new KHex(X - W, Y - H,Ar);
    h11 = new KHex(X - 3*W, Y - H,Ar);
  }

  void update()
  {
    if (fullScr || grid.s13.fullScr)
    {
      if (Ar == 1)
      {
        img1 = images[images.length-1];
        img3 = img1.get(X+250, Y+200, 160, 160);
      }
    if (Ar == 2)
    {
      for (int i = 0; i < img.pixels.length; i++)
      {
        float r = red(images[images.length-1].pixels[i]);
        float g = green(images[images.length-11].pixels[i]);
        float b = blue(images[images.length-21].pixels[i]); 
        img.pixels[i] = color(r, g, b);
      }
      img.updatePixels();
      img3 = img.get(X+250, Y+200, 160, 160);
    }
    float trig = 0;
    float pyth = 0;
    for (int i = 0; i < 160; i++)
    {
      for (int j = 0; j < 160; j++)
      {     
        if (i < 80)
        {
          pyth = (2*i*2*i) - (i*i);
          trig = sqrt(pyth);
          if (j <= trig ) 
          {
            img2.pixels[i*160 + j] = img3.pixels[i*160 + j];
          }
          else
          {
            img2.pixels[i*160 + j] = color(0, 0, 0, 0);
          }
        }

        if (i >= 80)
        {
          pyth = (2*(i-80)*2*(i-80)) - ((i-80)*(i-80));
          trig = sqrt(pyth);
          if (j <= 136.83202 - trig)
          {
            img2.pixels[i*160 + j] = img3.pixels[i*160 + j];
          }
          else
          {
            img2.pixels[i*160 + j] = color(0, 0, 0, 0);
          }
        }
      }
    }
    img2.updatePixels();

    for (int i = 0; i < 160; i++)
    {
      for (int j = 0; j < 160; j++)
      {
        img4.pixels[i*160 + j] = img2.pixels[i*160 + 159 - j];
      }
    }
    img4.updatePixels();
    h1.update();
    h2.update();
    h3.update();
    h4.update();
    h5.update();
    h6.update();
    h7.update();
    h8.update();
    h9.update();
    h10.update();
    h11.update();

    fill(255);
    noStroke();
    rect(0, 0, width, 12);
    rect(0, 0, 16, height);
    rect(16+fW, 0, width, height);
    rect(0, 12+fH, width, height);
    img5 = get(16, 12, fW, fH);
  }
}

void smallScreen()
{
  X = pX;
  Y = pY;
  W = pW;
  H = pH;
  fullScr = false;
  image(background, X, Y, W, H);
}
}
