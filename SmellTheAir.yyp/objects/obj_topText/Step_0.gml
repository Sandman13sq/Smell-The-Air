/// @desc 

COLOR = c_white;

switch(state)
{
	case(0):
		with PLAYER
		{
			if getFlag(Player_Flag.chargeDashed)
			{
				other.state = 1;
				other.flashColor = c_yellow;
				other.flashStep = 140;
			}
		}
		
		if life > 0 {life--;}
		else {instance_destroy();}
		break;
	
	case(1):
		if flashStep == 0
		{
			instance_destroy();
		}
		break;
}

if flashStep > 0
{
	if (flashStep div 2) mod 2
	{
		COLOR = flashColor;
	}
	
	flashStep--;
}

if shakeStep > 0
{
	shakeStep--;
	//x = xstart + 3 * getShakeX(shakeStep);
	
	if shakeStep == 0 {x = xstart;}
}