/// @desc 

BAIL_CODE

if tileAt(x, y) {x = quantize_r(x, 16); instance_destroy(); return;}

var _inst = instance_place(x, y, obj_enemy);

if _inst
{
	if doDamage(_inst, damage) {instance_destroy(); return;};
}

if life > 0 
{
	life--;
	
	x += x_speed;
	y += y_speed;
	
	imageStep++;
	
	image_index = (imageStep div 2) mod 4;
	
}
else {instance_destroy();}