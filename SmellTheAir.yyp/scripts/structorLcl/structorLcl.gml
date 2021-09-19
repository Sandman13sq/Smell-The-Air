/// @desc Structor for local functions
/// @arg constructor?
function structorLcl(argument0) {

	/*
		Diet version of method implementation
		(Missing stack to keep track of arguments
			meaning no nested lcl calls)
	*/

#macro LCL_EV 15
#macro LCL_FUNCTION global.LCL_Function
#macro LCL_DATA global.LCL_Data
#macro LCL_CALLER global.LCL_Caller

#region Local

	enum L
	{
		takeDamage,
		landOnTop,
	}

#endregion

	if argument0
	{
		LCL_FUNCTION = -1;
		LCL_DATA = [];
		LCL_CALLER = noone;
	}
	else
	{
	
	}


}
