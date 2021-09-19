/// @desc Input
function structorInput() {

#macro INPUT_HELD global.Input_Held
#macro INPUT_PRESSED global.Input_Pressed
#macro INPUT_RELEASED global.Input_Released
#macro INPUT_BUFFERED global.Input_Buddered

	INPUT_HELD = 0;
	INPUT_PRESSED = 0;
	INPUT_RELEASED = 0;
	INPUT_BUFFERED = array_create(8, 256);

	enum Input
	{
		left, up, right, down,
		jump, fire, menu,
	
		_size
	}

	enum PS4
	{
		cross = gp_face1,
		circle = gp_face2,
		square = gp_face3,
		triangle = gp_face4,
	
		L1 = gp_shoulderl,
		L2 = gp_shoulderlb,
		R1 = gp_shoulderr,
		R2 = gp_shoulderrb,
	
		left = gp_padl,
		right = gp_padr,
		up = gp_padu,
		down = gp_padd,
	
		options = gp_start,
	}

	inputKey = array_create(8);
	inputPad = array_create(8);

	inputKey[Input.left] = string_strip_real( ini_read_string("inputKey", "left", str(vk_left)) );
	inputKey[Input.right] = string_strip_real( ini_read_string("inputKey", "right", str(vk_right)) );
	inputKey[Input.up] = string_strip_real( ini_read_string("inputKey", "up", str(vk_up)) );
	inputKey[Input.down] = string_strip_real( ini_read_string("inputKey", "down", str(vk_down)) );
	inputKey[Input.jump] = string_strip_real( ini_read_string("inputKey", "jump", str(ord("Z"), " ", vk_space) ) );
	inputKey[Input.fire] = string_strip_real( ini_read_string("inputKey", "fire", str(ord("X"))) );
	inputKey[Input.menu] = string_strip_real( ini_read_string("inputKey", "menu", str(vk_enter, " ", ord("C"))) );

	inputPad[Input.left] = string_strip_real( ini_read_string("inputPad", "left", str(PS4.left)) );
	inputPad[Input.right] = string_strip_real( ini_read_string("inputPad", "right", str(PS4.right)) );
	inputPad[Input.up] = string_strip_real( ini_read_string("inputPad", "up", str(PS4.up)) );
	inputPad[Input.down] = string_strip_real( ini_read_string("inputPad", "down", str(PS4.down)) );
	inputPad[Input.jump] = string_strip_real( ini_read_string("inputPad", "jump", str(PS4.cross)) );
	inputPad[Input.fire] = string_strip_real( ini_read_string("inputPad", "fire", str(PS4.square, " ", PS4.circle, " ", PS4.R1, " ", PS4.R2)) );
	inputPad[Input.menu] = string_strip_real( ini_read_string("inputPad", "menu", str(PS4.triangle, " ", PS4.options)) );

	inputDevice = -1;


}
