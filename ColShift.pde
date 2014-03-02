class ColShift extends Master
{
  //THIS EFFECT SHOW THE RED GREEN AND BLUE OFFSET IN TIME
  ColShift(int x, int y, int w, int h, int a, PImage b, boolean f)
  {
    super(x, y, w, h, a, b, f);
  }

  void update()
  {
    for (int i = 0; i < img.pixels.length; i++)
    {
      //it loops through all the pixels in the image
      //it takes the red value from the current image
      float r = red(images[images.length-1].pixels[i]);
      //the green value from an image 10 frames back in the global array of webcam images
      float g = green(images[images.length-11].pixels[i]);
      //and the blue value from the image 20 frames back the global array of webcam images
      float b = blue(images[images.length-21].pixels[i]); 
      //it then sets the pixel value of the new image to red green and blue value of these older images
      img.pixels[i] = color(r, g, b);
    }
    img.updatePixels();
    tint(255, 255, 255, 255);
    image(img, X, Y, W, H);  
  }
}

