/// @desc 

event_inherited();

depth = 0;

image_speed = 0;

state = ST_window.closed;
imageStep = 0;

if getGameFlag(Game_Flag.noWindows)
{
	state = 0;
}

enum ST_window
{
	null,
	closed,
	opening,
	open,
}