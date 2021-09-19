/// @desc Debug

if DEBUG
{
	draw_set_halign(0);
	draw_string_list(2, 10,
		str_f("Health: %d / %d", healthPoints, healthPointsMax),
		str_f("Camera: (%d, %d)", CAMERA_X, CAMERA_Y),
		str_f("Frame: (%d)", CURRENT_FRAME),
		str_f("Position: (%f, %f)", x, y),
		str_f("X Speed: %f", x_speed),
		str_f("Y Speed: %f", y_speed),
		str_f("State: %d", state),
		str_f("Flag: %s", string_binary(flag)),
		str_f("Lever: %s", lever(getInput(Input.right), getInput(Input.left))),
		str_f("Input H: %s", string_binary(INPUT_HELD)),
		str_f("Input P: %s", string_binary(INPUT_PRESSED)),
		str_f("Input R: %s", string_binary(INPUT_RELEASED)),
		str_f("Input B: %s", INPUT_BUFFERED),
		str_f("Input Device: %s", MAIN_OBJ.inputDevice),
		str_f("Hitstop: %s", HITSTOP),
		str_f("Use Input: %s", getGameFlag(Game_Flag.useInput)),
		str_f("Player Inst: %s", object_get_name(getPlayerInst())),
		str_f("Next RNG: %d", buffer_peek(RANDOMNUM_BUFFER, buffer_tell(RANDOMNUM_BUFFER), buffer_u8)),
		);

	draw_set_halign(2);
	draw_string_list(CAMERA_W - 2, 20,
		str_f("Facing Right: (%b)", flag & 1 << Player_Flag.facingRight),
		str_f("Moving: (%b)", flag & 1 << Player_Flag.moving),
		str_f("In Air: (%b)", flag & 1 << Player_Flag.inAir),
		str_f("Jump Hold: (%b)", flag & 1 << Player_Flag.jumpHold),
		str_f("Offscreen: (%b)", flag & 1 << Player_Flag.isOffscreen),
		str_f("Charge: (%d)", charge),
		str_f("Shots: (%d)", shotCount),
		str_f("RideObject: (%s)", rideObject),
		);
}
