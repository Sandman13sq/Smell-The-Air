/// @desc 

switch(state)
{
	case(0):
		var _spd = 0.0012;
		if getInput(Input.fire) {_spd *= 4;}
		ALPHA = approach(ALPHA, 0, _spd);
		
		if ALPHA == 0
		{
			if getInputBuffered(Input.jump, 20) 
			{
				state = 1;
				with MAIN_OBJ
				{
					audio_sound_gain(musicCurrent, 0, 830 / 60 * 1000);
				}
			}
		}
		break;
	
	case(1):
		var _spd = 0.0012;
		if getInput(Input.fire) {_spd *= 4;}
		ALPHA = approach(ALPHA, 1, _spd);
		
		if ALPHA == 1
		{
			inst_create(obj_gameover);
		}
		break;
}