/// @desc Returns flag corresponding to star flag index
/// @arg index
function starFlagFlag(argument0) {

	// starFlagIndex()

	switch(argument0)
	{
		default: return -1;
	
		case(0): return 0;
	
		case(1): return FL_Star.allWindows;
		case(2): return FL_Star.noWindows;
		case(3): return FL_Star.damageless;
		case(4): return FL_Star.pacifist;
		case(5): return FL_Star.final;
	
		//case(5): return FL_Star.allWindows | FL_Star.damageless;
		case(6): return FL_Star.noWindows | FL_Star.damageless;
		case(7): return FL_Star.pacifist | FL_Star.damageless;
	
		case(8): return FL_Star.allWindows | FL_Star.pacifist;
		case(9): return FL_Star.noWindows | FL_Star.pacifist;
	
		case(10): return FL_Star.allWindows | FL_Star.damageless | FL_Star.pacifist;
		case(11): return FL_Star.final;
		//case(11): return FL_Star.noWindows | FL_Star.damageless | FL_Star.pacifist;
	}


}
