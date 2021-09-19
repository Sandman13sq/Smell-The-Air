/// @desc Flips movement for timer
/// @arg inst
function creditsFlipTimer() {

	with obj_credits
	{
		var _l = array_length_1d(element);
	
		for (var i = 0; i < _l; i++)
		{
			if instance_exists(element[i]) {element[i].state = 1;}
		}
	}


}
