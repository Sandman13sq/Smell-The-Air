/// @desc 

var _flash = state == ST_sneez.succ && stateStep <= 60 && boolStep(stateStep, 4);

if _flash {draw_set_flash(c_sneez, 1)}

// Inherit the parent event
event_inherited();

if _flash {draw_set_flash(0, 0)}