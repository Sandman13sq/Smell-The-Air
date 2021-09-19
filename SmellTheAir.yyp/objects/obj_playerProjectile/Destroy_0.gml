/// @desc 

with PLAYER
{
	shotCount -= other.shotValue;
}

part_particles_create_color(
	PART_SYS, x, y, PART_TYPE[Part_Type.shotPop], c_white, 1);