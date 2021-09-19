/// @desc Animation

updateAnimation();

if collision_rectangle(
	CAMERA_X, CAMERA_Y, CAMERA_X + CAMERA_W, CAMERA_Y + CAMERA_H, self, 0, 0)
{
	clearFlag(Player_Flag.isOffscreen);
}
else
{
	setFlag(Player_Flag.isOffscreen);
}