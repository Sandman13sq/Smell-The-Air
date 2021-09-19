/// @desc 

BAIL_CODE;

imageStep--;
if imageStep <= 0 {image_index++; imageStep = 4;}

y_speed = approach(y_speed, y_speedMax, 0.01);

if flySpeed > 0
{
	flySpeed *= flyMod;
	
	if flySpeed < 0.01 {flySpeed = 0;}
	
	x += lengthdir_x(flySpeed, direction);
	y += lengthdir_y(flySpeed, direction);
}

if tileAt(x, bbox_bottom) || tileAt(x, bbox_top)
|| tileAt(bbox_left, y) || tileAt(bbox_right, y)
{
	instance_destroy(); 
	return;
}

if diff(life, lifeMax) >= 30
{
	if damageOnTouch() {instance_destroy(); return;}
}

if life > 0 {life--;}
else {instance_destroy();}

y += y_speed;