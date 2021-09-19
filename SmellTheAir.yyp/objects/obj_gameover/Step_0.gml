/// @desc 

if fadePosition < 1
{
	fadePosition = approach(fadePosition, 1, 0.05);
}
else if (delay--) <= 0
{
	game_restart();
}