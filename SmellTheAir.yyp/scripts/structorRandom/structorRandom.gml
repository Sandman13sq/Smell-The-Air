/// @desc Structor for randomness
/// @arg constructor?
function structorRandom(argument0) {

	/*
		Yes, I know irandom() exists
		This is done on purpose
		I like random that is predictable at the start
	
		Inspired by Doom's method for randomness
	*/

	// Constructor
	if argument0
	{
	#macro RANDOMNUM_BUFFER global.RandomNum_Arr
	#macro RANDOMNUM_SIZE 256
	
		RANDOMNUM_BUFFER = buffer_create(RANDOMNUM_SIZE, buffer_fixed, 1);
	
		// Create Random Numbers
	
	#region Random Numbers
	
		// Generate (Set to 1 to run)
		if 0
		{
			var _map = ds_map_create(), _num = 0, _str = "";
		
			repeat(RANDOMNUM_SIZE)
			{
				while (ds_map_exists(_map, _num))
				{
					_num = irandom(RANDOMNUM_SIZE);
				}
			
				ds_map_add(_map, _num, _num);
				_str += "buffer_write(RANDOMNUM_BUFFER, buffer_u8, " + value_to_string(_num, 3) + ");\n";
			}
		
			clipboard_set_text(_str);
			ds_map_destroy(_map);
		}
	
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 000);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 075);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 193);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 064);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 216);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 194);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 163);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 015);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 045);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 239);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 118);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 238);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 116);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 133);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 256);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 040);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 161);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 091);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 233);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 175);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 180);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 030);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 171);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 198);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 032);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 051);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 247);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 043);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 067);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 210);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 127);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 190);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 182);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 226);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 160);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 060);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 004);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 098);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 028);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 170);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 146);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 072);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 179);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 197);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 231);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 134);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 145);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 165);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 167);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 016);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 221);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 217);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 027);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 090);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 088);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 130);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 219);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 061);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 108);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 034);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 037);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 183);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 223);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 189);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 248);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 206);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 042);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 253);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 050);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 225);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 018);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 020);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 191);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 106);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 148);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 252);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 046);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 062);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 142);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 121);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 177);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 057);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 024);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 218);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 068);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 065);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 201);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 029);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 229);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 158);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 230);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 044);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 066);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 009);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 124);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 023);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 084);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 055);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 172);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 100);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 069);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 011);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 156);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 125);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 033);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 035);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 104);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 228);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 139);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 031);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 059);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 054);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 074);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 053);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 173);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 014);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 178);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 039);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 107);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 036);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 087);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 209);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 026);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 242);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 115);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 078);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 120);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 102);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 224);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 151);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 081);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 136);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 232);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 085);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 038);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 128);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 203);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 132);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 089);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 205);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 250);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 243);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 227);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 235);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 241);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 214);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 196);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 003);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 048);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 012);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 157);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 077);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 095);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 137);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 058);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 019);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 005);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 103);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 200);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 202);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 212);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 070);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 195);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 184);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 181);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 083);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 122);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 076);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 006);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 138);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 222);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 192);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 113);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 215);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 010);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 237);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 126);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 082);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 086);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 246);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 166);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 114);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 110);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 007);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 001);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 244);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 211);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 129);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 186);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 249);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 047);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 208);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 168);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 251);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 063);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 144);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 185);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 143);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 164);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 117);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 140);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 176);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 092);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 025);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 017);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 234);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 079);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 207);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 056);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 220);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 150);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 105);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 109);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 097);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 101);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 071);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 213);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 236);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 187);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 135);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 153);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 141);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 159);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 245);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 154);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 021);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 255);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 155);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 041);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 174);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 169);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 152);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 240);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 199);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 094);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 111);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 013);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 162);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 052);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 002);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 093);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 080);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 131);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 049);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 099);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 096);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 204);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 149);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 254);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 112);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 123);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 119);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 188);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 022);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 008);
		buffer_write(RANDOMNUM_BUFFER, buffer_u8, 073);

	
	#endregion
	
		buffer_seek(RANDOMNUM_BUFFER, 0, 0);
	
		// getRNG()
	}
	// Destructor
	else
	{
		buffer_delete(RANDOMNUM_BUFFER);
	}


}
