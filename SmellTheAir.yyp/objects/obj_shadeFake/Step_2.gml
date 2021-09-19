/// @desc 

BAIL_CODE

// Inherit the parent event
event_inherited();

ALPHA = obj_shade.image_alpha;

if ALPHA == 1
{
	if damageOnTouch()
	{
		doDamage(self, 1);
		return;
	}
}

updateAnimation();