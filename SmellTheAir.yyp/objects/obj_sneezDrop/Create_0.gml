/// @desc 

// Inherit the parent event
event_inherited();

depth = Layer_Depth.enemy - 2;

flySpeed = 5;
flyMod = 0.95;

y_speed = 0;
y_speedMax = 0.2;

lifeMax = 400;
life = lifeMax;

damage = 1;

image_speed = 0;
image_index = irandom(image_number);
image_xscale = pol(irandom(1));
imageStep = irandom(4);