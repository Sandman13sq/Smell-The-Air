/// @desc Locals

switch(LCL_FUNCTION)
{
	case(L.takeDamage):
		if checkEnemyKo(6) {return 1;}
		else
		{
			if aggroDelay == 0
			{
				if state == ST_carpet.crawl
				{
					image_xscale = pol(getPlayerX() - x);
					setState(ST_carpet.whipUp);
				}
			}
		}
		break;
}