/// @desc Creates particles in region
/// @arg part_sys,x1,y1,x2,y2,part_type,color,number
function part_particles_create_region(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7) {

	repeat(argument7)
	{
		part_particles_create_color(
			argument0,
			irandom_range(argument1, argument3),
			irandom_range(argument2, argument4),
			argument5,
			argument6, 1
			);
	}


}
