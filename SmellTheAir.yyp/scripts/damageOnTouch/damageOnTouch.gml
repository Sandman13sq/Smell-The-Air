/// @desc Damages player on touch
function damageOnTouch() {

	var _inst = instance_place(x, y, getPlayerInst());

	if _inst
	{
		if damage > 0
		{
			return doDamage(_inst, damage);
		}
	
	}

	return false;


}
