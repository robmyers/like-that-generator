// (:clashes "outline" "burst_3d" "cluster_3d" "grow_3d")

String MODE = P3D;

class Form
{
	float size;
	float x;
	float y;

	Form ()
	{
	}

	void draw ()
	{
		ellipseMode (CENTER);
  		ellipse (x, y, size, size);
	}
}