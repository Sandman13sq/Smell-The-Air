/// @desc 

switch(state)
{
	case(0):
		var _lev = lever(getInputPressed(Input.right), getInputPressed(Input.left));
		if _lev != 0 {mode = !mode; sfx(snd_menuMove);}
		
		if getInputPressed(Input.jump) {sfx(snd_menuBack); state = 1;}
		if getInputPressed(Input.fire) 
		{
			sfx(snd_menuBack);
			with obj_title {state = 0; visible = true;}
			saveSettings();
			instance_destroy();
		}
		break;
	
	// Button Select
	case(1):
		var _lev = lever(getInputPressed(Input.down), getInputPressed(Input.up));
		if _lev != 0 {inputSelect = loop(inputSelect + _lev, 0, inputCount); sfx(snd_menuMove);}
		
		if getInputPressed(Input.fire) {sfx(snd_menuBack); state = 0;}
		if getInputPressed(Input.jump) 
		{
			sfx(snd_menuBack); 
			state = 2; 
			polling = time_val(0, 4, 0);
		}
		if getInputPressed(Input.menu) 
		{
			sfx(snd_menuBack); 
			state = 3; 
			polling = time_val(0, 4, 0);
		}
		
		break;
	
	// Polling
	case(2):
		if mode == 0
		{
			if keyboard_check_pressed(vk_anykey)
			{
				array_set(inputArr[@ mode], inputSelect, [keyboard_key]);
				polling = 0; sfx(snd_menuBack);
			}
		}
		else
		{
			if gamepad_get_button()
			{
				array_set(inputArr[@ mode], inputSelect, [gamepad_get_button()]);
				polling = 0;  sfx(snd_menuBack);
			}
		}
		
		if polling > 0 {polling--;} else {state = 1;}
		break;
	
	// Polling (Add)
	case(3):
		if mode == 0
		{
			if keyboard_check_pressed(vk_anykey)
			{
				var _arr = inputArr[@ mode]; _arr = _arr[@ inputSelect];
				_arr[@ array_length_1d(_arr)] = keyboard_key;
				polling = 0; sfx(snd_menuBack);
			}
		}
		else
		{
			if gamepad_get_button()
			{
				var _arr = inputArr[@ mode]; _arr = _arr[@ inputSelect];
				_arr[@ array_length_1d(_arr)] = gamepad_get_button();
				polling = 0; sfx(snd_menuBack);
			}
		}
		
		if polling > 0 {polling--;} else {state = 1;}
		break;
}