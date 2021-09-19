/// @description  @desc Creates "object" for interpolation
/// @arg start,end,time,type
/// makeIntrpl(start,end,time,type)
function makeIntrpl(argument0, argument1, argument2, argument3) {

	/*
	    Current value is stored at intrpl[0]
	    Access it through something like: x = intrpl[0]
	    Use updateIntrpl(intrpl) to progress the interpolation
    
	    Basic Setup
	    [value, position, start, end, timer, timerMax, type]
	       0       1        2     3     4        5       6
	*/

	enum Intrpl
	{
	    // Basic Variables
	    value, pos, startVal, endVal, timer, timerMax, type,
    
	    // Type
	    tyLinear = 0, 
	    tyEase,
	    tyEaseIn,
	    tyEaseOut,
	    tyInstant,
	    tyArc,
	}

	var _start = argument0,
	    _end = argument1,
	    _time = argument2,
	    _type = argument3;

	var _intrpl = array_create(8);

	_intrpl[Intrpl.value] = _start;
	_intrpl[Intrpl.pos] = 0;
	_intrpl[Intrpl.startVal] = _start;
	_intrpl[Intrpl.endVal] = _end;
	_intrpl[Intrpl.timer] = 0;
	_intrpl[Intrpl.timerMax] = _time;
	_intrpl[Intrpl.type] = _type;

	return _intrpl;



}
