/// @desc State Change

if bump > 0 {bump--;}

switch(state)
{
	#region Crawl
	
	case(-ST_carpet.crawl):
		setAnimation(Animation_Index.carpet_crawl);
		if !stationary {x_speed = image_xscale;}
		break;
	
	case(ST_carpet.crawl):
		if x_speed != 0
		{
			var _xadd = 8, _x, _y = bbox_bottom;
		
			_x = bbox_left - _xadd;
			if (!tileAt(_x, _y + 8) || tileAt(_x, _y - 8))
			{
				x_speed = 1;
				image_xscale = 1;
			}
		
			_x = bbox_right + _xadd;
			if (!tileAt(_x, _y + 8) || tileAt(_x, _y - 8))
			{
				x_speed = -1;
				image_xscale = -1;
			}
		}
		
		if aggroDelay {aggroDelay--;}
		else
		{
			if collision_rectangle(x, bbox_bottom + 8, x + image_xscale * shotRange, y - 8, PLAYER, 0, 1)
			{setState(ST_carpet.whipUp);}
		}
		break;
	
	#endregion
	
	#region Whipup
	
	// Whip Up
	case(-ST_carpet.whipUp):
		setAnimation(Animation_Index.carpet_whipUp);
		x_speed = 0;
		break;
	
	case(ST_carpet.whipUp):
		if animationIsOver() {setState(ST_carpet.charge);}
		break;
	
	#endregion
	
	#region Charge
	
	case(-ST_carpet.charge):
		setAnimation(Animation_Index.carpet_charge);
		charge = 0;
		sfxCut_at(snd_carpetCharge);
		break;
	
	case(ST_carpet.charge):
		if charge < 150
		{
			if charge < 100 {if CURRENT_FRAME mod 16 == 0 {sfxCut_at(snd_carpetCharge);}}
			else {if CURRENT_FRAME mod 10 == 0 {sfxCut_at(snd_carpetCharge);}}
			
			if charge == 90 {setAnimation(Animation_Index.carpet_charge2);}
			
			part_particles_create_region(
				PART_SYS,
				bbox_left, bbox_top,
				bbox_right, bbox_bottom, 
				PART_TYPE[Part_Type.shadowParticle], c_white, 1
				);
			
			charge++;
		}
		else
		{
			setState(ST_carpet.shoot);
		}
		break;
	
	#endregion
	
	// Shoot
	case(-ST_carpet.shoot):
		sfx_at(snd_carpetShot);
		with instance_create_depth(x, y, depth, obj_carpetShot)
		{
			x_speed = other.image_xscale * 4;
		}
		
		setAnimation(Animation_Index.carpet_shoot);
		charge = 0;
		break;
	
	case(ST_carpet.shoot):
		if charge < 100
		{
			charge++;
		}
		else {aggroDelay = 100; setState(ST_carpet.crawl);}
		break;
}