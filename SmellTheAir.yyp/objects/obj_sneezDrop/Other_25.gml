/// @desc 

switch(LCL_FUNCTION)
{
	default: event_inherited(); break;
	
	case(L.takeDamage):
		if LCL_DATA[0] > 0
		{
			instance_destroy();
		}
		return 1;
		break;
}