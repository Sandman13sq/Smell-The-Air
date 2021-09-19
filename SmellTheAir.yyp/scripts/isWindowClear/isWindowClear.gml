/// @desc Returns true if all windows in a room are cleared
function isWindowClear() {

	return ds_map_exists(WINDOW_MAP, room_get_name(room));


}
