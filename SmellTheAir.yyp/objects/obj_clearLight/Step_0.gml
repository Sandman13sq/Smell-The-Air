/// @desc 

BAIL_CODE

if step < 2 {step++; return;} 
else 
{
	step = 0;
	var _dist = 1; cellXL -= _dist; cellXR += _dist;
	
	var _end = true;

	if cellXL > -range
	{
		_end = false;
		for (var i = 0; i < STAGE_H; i++)
		{
			for (var j = 0; j < range; j++)
			{
				lightArea_brighten(cellXL + j, i, 1);
			}
		}
	}
	
	if cellXR < STAGE_W + range
	{
		_end = false;
		for (var i = 0; i < STAGE_H; i++)
		{
			for (var j = 0; j < range; j++)
			{
				lightArea_brighten(cellXR - j, i, 1);
			}
		}
	}
	
	if _end
	{
		instance_destroy();
	}

}