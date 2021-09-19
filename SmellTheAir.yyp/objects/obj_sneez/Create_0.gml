/// @desc 

// Inherit the parent event
event_inherited();

#macro c_sneez bgr(0xC6C9F8)

stateStep = 0;
range = 200;

strengthAmt = 0;

playerInst = noone;

setupAnimation();
setState(ST_sneez.idle);

enum ST_sneez {null, idle, succ, stucc, shoot, shootPlayer};