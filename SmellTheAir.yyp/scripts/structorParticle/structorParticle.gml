/// @desc Particles
/// @arg init?
function structorParticle(argument0) {

#macro PART_SYS global.PartSys
#macro PART_SYS_BACK global.PartSys_Back

#macro PART_TYPE global.PartType

	if argument0
	{
		PART_SYS = part_system_create();
		part_system_depth(PART_SYS, Layer_Depth.player - 10);
	
		PART_SYS_BACK = part_system_create();
		part_system_depth(PART_SYS_BACK, Layer_Depth.player + 10);

		enum Part_Type
		{
			charge,
			shotPop,
			defeatFlash,
			dashWind,
			dashCircle,
		
			twinkle,
			twinkleUp,
			shadowParticle,
		
			bump0,
			bump1,
		}

		var t;
	
	#region Particle Types

		// Charge --------------------------------
		t = part_type_create();
		PART_TYPE[Part_Type.charge] = t;
		part_type_sprite(t, spr_chargeLight, 1, 0, 1);
		part_type_life(t, 20, 20);
		part_type_direction(t, 90, 90, 0, 0);
		part_type_speed(t, 1, 1, 0, 0);
		part_type_gravity(t, 0.1, 90);

		// Shot Pop --------------------------------
		t = part_type_create();
		PART_TYPE[Part_Type.shotPop] = t;
		part_type_sprite(t, spr_lightShotPop, 1, 1, 0);
		part_type_life(t, 10, 10);

		// Defeat Flash --------------------------------
		t = part_type_create();
		PART_TYPE[Part_Type.defeatFlash] = t;
		part_type_sprite(t, spr_defeatFlash, 1, 0, 0);
		part_type_life(t, 10, 10);
	
		// Dash Wind --------------------------------
		t = part_type_create();
		PART_TYPE[Part_Type.dashWind] = t;
		part_type_sprite(t, spr_dashWind, 1, 1, 0);
		part_type_life(t, 16, 16);
	
		// Dash Circle --------------------------------
		t = part_type_create();
		PART_TYPE[Part_Type.dashCircle] = t;
		part_type_sprite(t, spr_dashCircle, 1, 1, 0);
		part_type_life(t, 10, 10);
	
		// Shadow Particle --------------------------------
		t = part_type_create();
		PART_TYPE[Part_Type.shadowParticle] = t;
		part_type_sprite(t, spr_shadowParticle, 1, 1, 0);
		part_type_life(t, 4, 10);
		part_type_direction(t, 90, 90, 0, 0);
		part_type_speed(t, 2, 4, 0, 0);
		part_type_gravity(t, 0.2, 90);
	
		// Twinkle --------------------------------
		t = part_type_create();
		PART_TYPE[Part_Type.twinkle] = t;
		part_type_sprite(t, spr_twinkle, 1, 1, 0);
		part_type_life(t, 16, 24);
		part_type_direction(t, 270, 270, 0, 0);
		part_type_speed(t, 1, 1, 0, 0);
	
		// Twinkle Up --------------------------------
		t = part_type_create();
		PART_TYPE[Part_Type.twinkleUp] = t;
		part_type_sprite(t, spr_twinkle, 1, 1, 0);
		part_type_life(t, 16, 24);
		part_type_direction(t, 90, 90, 0, 0);
		part_type_speed(t, 1, 1, 0, 0);
	
		// Bump0 --------------------------------
		t = part_type_create();
		PART_TYPE[Part_Type.bump0] = t;
		part_type_sprite(t, spr_bumpspark0, 1, 0, 1);
		part_type_life(t, 10, 10);
	
		// Bump1 --------------------------------
		t = part_type_create();
		PART_TYPE[Part_Type.bump1] = t;
		part_type_sprite(t, spr_bumpspark1, 1, 0, 1);
		part_type_life(t, 10, 10);
	
	#endregion
	}
	else
	{
		part_system_destroy(PART_SYS_BACK);
		part_system_destroy(PART_SYS);
	}


}
