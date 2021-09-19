/// @desc Can be sprite or string

theta = random(360);
ANGLE = dsin(theta) * 5;

xStart = x;
yStart = y;
xEnd = x;
yEnd = y;

timer = 0;
timerMax = 40;

state = 0;
index = 0;
label = "";

doesAnimation = false;
setupAnimation();

shaking = false;
useLightShader = false;