/// @desc Local Function

switch(LCL_FUNCTION)
{
	case(L.takeDamage):
		healthPoints = approach(healthPoints, 0, LCL_DATA[0]);
		stun = 4;
		
		if healthPoints == 0
		{
			if healthDrop 
			&& getRNG() mod 2 == 0
			{
				dropHealth(healthDrop);
			}
		}
		
		return healthPoints == 0;
}