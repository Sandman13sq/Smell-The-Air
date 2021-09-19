/// @desc 

BAIL_CODE;

step++;

if step++ >= stepInterval
{
	if visible 
	{
		life--; 
		if life == 0 
		{instance_destroy(); return;}
	}
	
	step = 0; 
	visible = !visible;
}