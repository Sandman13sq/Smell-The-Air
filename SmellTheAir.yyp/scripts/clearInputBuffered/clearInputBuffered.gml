/// @desc Clears input buffer
/// @arg input_index
function clearInputBuffered(argument0) {

	INPUT_BUFFERED[argument0] = 256;
	INPUT_PRESSED = 0;


}
