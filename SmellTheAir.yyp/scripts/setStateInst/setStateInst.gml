/// @desc Sets state in object
/// @arg inst,*state
function setStateInst() {

	with argument[0]
	{
		if argument_count > 1 {setState(argument[1]);}
		else {setState()}
	}


}
