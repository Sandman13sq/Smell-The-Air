/// @desc pop bunny

with element[0]
{
	with obj_carpetShot
	{
		life = 0;
	}
}

instance_destroy(element[7]);
creditsSetAnimation(7, Animation_Index.dustbunny, 600, 190, 255, 190, 40);
creditsSet(6, "Dustbunny", 255, 500, 255, 144, 40);

with element[7]
{
	timer = timerMax;
}