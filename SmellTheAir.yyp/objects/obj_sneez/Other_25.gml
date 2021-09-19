/// @desc Locals

switch(LCL_FUNCTION)
{
	default: event_inherited(); break;
	
	case(L.takeDamage): 
		return checkEnemyKo(2); 
		break;
}