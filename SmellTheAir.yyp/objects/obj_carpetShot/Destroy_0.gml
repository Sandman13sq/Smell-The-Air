/// @desc 

var _r = 20;

part_particles_create_region(
	PART_SYS,
	bbox_left - _r, bbox_top - _r, bbox_right + _r, bbox_bottom + _r,
	PART_TYPE[Part_Type.shadowParticle], c_white, 20
	);

if point_distance(x, y, CAMERA_X_CENTER, CAMERA_Y_CENTER) <= 400
{
sfx_at(snd_hit);
}