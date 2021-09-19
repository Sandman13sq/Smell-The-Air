/// @desc 

var _w = CAMERA_W + 64;

if in_range(CAMERA_X, x - _w, x + CAMERA_W + _w)
{
	instance_activate_object(enemyInstance);
	instance_destroy();
}