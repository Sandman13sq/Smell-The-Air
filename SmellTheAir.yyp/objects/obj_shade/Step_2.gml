/// @desc 

BAIL_CODE;

// Inherit the parent event
event_inherited();

if healthState == 0 {healthX = approach(healthX, 128, 2);}
else {healthX = approach(healthX, 0, 2);}

updateAnimation();
