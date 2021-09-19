/// @desc State

switch(state)
{
	// Wait
	case(-1):
		step = 0;
		PLAYER.x_speed = 0;
		break;
	
	case(1):
		if (step++) == 130
		{
			setState();
		}
		else
		{
			var _x;
			
			_x = CAMERA_X + 100;
			
			with PLAYER
			{
				if x != _x 
				{
					x_speed = pol(_x - x) * 2;
					
					if diff(x, _x) <= 4
					{
						x_speed = 0;
						x = _x;
						updateFlag(Player_Flag.facingRight, x < obj_shade.x);
					}
				}
			}
		}
		break;
	
	// Fix Sky
	case(-2):
		obj_bk.state = 2;
		step = 0;
		break;
	
	case(2):
		if getInput(Input.fire) {step += 4;}
		
		if (step++) < 200
		{
			if step mod 18 == 0 {sfxCut(snd_ightUnsucc);}
			with inst_create(obj_ightSucc) {flip = 1;}
			
			if !shadeLeave
			{
				if step >= 100
				{
					setStateInst(obj_shade, ST_shade.defeat_idle);
					shadeLeave = 1;
				}
			}
		}
		else {setState(); step = 0;}
		break;
	
	// Shade Leave
	case(-3):
		step = 40;
		break;
	
	case(3):
		if (step--) == 0 {setState();}
		break;
	
	// Light Walk
	case(-4):
		
		break;
	
	case(4):
		_x = CAMERA_X_CENTER;
		
		if getPlayerX() != _x 
		{
			with PLAYER
			{
				x_speed = pol(_x - x) * 2;
					
				if diff(x, _x) < 2
				{
					x_speed = 0;
					x = _x;
					setFlag(Player_Flag.facingRight);
				}
			}
		}
		else {setState();}
		break;
	
	// Jump
	case(-5):
		with PLAYER
		{
			x_speed = 0;
			y_speed = -5;
			setAnimation(Animation_Index.light_jump);
			sfx_at(snd_jump);
		}
		break;
	
	case(5):
		if PLAYER.y_speed >= 0
		setState();
		break;
	
	// End Screen
	case(-6):
		setGameFlag(Game_Flag.pauseAction);
		bgm(mus_win, 0);
		inst_create(obj_endScreen);
		break;
	
	// Leave
	case(-7):
		if !getGameFlag(Game_Flag.noWindows)
		&& !getGameFlag(Game_Flag.allWindows)
		{
			inst_create(obj_gameover);
			instance_destroy();
		}
		else
		{
			step = 0;
			clearGameFlag(Game_Flag.pauseAction);
			with rightEndDoor
			{
				setState(ST_door.opening2);
			}
		}
		break;
	
	case(7):
		if (step++) == 50 {setState();}
		break;
	
	case(8):
		_x = room_width;
		
		if getPlayerX() < _x 
		{
			with PLAYER
			{
				x_speed = pol(_x - x) * 2;
					
				if diff(x, _x) < 2
				{
					x_speed = 0;
					x = _x;
					setFlag(Player_Flag.facingRight);
				}
			}
			
			with obj_door {entityFlag &= ~(1 << Entity_Flag.solid);}
		}
		else
		{
			with inst_create(obj_roomTrigger)
			{
				if getGameFlag(Game_Flag.enemyDefeated) {targetRoom = rm_credits;}
				else {targetRoom = rm_end;}
				
				setState(1);
			}
		}
		break;
}