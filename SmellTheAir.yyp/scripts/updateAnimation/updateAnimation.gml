/// Manages animation
function updateAnimation() {

	var _update = false;

	if animationIndex != animationIndexLast
	{
		animationIndexLast = animationIndex;
	
		animationData = ANIMATION_DATA[? animationIndex];
		animationLength = array_length_1d(animationData);
		animationFrameStart = 0;
	
		if getBit(animationFlag, Animation_Flag.keepIndex)
		{
			animationFrameIndex = animationFrameIndex mod animationLength;
		}
		else {animationFrameIndex = 0; animationStep = 0;}
	
		_update = true;
	}
	else
	{
		BAIL_CODE
	
		if animationStepMax > 0
		{
			animationStep++;
		
			// Duration Reached
			if animationStep >= animationStepMax
			{
				animationFrameIndex++;
			
				// Go to loop point
				if animationFrameIndex == animationLength
				{
					animationFrameIndex = animationFrameStart;
				}
			
				_update = true;
			}
		}
	}

	// Update Sprite
	if _update
	{
		animationFrame = animationData[animationFrameIndex];
	
		if animationFrame[Animation_Keyframe.sprite] >= 0
		{
			sprite_index = animationFrame[Animation_Keyframe.sprite];
			image_index = animationFrame[Animation_Keyframe.subimage];
		
			animationStepMax = animationFrame[Animation_Keyframe.duration];
		
			// Reset animation progress
			if !getBit(animationFlag, Animation_Flag.keepIndex) {animationStep = 0;}
			else {animationFlag = clearBit(animationFlag, Animation_Flag.keepIndex);}
		
			// Set Loop Point
			if getBit(animationFrame[Animation_Keyframe.flag], Animation_Keyframe_Flag.loopHere)
			{
				animationFrameStart = animationFrameIndex;
			}
		}
	}


}
