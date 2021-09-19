/// @desc Sets next animation to play
/// @arg animation_index,*flag,*flag*,...
function setAnimation() {

	animationIndex = argument[0];

	if argument_count > 1
	{
		animationFlag = 0;
	
		for (var i = 1; i < argument_count; i++)
		{
			animationFlag = setBit(animationFlag, argument[i]);
		}
	
		if getBit(animationFlag, Animation_Flag.forceRestart)
		{
			animationIndexLast = -1;
		}
		else
		{
			if animationIndex == animationIndexLast
			{
				animationFlag = clearBit(animationFlag, Animation_Flag.keepIndex);
			}
		}
	}


}
