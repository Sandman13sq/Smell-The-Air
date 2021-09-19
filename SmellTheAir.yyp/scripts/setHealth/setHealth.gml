/// @desc Sets health and health max
/// @arg health,*current
function setHealth() {

	healthPointsMax = argument[0]
	healthPoints = argument[0];

	if argument_count > 1
	{
		healthPoints = argument[1];
	}


}
