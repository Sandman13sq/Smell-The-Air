/// @desc Returns index corresponding to star flag
/// @arg flag
function starFlagIndex(argument0) {

	// starFlagFlag()

	enum FL_Star
	{
		allWindows = 1 << 0, 
		noWindows = 1 << 1, 
		damageless = 1 << 2, 
		pacifist = 1 << 3, 
		final = 1 << 4,
	
		secret = FL_Star.noWindows | FL_Star.damageless | FL_Star.pacifist,
	}

	switch(argument0 & 0x1F)
	{
		default: return -1;
	
		case(0): return 0;
	
		case(FL_Star.allWindows): return 1;
		case(FL_Star.noWindows): return 2;
		case(FL_Star.damageless): return 3;
		case(FL_Star.pacifist): return 4;
	
		case(FL_Star.allWindows | FL_Star.damageless): return 5;
		case(FL_Star.noWindows | FL_Star.damageless): return 6;
		case(FL_Star.pacifist | FL_Star.damageless): return 7;
	
		case(FL_Star.allWindows | FL_Star.pacifist): return 8;
		case(FL_Star.noWindows | FL_Star.pacifist): return 9;
	
		case(FL_Star.allWindows | FL_Star.damageless | FL_Star.pacifist): return 10;
		case(FL_Star.noWindows | FL_Star.damageless | FL_Star.pacifist): return 11;
	}


}
