/// @desc -structor for animation
/// @arg constructor?
function structorAnimation(argument0) {

#macro ANIMATION_DATA global.AnimationData

	if argument0
	{
		ANIMATION_DATA = ds_map_create();
	
	#region enum Animation Index
	
		enum Animation_Index
		{
			light_phaseIn,
			light_idle,
			light_run,
			light_jump,
			light_shoot,
			light_runShoot,
			light_jumpShoot,
			light_dash,
			light_chargeDash,
			light_hurt,
			light_stucc,
			light_defeatBounce,
			light_defeat,
			light_credits,
		
			bat_fly,
			cap,
		
			carpet_crawl,
			carpet_whipUp,
			carpet_charge,
			carpet_charge2,
			carpet_shoot,
		
			sneez_idle,
			sneez_succ,
			sneez_stucc,
			sneez_shoot,
		
			shade_idle,
			shade_fly,
			shade_spin,
			shade_shoot,
			shade_shootFake,
			shade_slash0,
			shade_slash1,
			shade_defeat,
			shade_down,
		
			dustbunny,
		}
	
	#endregion --------------------
	
		enum Animation_Flag
		{
			keepIndex = 0, forceRestart,
		}
	
		enum Animation_Keyframe
		{
			sprite, subimage, x, y, duration, flag
		}
	
		enum Animation_Keyframe_Flag
		{
			flipX, loopHere,
		}
	
	#region Animations
	
		ANIMATION_DATA[? Animation_Index.light_phaseIn] = [
			[spr_light, 7, 0, 0, 3, 0],
			[spr_light, 11, 0, 0, 3, 0]
			];
	
		ANIMATION_DATA[? Animation_Index.light_idle] = [
			[spr_light, 0, 0, 0, 160, 0],
			[spr_light, 1, 0, 0, 2, 0]
			];
	
		ANIMATION_DATA[? Animation_Index.light_run] = [
			[spr_light, 8, 0, 0, 7, 0],
			[spr_light, 9, 0, 0, 6, 0],
			[spr_light, 10, 0, 0, 7, 0],
			[spr_light, 9, 0, 0, 6, 0],
			];
	
		ANIMATION_DATA[? Animation_Index.light_jump] = [
			[spr_light, 2, 0, 0, 0, 0]
			];
	
		ANIMATION_DATA[? Animation_Index.light_dash] = [
			[spr_light, 3, 0, 0, 0, 0]
			];
	
		ANIMATION_DATA[? Animation_Index.light_shoot] = [
			[spr_light, 4, 0, 0, 0, 0]
			];
	
		ANIMATION_DATA[? Animation_Index.light_runShoot] = [
			[spr_light, 12, 0, 0, 7, 0],
			[spr_light, 13, 0, 0, 6, 0],
			[spr_light, 14, 0, 0, 7, 0],
			[spr_light, 13, 0, 0, 6, 0],
			];
	
		ANIMATION_DATA[? Animation_Index.light_jumpShoot] = [
			[spr_light, 5, 0, 0, 0, 0]
			];
	
		ANIMATION_DATA[? Animation_Index.light_hurt] = [
			[spr_light, 6, 0, 0, 2, 0],
			[0, 0, 0, 0, 2, 0]
			];
	
		ANIMATION_DATA[? Animation_Index.light_stucc] = [
			[spr_lightStuck, 0, 0, 0, 2, 0],
			[spr_lightStuck, 1, 0, 0, 2, 0],
			[spr_lightStuck, 2, 0, 0, 2, 0],
			[spr_lightStuck, 1, 0, 0, 2, 0],
			];
	
		ANIMATION_DATA[? Animation_Index.light_defeatBounce] = [
			[spr_light, 16, 0, 0, 0, 0],
			];
		
		ANIMATION_DATA[? Animation_Index.light_defeat] = [
			[spr_light, 17, 0, 0, 0, 0],
			];
	
		ANIMATION_DATA[? Animation_Index.light_credits] = [
			[spr_light, 15, 0, 0, 80, 0],
			[spr_light, 18, 0, 0, 3, 0],
			[spr_light, 19, 0, 0, 3, 0],
			[spr_light, 18, 0, 0, 3, 0],
			];
	
		// -------------------
	
		ANIMATION_DATA[? Animation_Index.bat_fly] = [
			[spr_bat, 0, 0, 0, 2, 0],
			[spr_bat, 1, 0, 0, 2, 0]
			];
	
		ANIMATION_DATA[? Animation_Index.cap] = [
			[spr_cap, 0, 0, 0, 8, 0],
			[spr_cap, 1, 0, 0, 8, 0],
			[spr_cap, 2, 0, 0, 8, 0],
			[spr_cap, 3, 0, 0, 8, 0],
			[spr_cap, 4, 0, 0, 8, 0],
			[spr_cap, 5, 0, 0, 8, 0],
			[spr_cap, 6, 0, 0, 8, 0],
			[spr_cap, 7, 0, 0, 8, 0],
			];
	
		// -------------------
	
		ANIMATION_DATA[? Animation_Index.carpet_crawl] = [
			[spr_carpetMonster, 0, 0, 0, 8, 0],
			[spr_carpetMonster, 1, 0, 0, 8, 0]
			];
	
		ANIMATION_DATA[? Animation_Index.carpet_whipUp] = [
			[spr_carpetMonster, 2, 0, 0, 4, 0],
			];
	
		ANIMATION_DATA[? Animation_Index.carpet_charge] = [
			[spr_carpetMonster, 3, 0, 0, 4, 0],
			[spr_carpetMonster, 4, 0, 0, 4, 0]
			];
	
		ANIMATION_DATA[? Animation_Index.carpet_charge2] = [
			[spr_carpetMonster, 3, 0, 0, 2, 0],
			[spr_carpetMonster, 4, 0, 0, 2, 0]
			];
	
		ANIMATION_DATA[? Animation_Index.carpet_shoot] = [
			[spr_carpetMonster, 5, 0, 0, 0, 0]
			];
	
		// ------------------------------------------------
	
		ANIMATION_DATA[? Animation_Index.sneez_idle] = [
			[spr_sneez, 2, 0, 0, 3, 0],
			[spr_sneez, 0, 0, 0, 25, 2],
			[spr_sneez, 1, 0, 0, 25, 0]
			];
	
		ANIMATION_DATA[? Animation_Index.sneez_succ] = [
			[spr_sneez, 2, 0, 0, 4, 0],
			[spr_sneez, 3, 0, 0, 4, 2],
			];
	
		ANIMATION_DATA[? Animation_Index.sneez_stucc] = [
			[spr_sneez, 4, 0, 0, 0, 0],
			];
		
		ANIMATION_DATA[? Animation_Index.sneez_shoot] = [
			[spr_sneez, 5, 0, 0, 0, 0],
			];
	
		// ----------------------------------------------------
	
		ANIMATION_DATA[? Animation_Index.shade_idle] = [
			[spr_shade, 0, 0, 0, 3, 0],
			[spr_shade, 1, 0, 0, 3, 0],
			[spr_shade, 2, 0, 0, 3, 0]
			];
	
		ANIMATION_DATA[? Animation_Index.shade_spin] = [
			[spr_shade, 8, 0, 0, 4, 0],
			[spr_shade, 9, 0, 0, 4, 0],
			[spr_shade, 10, 0, 0, 4, 0]
			];
	
		ANIMATION_DATA[? Animation_Index.shade_fly] = [
			[spr_shade, 13, 0, 0, 5, 0],
			[spr_shade, 12, 0, 0, 5, 0],
			];
	
		ANIMATION_DATA[? Animation_Index.shade_shoot] = [
			[spr_shade, 3, 0, 0, 4, 0],
			[spr_shade, 7, 0, 0, 4, 0],
			];
	
		ANIMATION_DATA[? Animation_Index.shade_shootFake] = [
			[spr_shade, 3, 0, 0, 5, 0],
			[spr_shade, 7, 0, 0, 5, 0],
			];
	
		ANIMATION_DATA[? Animation_Index.shade_slash0] = [
			[spr_shade, 4, 0, 0, 0, 0],
			];
	
		ANIMATION_DATA[? Animation_Index.shade_slash1] = [
			[spr_shade, 5, 0, 0, 3, 0],
			[spr_shade, 6, 0, 0, 0, 0],
			];
	
		ANIMATION_DATA[? Animation_Index.shade_defeat] = [
			[spr_shade, 14, 0, 0, 0, 0],
			];
	
		ANIMATION_DATA[? Animation_Index.shade_down] = [
			[spr_shade, 15, 0, 0, 0, 0],
			];
	
		// ----------------------------------------------------
	
		ANIMATION_DATA[? Animation_Index.dustbunny] = [
			[spr_dustbunny, 0, 0, 0, 4, 0],
			[spr_dustbunny, 1, 0, 0, 4, 0],
			[spr_dustbunny, 2, 0, 0, 4, 0],
			[spr_dustbunny, 1, 0, 0, 4, 0]
			];
		
	#endregion
	}
	else
	{
		ds_map_destroy(ANIMATION_DATA);
	}


}
