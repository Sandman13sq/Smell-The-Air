/// @desc Runs local function
/// @arg inst,function,*arg,*arg,...
function lcl_on() {

	LCL_FUNCTION = argument[1];
	LCL_DATA = array_create(argument_count - 2);
	LCL_CALLER = id;

	var a = 0;
	for (var i = 2; i < argument_count; i++)
	{
		LCL_DATA[a] = argument[i];
		a++;
	}

	with argument[0]
	{
		return event_user(LCL_EV);
	}


}
