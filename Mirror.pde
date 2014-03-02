class Mirror extends Master
{
  //THIS MIRROR CLASS CONTROLS THE 3 DIFFERENT MIRROR EFFECTS
  Mirror(int x, int y, int w, int h, int a, PImage b, boolean f)
  {
    super(x, y, w, h, a, b, f);
  }

  void update()
  {
    //it takes gets the Ar value passed in when initialised and depending wether it was 1, 2 or 3 it changes which way it is mirrored
    //this was to save having 3 different classes for each way it is mirrored
    if (Ar == 1)
    {
      //this is vertically mirroring the left side
      for (int i = 0; i < camH; i++) 
      {
        for (int j = 0; j < camW; j++)
        {
          int k = i*640 + j; // this in k is the current pixel in the array
          if (j < 320)
          {
            //if it is less than halfway across the width set it to the normal pixel in the array
            img.pixels[k] = images[images.length-1].pixels[k];
          }
          else
          {
            //if it past the halfway mark of the screen, set the pixel to the pixel on the other half of the symmetry line 
            img.pixels[k] = images[images.length-1].pixels[i*640 + 639-j];
          }
        }
      }
      img.updatePixels();
      tint(255, 255, 255, 255);
      image(img, X, Y, W, H);
    }

    if (Ar == 2)
    {
      //this is vertically mirroring the right side
      for (int i = 0; i < camH; i++) 
      {
        for (int j = 0; j < camW; j++)
        {
          int k = i*640 + j;
          if (j < 320)
          {
            //if it less than the halfway mark of the screen, set the pixel to the pixel on the other half of the symmetry line 
            img.pixels[k] = images[images.length-1].pixels[i*640 + 639 - j];
          }
          else
          {
            //if it is past the halfway across the width set it to the normal pixel in the array
            img.pixels[k] = images[images.length-1].pixels[k];
          }
        }
      }
      img.updatePixels();
      tint(255, 255, 255, 255);
      image(img, X, Y, W, H);
    }

      if (Ar == 3)
      {
        for (int i = 0; i < camH; i++) 
        {
          //this is mirroring horizontally the top
          for (int j = 0; j < camW; j++)
          {
            int k = i*640 + j;
            if (i < 240)
            {
              //if it is less than halfway across the height set it to the normal pixel in the array
              img.pixels[k] = images[images.length-1].pixels[k];
            }
            else
            {
              //if it past the halfway mark of the screen, set the pixel to the pixel on the other half of the symmetry line 
              img.pixels[k] = images[images.length-1].pixels[(479-i)*640 +j];
            }
          }
        }
        img.updatePixels();
        tint(255, 255, 255, 255);
        image(img, X, Y, W, H);
      }
    
  }
}

