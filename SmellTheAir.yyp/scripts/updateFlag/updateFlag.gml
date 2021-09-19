/// @desc Sets bit if value evaluates to true
/// @arg b,value
function updateFlag(argument0, argument1) {

	if argument1
	{
		flag = flag | (1 << argument0);
	}
	else
	{
		flag = flag & ~(1 << argument0);
	}


}
