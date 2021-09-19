/// @desc Locales

switch(LCL_FUNCTION)
{
	default:
		return event_inherited();
	
	case(L.takeDamage):
		if checkEnemyKo(2) {return 1;}
		else
		{
			image_index = 2;
			
			x_speed *= 0.2; 
			y_speed *= 0.2; 
			setState(ST_bat.stun); 
		}
		break;
}