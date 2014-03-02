class KHex
{
  //THIS CLASS IS NOT TO BE ASSESSED FOR THIS PROJECT
  //THIS METHOD IS ALSO BEING USED IN MY CREATIVE PROJECTS PROJECT FOR MICKS CLASS
  //AND I WANT THE MARKS FOR THIS METHOD TO BE CONTRIBUTED TO HIS PROJECT
  //I JUST LEFT IT IN BECAUSE IT WAS A NICE EFFECT
  float Xpos, Ypos;
  int Kw, Kh,Ar;
  KHex(float _Xpos, float _Ypos, int _Ar)
  {
    Xpos = _Xpos;
    Ypos = _Ypos;
    Ar = _Ar;
  }

  void update()
  {
    if(Ar == 1)
    {
    smooth();
    //1
    image(grid.s13.img2, Xpos- 136.83202, Ypos-80); 
    //2
    pushMatrix();
    translate(Xpos, Ypos);
    rotate(radians(120));
    image(grid.s13.img4, - 23.16789, -80);
    popMatrix();
    //3
    pushMatrix();
    translate(Xpos, Ypos);
    rotate(radians(120));
    image(grid.s13.img2, -136.83202, -80);
    popMatrix();
    //4
    image(grid.s13.img4, Xpos - 23.16789, Ypos - 80);
    //5
    pushMatrix();
    translate(Xpos, Ypos);
    rotate(radians(240));
    image(grid.s13.img2, -136.83202, -80);
    popMatrix();   
    //6
    pushMatrix();
    translate(Xpos, Ypos);
    rotate(radians(240));
    image(grid.s13.img4, - 23.16789, -80);
    popMatrix();
    }
    if(Ar == 2)
    {
    smooth();
    //1
    image(grid.s14.img2, Xpos- 136.83202, Ypos-80); 
    //2
    pushMatrix();
    translate(Xpos, Ypos);
    rotate(radians(120));
    image(grid.s14.img4, - 23.16789, -80);
    popMatrix();
    //3
    pushMatrix();
    translate(Xpos, Ypos);
    rotate(radians(120));
    image(grid.s14.img2, -136.83202, -80);
    popMatrix();
    //4
    image(grid.s14.img4, Xpos - 23.16789, Ypos - 80);
    //5
    pushMatrix();
    translate(Xpos, Ypos);
    rotate(radians(240));
    image(grid.s14.img2, -136.83202, -80);
    popMatrix();   
    //6
    pushMatrix();
    translate(Xpos, Ypos);
    rotate(radians(240));
    image(grid.s14.img4, - 23.16789, -80);
    popMatrix();
    }
  }
}

