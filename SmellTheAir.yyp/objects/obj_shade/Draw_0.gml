/// @desc 

if boolStep(iFrames, 4) == 0
|| state == ST_shade.fake_appear
{
	// Inherit the parent event
	event_inherited();
}

if DEBUG
{
	draw_set_align(0, 0);

	draw_string_list(x, y, 
		state,
		step,
		ALPHA,
		intToHex(COLOR, 6)
		);
}