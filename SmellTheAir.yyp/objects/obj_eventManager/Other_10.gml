/// @desc Command Runner

var _running = true;

while _running
{
	cmdCurrent = ds_stack_pop(cmdQueue);
	
	switch(cmdCurrent)
	{
		default:
			cout_f("Unknown Event (%d)", cmdCurrent);
		case(Cmd.null):
			_running = false;
			instance_destroy();
			break;
		
		case(Cmd.wait): 
			setState(Event_State.wait);
			waitTimer = getEventVal(); 
			_running = false;
			break;
		
		case(Cmd.gFlagSet): setGameFlag( getEventVal() ); break;
		case(Cmd.gFlagClear): setGameFlag( getEventVal() ); break;
		
		case(Cmd.state):
			var _inst = getEventVal(), _state = getEventVal();
			with _inst {setState(_state);}
			break;
	}
}