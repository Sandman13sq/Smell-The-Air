/// @desc Deactivates enemies
function deactivateEnemies() {

	with obj_enemy
	{
		if !getFlag(Entity_Flag.noDisable)
		{
			var _id = id;
		
			with instance_create_depth(x, y, 0, obj_enemyTrigger)
			{
				enemyInstance = _id;
			}
		
			instance_deactivate_object(_id);
		}
	}


}
