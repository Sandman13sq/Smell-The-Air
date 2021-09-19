/// @desc LCL

switch(LCL_FUNCTION)
{
	case(L.takeDamage):
		if healthPoints > 0
		{
			healthPoints -= LCL_DATA[0];
			
			if healthPoints <= 0
			{
				setState(ST_lightSwitch.rise);
				setHitStop(10);
				
				sfx_at(snd_defeat);
				
				instance_create_depth(
					lerp(bbox_left, bbox_right, 0.5),
					lerp(bbox_top, bbox_bottom, 0.5),
					depth + 1, obj_defeatFlash);
				
				var _s = 16;
				part_particles_create_region(
					PART_SYS,
					bbox_left - _s, bbox_top - _s, 
					bbox_right + _s, bbox_bottom + _s,
					PART_TYPE[Part_Type.twinkleUp], LIGHTCOLOR, 8
					);
				
			} else {shakeX = 10; sfx_at(snd_hit);};
			
			return 1;
		}
		
		return 0;
		break;
}