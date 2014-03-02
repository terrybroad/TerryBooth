class RandomSlices extends Master
{
  //THIS CLASS IS SIMILAR TO THE DISSOLVE CLASS BUT INTSTEAD OF EACH PIXEL BEING RANDOMLY SELECTED ITS EACH LINE
  RandomSlices(int x, int y, int w, int h, int a, PImage b, boolean f)
  {
    super(x, y, w, h, a, b, f);
  }

  void update()
  {
    for (int i = 0; i < camH; i++) 
    {
      //it loops through the array of pixels and the randomIndex is called when the only on every iteration of i (each horizontal line)
      int randomIndex = floor(random(images.length-Ar, images.length-1));
      for (int j = 0; j < camW; j++)
      {
        //the pixel values for the pixel in the line are then set from one of the random images in the global webcam array
        int k = i*640 + j;
        img.pixels[k] = images[randomIndex].pixels[k];
      }
    }
    img.updatePixels();
    tint(255, 255, 255, 255);
    image(img, X, Y, W, H);
  }
}

