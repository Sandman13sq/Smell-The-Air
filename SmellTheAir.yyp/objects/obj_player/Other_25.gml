/// @desc Locals

switch(LCL_FUNCTION)
{
	case(L.takeDamage):
		if iFrames > 0 {return 0;}
		if bumpFrames > 0 {return 0;}
		
		if state == ST_player.chargeDash {return 0;}
		
		healthPoints = approach(healthPoints, 0, LCL_DATA[0]);
		
		setGameFlag(Game_Flag.damageTaken);
		
		if healthPoints == 0
		{
			charge = 0;
			
			if place_meeting(x, y, obj_fallPlane)
			{
				setState(ST_player.defeat_fall);
				return;
			}
			else
			{
				sfx_at(snd_defeat);
				setHitStop(40);
			}
			
			clearGameFlag(Game_Flag.useInput);
		}
		else
		{
			sfx_at(snd_lightHurt);
			setHitStop(LCL_DATA[0] * 8);
		}
		
		setState(ST_player.hurt);
		
		instance_create_depth(x + x_center, y + y_center, depth + 1, obj_defeatFlash);
		resetLightColors();
		
		return healthPoints == 0;
}