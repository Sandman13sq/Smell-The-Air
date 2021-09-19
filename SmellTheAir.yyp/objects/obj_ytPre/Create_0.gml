/// @desc 

bgm_fadeout(0);

flashStep = 0;
state = 0;
step = 60;

ALPHA = 1;

displayString = [
	"If at any point during this video you think",
	"\"Hey, this looks cool. Maybe I should try this out.\"",
	"Then I encourage you to pause this and give it a shot.",
	"Links in description"
	];

displayCount = array_length_1d(displayString);

fadeAlpha = 0;