/// @desc 

damageOnTouch();

if (step++) < stepMax
{
	image_index = lerp(0, image_number, step / stepMax);
	x += obj_shade.x_speed;
}
else {instance_destroy();}