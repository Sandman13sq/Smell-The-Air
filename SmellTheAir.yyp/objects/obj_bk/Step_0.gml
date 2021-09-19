/// @desc 

BAIL_CODE

cloudStep++;

switch(state)
{
	case(1):
		if mergeStep < mergeTime
		{
			mergeStep++;
			
			var _amt = mergeStep / mergeTime;
			
			for (var i = 0; i < cloudCount; i++)
			{
				cloudShow[i] = merge_color(cloudColor[i], cloudColor2[i], _amt);
			}
			
			bkShow = merge_color(backgroundColor, backgroundColor2, _amt);
		} else {state = 0;}
		break;
	
	case(2):
		if mergeStep > 0
		{
			mergeStep--;
			
			var _amt = mergeStep / mergeTime;
			
			for (var i = 0; i < cloudCount; i++)
			{
				cloudShow[i] = merge_color(cloudColor[i], cloudColor2[i], _amt);
			}
			
			bkShow = merge_color(backgroundColor, backgroundColor2, _amt);
		} else {state = 0;}
		break;
}
