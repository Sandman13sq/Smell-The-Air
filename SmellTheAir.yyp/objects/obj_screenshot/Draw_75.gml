/// @desc 

var _path = get_save_filename_ext("*.png", 
	str("Screenshot_", current_month, "-", current_day, "-", current_year, "_", current_minute, ".png"),
	program_directory, "");

if _path != ""
{
	screen_save(_path);
}

instance_destroy();