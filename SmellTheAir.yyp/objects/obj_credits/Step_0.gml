/// @desc 

timeline_running = false;

BAIL_CODE

timeline_running = true;

if timeline_position < 1560
{
	if getInputPressed(Input.jump)
	{
		if (timeline_position mod 400) < 360
		{
			timeline_position = quantize(timeline_position, 400) + 359;
		}
	}
}

if getInputPressed(Input.fire)
{
	timeline_speed = !timeline_speed;
}

if state == 1
{
	if getInputPressed(Input.jump)
	{
		bgm_fadeout(30);
		inst_create(obj_gameover);
	}
}