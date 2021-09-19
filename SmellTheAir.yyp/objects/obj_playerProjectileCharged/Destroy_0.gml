/// @desc 

// Connected with something
if life > 0
{
	var _s, _l, _angle;
	
	_s = 20; _l = 8;
	for (var i = 0; i < _l; i++)
	{
		_angle = 360 * (i / _l);
		
		part_particles_create_color(
			PART_SYS,
			x + lengthdir_x(_s, _angle),
			y + lengthdir_y(_s, _angle),
			PART_TYPE[Part_Type.twinkleUp],
			COLOR, 1
			);
	}
	
	_s *= 0.5; _l = 4;
	for (var i = 0; i < _l; i++)
	{
		_angle = 360 * (i / _l) + 45;
		
		part_particles_create_color(
			PART_SYS, 
			x + lengthdir_x(_s, _angle),
			y + lengthdir_y(_s, _angle),
			PART_TYPE[Part_Type.twinkleUp],
			COLOR, 1
			);
	}
}

// Inherit the parent event
event_inherited();
