/// @desc 

// Inherit the parent event
event_inherited();

if stationary {x_speed = 0;}
else {x_speed = image_xscale;}
charge = 0;
aggroDelay = 0;

setupAnimation();
setAnimation(Animation_Index.carpet_crawl);

enum ST_carpet {null = 0, crawl, whipUp, charge, shoot}
