/// @desc 

BAIL_CODE;

if lifeMax > 0
{
	if life > 0 
	{
		life--;
		
		if life <= (lifeMax div 4)
		{
			visible = life div 2 mod 2;
		}
	}
	else {instance_destroy(); return;}
}

if tileAt(x, y + y_down)
{
	y = tilePos(x, y + y_down, Tile_Side.top) - y_down;
	pickupDelay = 0;
	
	if y_speed >= 1.5 {sfx_at(snd_healthDrop, x, y);}
	
	y_speed = 0;
}
else
{
	y_speed += y_acc;
}

if pickupDelay {pickupDelay--;}
else
{
	var _inst = instance_place(x, y, PLAYER);
	
	if _inst
	{
		if _inst.healthPoints > 0
		{
			setHitStop(10 + healthPoints * 2);
		
			with _inst
			{
				healthPoints = approach(healthPoints, healthPointsMax, other.healthPoints);
			}
		
			sfx_at(snd_heal, x, y);
		
			instance_destroy();
		}
	}
}

imageStep++;
image_index = imageStep div 4;

y += y_speed;