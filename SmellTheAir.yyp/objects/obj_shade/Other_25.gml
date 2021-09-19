/// @desc LCL

switch(LCL_FUNCTION)
{
	case(L.takeDamage):
		if !shootable return 0;
		if iFrames > 0 return 0;
		
		if healthPoints > 0
		{
			LCL_DATA[0] = min(LCL_DATA[0], 2);
			
			event_inherited();
			
			instance_create_depth(x + x_center, y + y_center, depth + 1, obj_defeatFlash);
			
			if healthPoints == 0
			{
				setHitStop(30);
				sfx_at(snd_defeat);
				setState(ST_shade.defeat_air);
			}
			else
			{
				setHitStop(STALL_DEFEAT);
				iFrames = iFrameTime;
				sfx_at(snd_defeat);
			}
		}	
		break;
}