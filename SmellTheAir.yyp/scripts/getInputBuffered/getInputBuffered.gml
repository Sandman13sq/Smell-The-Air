/// @desc Returns true if input was pressed within buffer time
/// @arg input_index,frames
function getInputBuffered(argument0, argument1) {

	return INPUT_BUFFERED[argument0] <= argument1;


}
