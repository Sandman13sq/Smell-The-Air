/// @desc 

depth = 0;

playTime = MAIN_OBJ.playTime;

state = 0;
step = 0;

resultList = ds_list_create();

ds_list_add(resultList,
	["GAME COMPLETE!", LIGHTCOLOR],
	["TOTAL TIME: " + string_time(playTime), LIGHTCOLOR],
	);

if !getGameFlag(Game_Flag.debugStart)
{
	setGameFlag(Game_Flag.completedOnce);
	
	var _flag = 0;
	if getGameFlag(Game_Flag.allWindows) {_flag |= FL_Star.allWindows;}
	if getGameFlag(Game_Flag.noWindows) {_flag |= FL_Star.noWindows;}
	if !getGameFlag(Game_Flag.damageTaken) {_flag |= FL_Star.damageless;}
	if !getGameFlag(Game_Flag.enemyDefeated) {_flag |= FL_Star.pacifist;}
	
	//if _flag & (FL_Star.pacifist | FL_Star.noWindows | FL_Star.damageless)
	
	if checkRecord(playTime, _flag)
	{
		ds_list_add(resultList, ["NEW RECORD!!", c_aqua]);
	}
	
	if playTime < time_val(1, 30, 0) {ds_list_add(resultList, ["SUB 1:30:00, AMAZING!!", c_orange]);}
	else if playTime < time_val(2, 0, 0) {ds_list_add(resultList, ["SUB 2:00:00, NICE!!", c_lime]);}
	
	if getGameFlag(Game_Flag.allWindows) {ds_list_add(resultList, ["ALL WINDOWS OPENED!!", c_white]);}
	if getGameFlag(Game_Flag.noWindows) {ds_list_add(resultList, ["NO WINDOWS OPENED!!", c_white]);}

	if !getGameFlag(Game_Flag.damageTaken) {ds_list_add(resultList, ["NO DAMAGE TAKEN!!", c_white]);}
	if !getGameFlag(Game_Flag.enemyDefeated) 
	{ds_list_add(resultList, ["OH YOU AND YOUR PACIFIST WAYS~", getGameFlag(Game_Flag.enemyDamaged)? c_white: c_fuchsia]);}
}

// Defeat shade and lose at the same time
if obj_player.healthPoints <= 0
{ds_list_add(resultList, ["\nWAIT, SOMETHING'S OFF...", c_white]);}
else {ds_list_add(resultList, ["\nGOOD JOB!", LIGHTCOLOR]);}