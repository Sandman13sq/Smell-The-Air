/// @desc 

// Inherit the parent event
event_inherited();

moveDelay = 20;
moveSpeed = 1.2;
moveAcc = 0.07;

x_speed = 0;
y_speed = -(3 + getRNG() mod 3);

image_xscale = pol(x_speed);

setupAnimation();
setAnimation(Animation_Index.dustbunny);