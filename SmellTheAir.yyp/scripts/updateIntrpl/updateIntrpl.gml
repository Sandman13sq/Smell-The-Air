/// @description  @desc Updates interplator. Returns true if done
/// @arg interpolator
/// updateIntrpl(interpolator)
function updateIntrpl(argument0) {

	/*
	    Since this returns true when finished,
	    These interpolators can be used as timers
    
	    Like so: if updateIntrpl(intrpl) { ... }
	*/

	var _intrpl = argument0;

	if _intrpl[Intrpl.timer] < _intrpl[Intrpl.timerMax]
	{
	    /*
	        Using "@" here ensures that a new array isn't recreated
	        Meaning the value of the array is directly changed
        
	        The "@" can be used outside of scripts too
	    */
    
	    _intrpl[@ Intrpl.timer]++;
    
	    var _amt = _intrpl[Intrpl.timer] / _intrpl[Intrpl.timerMax];
	    _intrpl[@ Intrpl.pos] = _amt;
    
	    // Update value
	    switch(_intrpl[Intrpl.type])
	    {
	        case(Intrpl.tyLinear):
	            _intrpl[@ Intrpl.value] = lerp(
	                _intrpl[Intrpl.startVal], _intrpl[Intrpl.endVal], _amt);
	            break;
        
	        case(Intrpl.tyEaseIn):
	            _intrpl[@ Intrpl.value] = intrpl_para_x(
	                _intrpl[Intrpl.startVal], _intrpl[Intrpl.endVal], _amt, 2);
	            break;
        
	        case(Intrpl.tyEaseOut):
	            _intrpl[@ Intrpl.value] = intrpl_para_x(
	                _intrpl[Intrpl.startVal], _intrpl[Intrpl.endVal], _amt, -2);
	            break;
        
	        case(Intrpl.tyEase):
	            _intrpl[@ Intrpl.value] = intrpl_para2(
	                _intrpl[Intrpl.startVal], _intrpl[Intrpl.endVal], _amt);
	            break;
        
	        case(Intrpl.tyArc):
	            _intrpl[@ Intrpl.value] = intrpl_arc(
	                _intrpl[Intrpl.startVal], _intrpl[Intrpl.endVal], _amt);
	            break;
	    }
    
	    // Timer is not done
	    return false;
	}

	// Timer is done
	return true;



}
