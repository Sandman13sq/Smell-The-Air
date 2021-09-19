/// @desc Saves settings
function saveSettings() {

	with MAIN_OBJ
	{
		var _path = "settings.ini";
		ini_open(_path);
	
		ini_write_string("inputKey", "left", string_from_array(inputKey[Input.left], " "));
		ini_write_string("inputKey", "right", string_from_array(inputKey[Input.right], " "));
		ini_write_string("inputKey", "up", string_from_array(inputKey[Input.up], " "));
		ini_write_string("inputKey", "down", string_from_array(inputKey[Input.down], " "));
		ini_write_string("inputKey", "jump", string_from_array(inputKey[Input.jump], " "));
		ini_write_string("inputKey", "fire", string_from_array(inputKey[Input.fire], " "));
		ini_write_string("inputKey", "menu", string_from_array(inputKey[Input.menu], " "));
	
		ini_write_string("inputPad", "left", string_from_array(inputPad[Input.left], " "));
		ini_write_string("inputPad", "right", string_from_array(inputPad[Input.right], " "));
		ini_write_string("inputPad", "up", string_from_array(inputPad[Input.up], " "));
		ini_write_string("inputPad", "down", string_from_array(inputPad[Input.down], " "));
		ini_write_string("inputPad", "jump", string_from_array(inputPad[Input.jump], " "));
		ini_write_string("inputPad", "fire", string_from_array(inputPad[Input.fire], " "));
		ini_write_string("inputPad", "menu", string_from_array(inputPad[Input.menu], " "));
	
		ini_write_real("data", "volume_all", VOLUME_ALL);
		ini_write_real("data", "volume_bgm", VOLUME_BGM);
		ini_write_real("data", "volume_sfx", VOLUME_SFX);
		ini_write_real("data", "screenmode", cameraSize);
		ini_write_string("data", "light1", intToHex(bgr(lightColor[0])) );
		ini_write_string("data", "light2", intToHex(bgr(lightColor[1])) );
		ini_write_string("data", "starflag", starFlag );
		ini_write_string("data", "completedOnce", getGameFlag(Game_Flag.completedOnce) );
	
		// Write Records (Type, Record#, Time/Star)
		var _l = 12, _subL, _data;
		for (var i = 0; i < _l; i++)
		{
			_subL = ds_list_size(recordList[i]);
			for (var j = 0; j < _subL; j++)
			{
				_data = ds_list_find_value(recordList[i], j);
				ini_write_real("record" + string(i) + chr(ord("a") + j), "time", _data[0]);
				ini_write_string("record" + string(i) + chr(ord("a") + j), "star", _data[1]);
			}
		}
	
		ini_close();
	}


}
