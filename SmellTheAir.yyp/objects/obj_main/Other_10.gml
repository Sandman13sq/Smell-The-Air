/// @desc Update Window

if cameraSize > 0
{
	window_set_size(CAMERA_W * cameraSize, CAMERA_H * cameraSize);
	window_set_fullscreen(0);
	alarm[0] = 1;
}
else
{
	window_set_fullscreen(1);
}