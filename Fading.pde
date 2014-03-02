class Fading extends Master
{
  //THE FADING CLASS SHOWS THE LAST 14 IMAGES FROM THE ARRAY ALL SEMI TRANSPARENT
  Fading(int x, int y, int w, int h, int a, PImage b, boolean f)
  {
    super(x, y, w, h, a, b, f);
  }

  void update()
  {
    for (int i = images.length-Ar-1; i<images.length; i++)
    { 
      //It loops through the past 14 images and makes sure that it is not trying to display an image which does exist yet (it could happed as soon as the program has started up)
      if (images[i] != null)
      {
        //and then displays all these images with an opacity level of 25 out of 255
        tint(255, 255, 255, 25);
        image(images[i], X, Y, W, H);
      }
    }
  }
}

