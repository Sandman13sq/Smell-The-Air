/// @desc 

#macro EVENT obj_eventManager

enum Cmd
{
	null,
	
	wait,
	
	gFlagSet,
	gFlagClear,
	gFlagJump,
	
	transport,
	
	state,
}

enum Event_State
{
	running,
	wait,
	transport
}

cmdQueue = ds_queue_create();
valQueue = ds_queue_create();

cmdCurrent = 0;
state = 0;

waitTimer = 0;