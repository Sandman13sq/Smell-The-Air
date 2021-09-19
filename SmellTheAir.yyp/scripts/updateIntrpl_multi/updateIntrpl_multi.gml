/// @description  @desc Updates interplators. Returns true if all are done
/// @arg interpolator,*interpolator,*...
/// updateIntrpl(interpolator,*interpolator,*...)
function updateIntrpl_multi() {

	var _intrpl,
	    _ret = true;

	// Update all interpolators
	for (var i = 0; i < argument_count; i++)
	{
	    if !updateIntrpl(argument[i]) {_ret = false;}
	}

	return _ret;



}
