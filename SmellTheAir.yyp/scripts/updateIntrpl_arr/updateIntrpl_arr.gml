/// @description  @desc Updates array of interplators. Returns true if all are done
/// @arg interpolator,*interpolator,*...
/// updateIntrpl_arr(interpolator_array)
function updateIntrpl_arr(argument0) {

	var _intrpl = argument0,
	    _l = array_length_1d(_intrpl),
	    _ret = true;

	// Update all interpolators
	for (var i = 0; i < _l; i++)
	{
	    if !updateIntrpl(_intrpl[i]) {_ret = false;}
	}

	return _ret;



}
