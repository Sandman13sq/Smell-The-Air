/// @desc 

BAIL_CODE;

switch(state)
{
	case(0):
		var _lev = lever(getInputPressed(Input.down), getInputPressed(Input.up));
		
		if _lev != 0
		{
			select[0] = loop(select[0] + _lev, 0, 3);
			sfx(snd_menuMove);
		}
		
		if getInputPressed(Input.jump)
		{
			// Clear Data
			if getInput(Input.menu) && getInput(Input.left) && getInput(Input.right)
			{
				state = 4;
			}
			// Menu Select
			else switch(select[0])
			{
				case(0): 
					state = 1; sfx(snd_menuBack); 
					setGameFlag(Game_Flag.gameStart);
					with inst_create(obj_roomTrigger) {targetRoom = rm_inside1; setState(1);}
					break;
					
				case(1): state = 2; inst_create(obj_pause); break;
				case(2): state = 3; inst_create(obj_controls); visible = false; sfx(snd_menuBack); break;
			}
		}
		break;
	
	case(2): state = 0; break;
	
	// Contorls
	case(3): break;
	
	// Erase Data
	case(4):
		var _lev = lever(getInputPressed(Input.right), getInputPressed(Input.left));
		if _lev != 0 {eraseSelect = !eraseSelect;}
		if getInputPressed(Input.jump)
		{
			if eraseSelect
			{
				var _file = file_text_open_write("settings.ini")
				
				if _file
				{
					file_text_write_string(_file, " ");
					file_text_close(_file);
				}
				game_restart();
			}
			else {state = 0;}
		}
		
		break;
}

if keyboard_check_pressed(ord("U"))
{
	starFlag++; starFlag &= 0x1F;
	starMax = 0;
	for (var i = 0; i < 8; i++) {if starFlag & 1 << i {starMax = i;};}
	alarm[0] = 1;
}

var _lev = lever(getInputPressed(Input.right), getInputPressed(Input.left));

if _lev != 0
{
	recordSelect = loop(recordSelect + _lev, 0, 6);
	recordCount = ds_list_size(recordList[recordSelect]);
}