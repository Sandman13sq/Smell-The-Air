/// @desc 

if state < ds_list_size(resultList)
{
	if step++ == 25
	{
		state++;
		step = 0;
		sfx(snd_defeat);
	}
}
else
{
	if getInputPressed(Input.jump)
	{
		setStateInst(obj_bossEndEvent);
		instance_destroy();
	}
}