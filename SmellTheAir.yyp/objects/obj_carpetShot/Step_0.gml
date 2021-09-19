/// @desc 

BAIL_CODE

part_particles_create_region(
	PART_SYS,
	bbox_left, bbox_top, bbox_right, bbox_bottom,
	PART_TYPE[Part_Type.shadowParticle], c_white, 1
	);
	
if life > 0 {life--;}
else {instance_destroy(); return;}

if tileAt(x + x_speed, y) {instance_destroy(); return;}

if damageOnTouch()
{
	instance_destroy();
}
else
{
	x += x_speed;
}