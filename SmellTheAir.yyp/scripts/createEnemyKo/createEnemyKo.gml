/// @desc Creates enemy koed
/// @arg image_index
function createEnemyKo(argument0) {
			
	with instance_create_depth(x, y, depth + 1, obj_enemyKo)
	{
		x_speed = pol(CURRENT_FRAME mod 2);
		sprite_index = other.sprite_index;
		image_index = argument0;
	
		image_xscale = other.image_xscale;
	}
				
	instance_create_depth(x, y, depth + 1, obj_defeatFlash);


}
