/// @desc State Update

if getInput(Input.fire) {stepSpeed = 2;}

switch(state)
{
	case(ST_lightUpgrade.null): setState(); break;
	
	case(-ST_lightUpgrade.rise):
		clearGameFlag(Game_Flag.useInput);
		break;
	
	case(ST_lightUpgrade.rise):
		setAnimation(Animation_Index.light_phaseIn);
		if step < hoverTime 
		{
			if step == 0 {sfx_at(snd_upgradeStart);}
			
			step = approach(step, hoverTime, stepSpeed);
			y_offset = intpl_para2(0, -hoverHeight, step / hoverTime);
		} else {setState();}
		break;
	
	case(-ST_lightUpgrade.hover): 
		step = 50; 
		break;
	
	case(ST_lightUpgrade.hover):
		if step {step = approach(step, 0, stepSpeed);}
		else {setState();}
		break;
	
	case(-ST_lightUpgrade.fall):
		with PLAYER
		{
			drawLightColor[0] = MAIN_OBJ.lightColor[1];
			resetLightColors();
				
			part_particles_create_color(
				PART_SYS, x + x_center, y + y_center + other.y_offset,
				PART_TYPE[Part_Type.dashCircle], other.newColor, 1
				);
				
			setGameFlag(Game_Flag.lightUpgrade);
			setState(ST_player.attributes);
		}
		step = hoverTime; 
		sfx_at(snd_upgradeEnd);
		break;
		
	case(ST_lightUpgrade.fall):
		if step > 0 
		{
			step = approach(step, 0, stepSpeed); 
			y_offset = intpl_para(-hoverHeight, 0, 1 - (step / hoverTime));
		}
		else 
		{
			clearGameFlag(Game_Flag.lightUpgradePre);
			with PLAYER {setState(ST_player.move);}
			
			inst_create(obj_topText);
			sfx_at(snd_jumpLand);
			
			setGameFlag(Game_Flag.useInput);
			setGameFlag(Game_Flag.runTimer);
			
			instance_destroy();
		}
		break;
}