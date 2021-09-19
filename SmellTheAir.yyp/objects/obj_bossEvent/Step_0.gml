/// @desc 

if canSkip
{
	if getInput(Input.fire)
	{
		stepSpeed = 3;
		with obj_shade {stepSpeed = 3;}
	}
} else {canSkip = getInputPressed(Input.fire);}

switch(state)
{
	// Wait
	case(0):
		step += stepSpeed;
		
		if step >= 50
		{
			step = 0;
			obj_bk.state = 1;
			with obj_ightStand
			{
				flashColor = c_shade;
				flashStep = 200;
			}
			setState(1);
			setStateInst(obj_shade, ST_shade.phaseIn);
			sfxCut(snd_ightSucc);
		}
		break;
	
	// Suck Background
	case(1):
		step += stepSpeed;
		
		if step < 200
		{
			if CURRENT_FRAME mod 16 == 0 {sfxCut(snd_ightSucc);}
			inst_create(obj_ightSucc);
		}
		else {setState(2); step = 0;}
		break;
	
	// Shade In
	case(2): 
		if obj_shade.healthPoints == obj_shade.healthPointsMax 
		{
			bgm(mus_boss);
			setState();
		}
		break;
	
	// Wait to start
	case(3):
		step += stepSpeed;
		
		if step >= 30 
		{
			setStateInst(obj_shade, ST_shade.fly);
			setStateInst(PLAYER, ST_player.move);
			
			setGameFlag(Game_Flag.useInput);
			setGameFlag(Game_Flag.runTimer);
			
			with obj_door
			{
				entityFlag |= 1 << Entity_Flag.solid;
			}
			
			instance_destroy();
		}
		break;
}