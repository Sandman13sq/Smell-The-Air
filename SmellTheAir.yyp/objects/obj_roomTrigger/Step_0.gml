/// @desc Transition on Touch

switch(state)
{
	case(0):
		if place_meeting(x, y, PLAYER)
		{
			setState(1);
			
			clearGameFlag(Game_Flag.useInput);
			clearGameFlag(Game_Flag.runTimer);
			setGameFlag(Game_Flag.pauseAction);
			
			if !getGameFlag(Game_Flag.debugStart)
			&& !getGameFlag(Game_Flag.allWindows)
			&& !getGameFlag(Game_Flag.noWindows)
			{
				if room == rm_inside2 && noWindowCheck
				{
					// All Windows Closed
					if ds_map_size(WINDOW_MAP) == 0
					{
						setGameFlag(Game_Flag.noWindows);
						sfx(snd_allClear);
					}
				}
			}
		}
		break;
	
	case(1):
		if fadePosition < 1
		{
			fadePosition = approach(fadePosition, 1, 0.05);
		}
		else
		{
			persistent = true;
			setSpawnIndex(spawnIndex);
			room_goto(targetRoom);
			setState(2);
		}
		break;
	
	case(2):
		if room == targetRoom {setState(3);}
		break;
	
	case(3):
		if fadePosition != 0
		{
			fadePosition = approach(fadePosition, 0, 0.05);
		}
		else
		{
			if getGameFlag(Game_Flag.levelStart)
			&& !getGameFlag(Game_Flag.lightUpgradePre)
			{
				setGameFlag(Game_Flag.useInput);
				setGameFlag(Game_Flag.runTimer);
			}
			clearGameFlag(Game_Flag.pauseAction);
			instance_destroy();
		}
		break;
}