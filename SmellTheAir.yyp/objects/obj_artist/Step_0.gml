/// @desc 

if keyboard_check_pressed(vk_numpad0)
{
	active = !active;
	
	if !active
	{
		ds_list_clear(elementList);
	}
}

if active
{
	mX = mouse_x;
	mY = mouse_y;
	
	if doQuantize
	{
		mX = round(mX / unit) * unit;
		mY = round(mY / unit) * unit;
	}
	
	if mouse_check_button_pressed(mb_middle)
	{
		mXHold = mX;
		mYHold = mY;
		
		state = 1;
		if keyboard_check_direct(vk_alt) {state = 0;}
		if keyboard_check_direct(vk_control) {state = 2;}
		
		switch(state)
		{
			case(0): 
				var _el = [state, mX, mY]; 
				ds_list_add(elementList, _el);
				break;
				
			case(1): 
			case(2): 
				var _el = [state, mX, mY, mX, mY]; 
				ds_list_add(elementList, _el); 
				currentElement = _el; 
				break;
		}
	}
	
	if mouse_check_button(mb_middle)
	&& currentElement != -1
	{
		switch(state)
		{
			case(1):
			case(2):
				currentElement[@ 1] = mXHold; currentElement[@ 2] = mYHold;
				currentElement[@ 3] = mX; currentElement[@ 4] = mY;
				break;
		}
	}
	
	if mouse_check_button_released(mb_middle)
	{
		state = 0;
		currentElement = -1;
	}
	
	// Unit
	if keyboard_check_pressed(vk_multiply) {unit++;}
	if keyboard_check_pressed(vk_divide) {unit--;}
	
	// Quantize
	if keyboard_check_pressed(vk_numpad1) {doQuantize = !doQuantize;}
	
	// Undo
	if keyboard_check_pressed(vk_decimal)
	{
		if ds_list_size(elementList) > 0 
		{ds_list_delete(elementList, ds_list_size(elementList) - 1);}
	}
}