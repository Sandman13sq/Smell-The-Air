/// @desc Wait

switch(state)
{
	case(Cmd.wait):
		if waitTimer {waitTimer--;}
		else {advanceEvent();}
		break;
}
