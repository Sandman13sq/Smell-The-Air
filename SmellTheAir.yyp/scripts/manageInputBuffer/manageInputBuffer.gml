/// @desc Counts up input buffers
function manageInputBuffer() {

	for (var i = 0; i < Input._size; i++)
	{
		// Buffer
		if INPUT_BUFFERED[i] < 256
		{
			INPUT_BUFFERED[i]++;
		}
	}


}
