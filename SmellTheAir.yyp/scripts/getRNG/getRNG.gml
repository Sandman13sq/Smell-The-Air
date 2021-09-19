/// @desc Returns "random" integer from 0-255 using global
function getRNG() {

	var _rand = buffer_read(RANDOMNUM_BUFFER, buffer_u8);

	cout("Rand: ", _rand);

	// Reset buffer position
	if buffer_tell(RANDOMNUM_BUFFER) == RANDOMNUM_SIZE
	{buffer_seek(RANDOMNUM_BUFFER, 0, 0);}

	return _rand;


}
