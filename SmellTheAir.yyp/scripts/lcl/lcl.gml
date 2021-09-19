/// @desc Runs local function
/// @arg function,*arg,*arg,...
function lcl() {

	LCL_FUNCTION = argument[0];
	LCL_DATA = array_create(argument_count - 1);
	LCL_CALLER = id;

	var a = 0;
	for (var i = 1; i < argument_count; i++)
	{
		LCL_DATA[a] = argument[i];
		a++;
	}

	return event_user(LCL_EV);


}
