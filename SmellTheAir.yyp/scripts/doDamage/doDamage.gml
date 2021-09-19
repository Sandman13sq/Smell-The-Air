/// @desc Does damage
/// @arg inst,damage
function doDamage(argument0, argument1) {

	with argument0
	{
		if healthPoints > 0 || healthPointsMax == 0
		{
			lcl_on(argument0, L.takeDamage, argument1);
			return 1;
		}
	
		return 0;
	}


}
