/// @desc Returns velocity using position, time, and acceleration
/// @arg initial_position,final_position,time,acceleration
function phys_findVelocity(argument0, argument1, argument2, argument3) {

	/*
		xF = xI + vt + (1/2)at^2
		xF = xI + (v * t) + (0.5 * a * t * t)
	
		v = (xF - xI - 0.5 * a * t * t) / t;
		a = (xF - xI - v * t) * 2 / (t * t);
	*/

	var _xI = argument0,
		_xF = argument1,
		_t = argument2,
		_a = argument3;

	return (_xF - _xI - 0.5 * _a * _t * _t) / _t;


}
