class Animation
{
    float x;
    float y;
    float z;
    float size;
    
    float start_shrinking;
    float stop_shrinking;
    float shrink_factor;
    float start_growing;
    float stop_growing;
    float grow_factor;
    
    Animation (float xx, float yy, float zz, float siz,
	       float start_grow, float stop_grow,
	       float start_shrink, float stop_shrink)
    {
	x = xx;
	y = yy;
	z = zz;
	size = siz;
	start_growing = start_grow;
	stop_growing = stop_grow;
	start_shrinking = start_shrink;
	stop_shrinking = stop_shrink;

        grow_factor = 1.0 / (stop_grow - start_grow);
        shrink_factor = 1.0 / (stop_shrink - start_shrink);
    }

    float scaleFactor (float t)
    {
	if (t > stop_shrinking)
    	{
		return 0;
    	}		 
    	else if (t > start_shrinking)
    	{
		return 1.0 - ((t - start_shrinking) * shrink_factor);
    	}
    	else if (t > stop_growing)
    	{
		return 1.0;
    	}
    	else if (t > start_growing)
    	{
		return (t - start_growing) * grow_factor; 
    	}
    	// So <= start_growing
    	return  0.0;
    }
    
    void apply (Form form, float t)
    {
	float scale_factor = scaleFactor (t); 
	if (scale_factor == 0)
	    {
		return; 
	    }
	
	form.size = size * scale_factor;

  	float side_length = size * scale_factor;
  	if (side_length > size)
	    {
		side_length = size; 
	    }
  	form.x = x * (1.0 / (scale_factor + 0.00001));
	form.y = y * (1.0 / (scale_factor + 0.00001));
	form.z = z * (1.0 / (scale_factor + 0.00001));
    }
    
    boolean finished (float t)
    {
      return t > stop_shrinking;
    }
}
