///
function clearInputBuffer() {

	for (var i = 0; i < Input._size; i++)
	{
		INPUT_BUFFERED[i] = 256;
	}


}
