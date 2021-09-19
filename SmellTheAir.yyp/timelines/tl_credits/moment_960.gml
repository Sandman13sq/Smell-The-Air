/// @desc shoot

with element[0]
{
	setAnimation(Animation_Index.sneez_shoot);
	shaking = 0;
	
	var _x = x + image_xscale * 10, _y = y - 12,
		_facingRight = image_xscale == 1, _l = 3,
		_angle = _facingRight? [-10, 45]: [190, 135];
		
	part_particles_create_color(
		PART_SYS, _x, _y, PART_TYPE[Part_Type.dashCircle], c_sneez, 1);
		
	for (var i = 0; i < _l; i++)
	{
		with instance_create_depth(_x, _y, depth - 5, obj_sneezDrop)
		{
			direction = lerp(_angle[0], _angle[1], i / (_l - 1));
		}
	}
		
}
