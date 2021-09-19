/// @description  @desc Sets interploator value from 0 to 1
/// @arg interpolator,time_[-1_to_flip_start/end],*type
/// unitIntrpl(interpolator,time_[-1_to_flip_start/end],*type)
function unitIntrpl() {

	var _intrpl = argument[0],
	    _time = argument[1];

	if argument_count > 2 {_intrpl[@ Intrpl.type] = argument[2];}
	else {_intrpl[@ Intrpl.type] = Intrpl.tyLinear;}

	_intrpl[@ Intrpl.pos] = 0;
	_intrpl[@ Intrpl.timer] = 0;

	// Normal
	if _time > 0
	{
	    _intrpl[@ Intrpl.startVal] = 0;
	    _intrpl[@ Intrpl.endVal] = 1;
	    _intrpl[@ Intrpl.timerMax] = _time;
	}
	// Start = 1, End = 0
	else
	{
	    _intrpl[@ Intrpl.startVal] = 1;
	    _intrpl[@ Intrpl.endVal] = 0;
	    _intrpl[@ Intrpl.timerMax] = -_time;
	}

	// Jump to end if time is 0
	if _intrpl[Intrpl.timerMax] == 0
	{
	    _intrpl[@ Intrpl.value] = _intrpl[@ Intrpl.endVal];
	    _intrpl[@ Intrpl.pos] = 1;
	}



}
