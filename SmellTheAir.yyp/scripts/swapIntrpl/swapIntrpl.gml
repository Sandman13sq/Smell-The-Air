/// @description  @desc Swaps start and end values of interpolator and resets time
/// @arg interpolator,*time,*type
/// swapIntrpl(interpolator,*time,*type)
function swapIntrpl() {

	var _intrpl = argument[0];

	if argument_count > 1 {_intrpl[@ Intrpl.timerMax] = argument[1];
	if argument_count > 2 {_intrpl[@ Intrpl.type] = argument[2];
	}}

	_intrpl[@ Intrpl.pos] = 0;

	// Swap values
	var _temp = _intrpl[Intrpl.startVal];
	_intrpl[@ Intrpl.startVal] = _intrpl[Intrpl.endVal];
	_intrpl[@ Intrpl.endVal] = _temp;

	_intrpl[@ Intrpl.timer] = 0;

	// Jump to end if time is 0
	if _intrpl[Intrpl.timerMax] == 0
	{
	    _intrpl[@ Intrpl.value] = _end;
	    _intrpl[@ Intrpl.pos] = 1;
	}



}
