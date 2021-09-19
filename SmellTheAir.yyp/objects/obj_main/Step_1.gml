/// @desc Inputs & Hitstop

if HITSTOP > 0 {HITSTOP--;}
if HITSTOP < 0 {HITSTOP = -HITSTOP;}

CURRENT_FRAME++;

#region Inputs

getInputDevice();

for (var i = 0; i < Input._size; i++)
{
	if getInputPressed(i)
	{
		INPUT_BUFFERED[i] = 0;
	}
}

INPUT_HELD = 0;
INPUT_PRESSED = 0;
INPUT_RELEASED = 0;

var _input, _keyList, _subLength;

for (var i = 0; i < Input._size; i++)
{
	// Keyboard
	_keyList = inputKey;
	
	if is_array(_keyList[i])
	{
		_subLength = array_length_1d(_keyList[i]);
		
		for (var j = 0; j < _subLength; j++)
		{
			_input = array_get(_keyList[i], j);
			
			if keyboard_check(_input) {INPUT_HELD |= 1 << i;}
			if keyboard_check_pressed(_input) {INPUT_PRESSED |= 1 << i;}
			if keyboard_check_released(_input) {INPUT_RELEASED |= 1 << i;}
		}
	}
	else
	{
		_input = _keyList[i];
			
		if keyboard_check(_input) {INPUT_HELD |= 1 << i;}
		if keyboard_check_pressed(_input) {INPUT_PRESSED |= 1 << i;}
		if keyboard_check_released(_input) {INPUT_RELEASED |= 1 << i;}
	}
	
	// Gamepad
	if inputDevice > -1
	{
		_keyList = inputPad;
		
		if is_array(_keyList[i])
		{
			_subLength = array_length_1d(_keyList[i]);
		
			for (var j = 0; j < _subLength; j++)
			{
				_input = array_get(_keyList[i], j);
			
				if gamepad_button_check(inputDevice, _input) {INPUT_HELD |= 1 << i;}
				if gamepad_button_check_pressed(inputDevice, _input) {INPUT_PRESSED |= 1 << i;}
				if gamepad_button_check_released(inputDevice, _input) {INPUT_RELEASED |= 1 << i;}
			}
		}
		else
		{
			_input = _keyList[i];
			
			if gamepad_button_check(inputDevice, _input) {INPUT_HELD |= 1 << i;}
			if gamepad_button_check_pressed(inputDevice, _input) {INPUT_PRESSED |= 1 << i;}
			if gamepad_button_check_released(inputDevice, _input) {INPUT_RELEASED |= 1 << i;}
		}
	}
}

#endregion

#region Debug

if keyboard_check(vk_tab)
{
	if keyboard_check_pressed(ord("R")) {game_restart();}
	
	if keyboard_check_pressed(ord("D")) 
	{
		DEBUG = !DEBUG; 
		show_debug_overlay(DEBUG);
		if DEBUG {setGameFlag(Game_Flag.debugStart);}
	}
	
	//if keyboard_check(ord("O")) {darkness = approach(darkness, 0, 0.05)}
	//if keyboard_check(ord("P")) {darkness = approach(darkness, 1, 0.05)}
	
	//if keyboard_check_pressed(ord("P")) {inst_create(obj_screenshot);}
}

if keyboard_check_pressed(Key.tilde) 
{
	DEBUG = !DEBUG; 
	show_debug_overlay(DEBUG);
	
	if DEBUG {setGameFlag(Game_Flag.debugStart);}
}

#endregion

if keyboard_check_pressed(vk_f4)
{
	window_set_fullscreen(!window_get_fullscreen());
}

if getGameFlag(Game_Flag.runTimer) && HITSTOP == 0
{
	// Increment Time
	playTime++;
	playTimeString = string_time(playTime);
}

BAIL_CODE;

manageInputBuffer();

if getGameFlag(Game_Flag.gameStart)
{
	if getInputPressed(Input.menu)
	{
		if !instance_exists(obj_pause) {inst_create(obj_pause);}
		else {instance_destroy(obj_pause);}
	}
}