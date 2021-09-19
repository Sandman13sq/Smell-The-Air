/// @desc Returns index of button pressed. 0 if none is pressed
function gamepad_get_button() {

	for (var i = 0; i < 8; i++)
	{
		for (var b = gp_face1; b <= gp_axisrv; b++)
		{
			if gamepad_button_check_pressed(i, b)
			{
				return b;
			}
		}
	}

	return 0;


}
