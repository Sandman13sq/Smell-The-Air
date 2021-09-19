/// @desc 

event_inherited();

#macro STALL_DEFEAT 6

if spawnIndex == getSpawnIndex() {instance_destroy(); return;}

depth = Layer_Depth.enemy;

state = 1;
stun = 0;
bump = 0;

flag = 0;
damage = 1;

image_xscale = facingRight? 1: -1;

enum Enemy_State
{
	ko = 2,
	stun = 1,
	base = 0,
}