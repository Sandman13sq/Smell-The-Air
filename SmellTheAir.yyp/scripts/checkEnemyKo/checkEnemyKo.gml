/// @desc Enemy Ko Script. Returns 1 if defeated
/// @arg image_index,*hitStop
function checkEnemyKo() {

	event_inherited();

	if healthPoints == 0
	{
		createEnemyKo(argument[0]);
	
		var _hitStop = STALL_DEFEAT;
		if argument_count > 1 {_hitStop = argument[1];}
	
		instance_create_depth(x, y, depth + 1, obj_defeatFlash);
		setHitStop(_hitStop);
	
		sfx_at(snd_defeat, x, y);
	
		setGameFlag(Game_Flag.enemyDefeated);
		setGameFlag(Game_Flag.enemyDamaged);
	
		instance_destroy();
		return 1;
	}
	else
	{
		setGameFlag(Game_Flag.enemyDamaged);
		sfx_at(snd_hit, x, y);
	}

	return 0;


}
