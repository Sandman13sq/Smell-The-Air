/// @desc Local

switch(LCL_FUNCTION)
{
	default:
		event_inherited();
		break;
	
	case(L.takeDamage): 
		return checkEnemyKo(8); break;
}