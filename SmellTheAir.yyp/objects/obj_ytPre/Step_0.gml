/// @desc 

if flashStep {flashStep--;}

if state < displayCount
{
	if state == 0 {ALPHA = rangeToAmt(step, 50, 0);}
	
	if (step--) <= 0
	{
		state++;
		flashStep = 20;
		
		if state == displayCount 
		{
			step = 270;
			sfx(snd_upgradeEnd);
		}
		else
		{
			step = 60;
			sfx(snd_hit);
		}
		
	}
}
else
{
	step--;
	fadeAlpha = rangeToAmt(step, 60, 0);
}
