/// @desc 

BAIL_CODE

x += x_speed;
y += y_speed;

if in_range(y, CAMERA_Y - 64, CAMERA_Y + CAMERA_H + 64)
{
	y_speed += y_acc;
}
else {instance_destroy();}