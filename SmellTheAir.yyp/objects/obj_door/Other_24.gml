/// @desc 


switch(state)
{
	// Trigger
	case(ST_door.closed):
		if !entityFlag & 1 << Entity_Flag.solid
		{
			if instance_place(x, y, getPlayerInst()) {setState();}
		}
		break;
	
	// Open Door
	case(-ST_door.opening):
		setStateInst(PLAYER, ST_player.eventWalk);
		clearGameFlag(Game_Flag.useInput);
		clearGameFlag(Game_Flag.runTimer);
		break;
		
	case(ST_door.opening):
		if step < 30
		{
			step++;
			if step == 8 {sfx_at(snd_door);}
			image_index = min(step div 8, 2);
		}
		else {setState();}
		break;
	
	// Walk & Scroll
	case(-ST_door.walk):
		with PLAYER {x_speed = 1;}
		step = 0;
		break;
		
	case(ST_door.walk):
		if step < 100
		{
			step++;
			CAMERA_X = lerp(0, CAMERA_W - UNIT_PX * 2, step / 100);
		}
		else {setState();}
		break;
	
	// Close Door
	case(-ST_door.closing):
		with PLAYER {x_speed = 0;} step = 30;
		break;
		
	case(ST_door.closing):
		if step > 0
		{
			step--;
			if step == 8 {sfx_at(snd_door);}
			image_index = min(step div 8, 2);
		}
		else
		{
			setState(ST_door.closed);
			setGameFlag(Game_Flag.useInput);
			inst_create(eventInst);
		}
		break;
	
	case(-ST_door.opening2): step = 0; break;
	
	case(ST_door.opening2):
		if step < 30
		{
			step++;
			if step == 8 {sfx_at(snd_door);}
			image_index = min(step div 8, 2);
		}
		else {state = 0;}
		break;
}