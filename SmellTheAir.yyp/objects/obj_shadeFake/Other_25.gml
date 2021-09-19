/// @desc 

switch(LCL_FUNCTION)
{
	case(L.takeDamage):
		if ALPHA != 1 {return 0;}
		
		setHitStop(STALL_DEFEAT);
		part_particles_create_color(
			PART_SYS,
			lerp(bbox_left, bbox_right, 0.5),
			lerp(bbox_top, bbox_bottom, 0.5),
			PART_TYPE[Part_Type.dashCircle], c_gray, 1
			);
		
		sfx_at(snd_shadeFake);
		
		instance_create_depth(
			lerp(bbox_left, bbox_right, 0.5),
			lerp(bbox_top, bbox_bottom, 0.5),
			depth, obj_dustbunny);
		
		instance_destroy();
		break;
}