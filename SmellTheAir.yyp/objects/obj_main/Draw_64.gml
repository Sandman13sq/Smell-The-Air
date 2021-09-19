/// @desc Draw Health & Timer

if instance_exists(PLAYER)
{
	// Timer
	if !getGameFlag(Game_Flag.debugStart)
	{
		draw_set_align(1, 0);

		draw_shape_text(CAMERA_W * 0.5 + 1, 17, playTimeString, c_snes, 1);
		draw_text(CAMERA_W * 0.5, 16, playTimeString);
	}

	if !DEBUG
	{
		// Draw Health (Light)
		draw_health(
			UNIT_PX, UNIT_PX + 8,
			PLAYER.healthPoints, PLAYER.healthPointsMax,
			LIGHTCOLOR
			);
	}
}