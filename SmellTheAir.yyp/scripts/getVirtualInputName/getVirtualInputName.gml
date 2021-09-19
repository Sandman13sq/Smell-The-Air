/// @desc Returns name of input
/// @arg index
function getVirtualInputName(argument0) {

	switch(argument0)
	{
		default: return chr(argument0);
	
		case(186): return ";";
		case(188): return "<";
		case(190): return ">";
		case(222): return "'";
	
		case(vk_left): return "Left";
		case(vk_right): return "Right";
		case(vk_up): return "Up";
		case(vk_down): return "Down";
	
		case(vk_space): return "Space";
		case(vk_enter): return "Enter";
		case(vk_alt): return "Alt";
		case(vk_control): return "Control";
		case(vk_shift): return "Shift";
		case(vk_rshift): return "RShift";
		case(vk_lshift): return "LShift";
		case(vk_tab): return "Tab";
	
		// Gamepad
		case(gp_face1): return "GP Face1";
		case(gp_face2): return "GP Face2";
		case(gp_face3): return "GP Face3";
		case(gp_face4): return "GP Face4";
	
		case(gp_padd): return "GP Down";
		case(gp_padu): return "GP Up";
		case(gp_padr): return "GP Right";
		case(gp_padl): return "GP Left";
	
		case(gp_shoulderl): return "GP ShoulderLT";
		case(gp_shoulderlb): return "GP ShoulderLB";
		case(gp_shoulderr): return "GP ShoulderRT";
		case(gp_shoulderrb): return "GP ShoulderRB";
	
		case(gp_select): return "GP Select";
		case(gp_start): return "GP Start";
		case(gp_stickl): return "GP StickL";
		case(gp_stickr): return "GP StickR";
	
	}


}
