class Dissolve extends Master
{
  //THIS EFFECT SHOWS EACH PIXEL PICKED AT RANDOM FROM ONE OF THE IMAGES BACK IN THE WEBCAM ARRAY
  Dissolve(int x, int y, int w, int h, int a, PImage b, boolean f)
  {
    super(x, y, w, h, a, b, f);
  }

  void update()
  {
    for (int i = 0; i < img.pixels.length; i++) 
    {
      //this randomIndex variable picks a random number in a set constrain to be picked 
      int randomIndex = floor(random(images.length-Ar, images.length-1));
      //and then this is set as what image from the global array to be set for the current pixel value
      img.pixels[i] = images[randomIndex].pixels[i];
    }
    img.updatePixels();
     tint(255, 255, 255, 255);
    image(img, X, Y, W, H);
  }
}

