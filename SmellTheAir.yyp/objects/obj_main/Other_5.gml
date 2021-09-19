/// @desc 

if instance_exists(PLAYER)
{
	healthPoints = PLAYER.healthPoints;
	healthPointsMax = PLAYER.healthPointsMax;
}

if camera
{
	camera_destroy(camera);
}

setGameFlag(Game_Flag.cameraFollow);

// Clear Input Buffer
clearInputBuffer();