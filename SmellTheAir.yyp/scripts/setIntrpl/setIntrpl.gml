/// @description  @desc Resets interploator value
/// @arg interpolator,start,end,time,type
/// setIntrpl(interpolator,start,end,time,type)
function setIntrpl(argument0, argument1, argument2, argument3, argument4) {

	var _intrpl = argument0,
	    _start = argument1,
	    _end = argument2,
	    _time = argument3,
	    _type = argument4;

	_intrpl[@ Intrpl.pos] = 0;
	_intrpl[@ Intrpl.startVal] = _start;
	_intrpl[@ Intrpl.endVal] = _end;
	_intrpl[@ Intrpl.timer] = 0;
	_intrpl[@ Intrpl.timerMax] = _time;
	_intrpl[@ Intrpl.type] = _type;

	// Jump to end if time is 0
	if _intrpl[Intrpl.timerMax] == 0
	{
	    _intrpl[@ Intrpl.value] = _end;
	    _intrpl[@ Intrpl.pos] = 1;
	}



}
