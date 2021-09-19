/// @desc Sets state in object
/// @arg *state
function setState() {

	var _state = argument_count > 0? argument[0]: abs(state) + 1;

	// Negative State = State Change
	state = -abs(_state);

	// Run Code
	event_user(14);

	// Positive State = State Update/Step
	state = abs(state);

	/*
		NOTE: Having a state of 0 may cause problems if used wrong
	*/


}
