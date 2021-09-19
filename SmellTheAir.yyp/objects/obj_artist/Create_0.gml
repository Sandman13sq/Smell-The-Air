/// @desc 

mX = 0;
mY = 0;
mXHold = 0;
mYHold = 0;

active = false;

doQuantize = true;
elementList = ds_list_create();
// Point = [0, x, y]
// Line = [1, x1, y1, x2, y2]
// Box = [2, x1, y1, x2, y2]

currentElement = -1;

unit = 16;

state = 0;