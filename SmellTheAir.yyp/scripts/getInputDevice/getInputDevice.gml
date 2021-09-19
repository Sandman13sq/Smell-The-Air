/// @desc Finds input device
function getInputDevice() {

	var _l = gamepad_get_device_count();

	for (var i = 0; i < _l; i++)
	{
		if gamepad_button_check_pressed(i, 0)
		|| gamepad_button_check_pressed(i, gp_padr)
		|| gamepad_button_check_pressed(i, gp_padu)
		|| gamepad_button_check_pressed(i, gp_padl)
		|| gamepad_button_check_pressed(i, gp_padd)
		{
			inputDevice = i;
			break;
		}
	}


}
