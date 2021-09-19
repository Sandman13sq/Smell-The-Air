/// @desc 

if state == -1 {state = 0; return;}

var _lever = lever(getInputPressed(Input.down), getInputPressed(Input.up));

switch(state)
{
	case(0):
		if getInputPressed(Input.fire) || getInputPressed(Input.menu) 
		{instance_destroy(); return;}
		
		if _lever != 0 {select = loop(select + _lever, 0, pauseStringCount); sfx(snd_menuMove);}
		
		var _volLever = lever(getInput(Input.right), getInput(Input.left));
		
		if !getInput(Input.jump) && (CURRENT_FRAME mod 6) != 0 {_volLever = 0;}
		
		if _volLever != 0
		{
			switch(select)
			{
				case(0): 
					VOLUME_ALL = clamp(VOLUME_ALL + _volLever, 0, 100);
					audio_master_gain(VOLUME_ALL / 100);
					break;
				
				case(1): 
					VOLUME_BGM = clamp(VOLUME_BGM + _volLever, 0, 100);
					audio_sound_gain(MAIN_OBJ.musicCurrent, VOLUME_BGM / 100, 1);
					break;
				
				case(2): 
					VOLUME_SFX = clamp(VOLUME_SFX + _volLever, 0, 100);
					break;
			}
		}
		
		if select == 3
		{
			var _selLever = lever(getInputPressed(Input.right), getInputPressed(Input.left));
			
			if _selLever != 0
			{
				cameraSize = clamp(cameraSize + _selLever, 0, resCount - 1);
				sfx(snd_menuMove);
			}
		}
		
		if getInputPressed(Input.jump)
		{
			switch(select)
			{
				// S
				case(3):
					with MAIN_OBJ
					{
						cameraSize = other.cameraSize;
						event_user(0);
					}
					break;
				
				// Restart
				case(4): 
					state = 1;
					selectString = "RETURN TO TITLE SCREEN?"; 
					selectBool = 0;
					sfx(snd_menuBack);
					break;
				
				// Exit Game
				case(5): 
					state = 2;
					selectString = "CLOSE THE GAME?"; 
					selectBool = 0;
					sfx(snd_menuBack);
					break;
				
				// Return to game
				case(6):
					instance_destroy();
					break;
			}
		}
		break;
	
	default:
		if getInputPressed(Input.left) || getInputPressed(Input.right)
		|| getInputPressed(Input.up) || getInputPressed(Input.down)
		{
			selectBool = !selectBool;
			sfx(snd_menuMove);
		}
		
		var _option = -1;
		
		if getInputPressed(Input.jump) {_option = selectBool;}
		if getInputPressed(Input.fire) {_option = 0}
		
		if _option != -1
		{
			// "Yes" option
			if _option == 1
			{
				switch(state)
				{
					// Restart
					case(1): game_restart(); break;
				
					// Exit
					case(2): game_end(); break;
				}
			}
			// "No" option
			else {state = 0; sfx(snd_menuBack);}
		}
		break;
}