///
function creditsClear() {

	with obj_credits
	{
		var _l = array_length_1d(element);
	
		for (var i = 0; i < _l; i++)
		{
			if instance_exists(element[i]) {instance_destroy(element[i]);}
			element[i] = noone;
		}
	}


}
