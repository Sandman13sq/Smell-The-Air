/// @desc 

switch(LCL_FUNCTION)
{
	case(L.takeDamage):
		if !checkEnemyKo(3)
		{
			// Slow Down
			x_speed *= 0.8;
			y_speed *= 0.8;
		}
		break;
}