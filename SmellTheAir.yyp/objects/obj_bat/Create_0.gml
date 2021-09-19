/// @desc 

event_inherited();

image_speed = 0;

flapStep = 0;

x_speed = 0;
y_speed = pol( getRNG() mod 2 );

flySpeed = 0.8;
flyAcc = 0.07;

damage = 1;

enum ST_bat {null, fly, stun, bump};