/// @description  @desc Returns true if interpolator has finished
/// @arg interpolator
/// intrplIsDone(interpolator)
function intrplIsDone(argument0) {

	var _intrpl = argument0;

	return _intrpl[Intrpl.timer] == _intrpl[Intrpl.timerMax];



}
