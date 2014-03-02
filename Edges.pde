class Edges extends Master
{
  //THIS EFFECT SHOW THE DIFFERENCE BETWEEN THE TWO FRAMES WHICH IS GOOD FOR PICKING UP EDGES
  Edges(int x, int y, int w, int h, int a, PImage b, boolean f)
  {
    super(x, y, w, h, a, b, f);
  }

  void update()
  {
    for (int i = 0; i < img.pixels.length; i++)
    {
     //it loops through every pixel
     //and gets an absolute value for the brightness of that pixel for the current frame and the previous frame
     float cola = brightness(images[images.length-2].pixels[i]);
     float colb = brightness(images[images.length-1].pixels[i]);
     //it then takes the differece and gets an absolute value for that difference
     float diff = abs(cola - colb);
     //the r,g and b values for the pixel are then set as that difference
     img.pixels[i] = color(diff,diff,diff);
    }
    img.updatePixels();
    tint(255, 255, 255, 255);
    image(img, X, Y, W, H);
  }
}

