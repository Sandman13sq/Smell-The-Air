/// @desc fire

with element[0]
{
	setAnimation(Animation_Index.shade_shoot);
	
	with instance_create_depth(x + image_xscale * 16, y - 32, depth, obj_carpetShot)
	{
		x_speed = other.image_xscale * 3;
	}
}
