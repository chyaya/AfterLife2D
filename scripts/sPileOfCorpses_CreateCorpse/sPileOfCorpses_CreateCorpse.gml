#macro TILE_SIZE	16
#macro OFFSET_SIZE	(TILE_SIZE div 2)

var _x = x + OFFSET_SIZE;
var _y = y + OFFSET_SIZE;

switch(irandom(4))
{
case 0:
	sUtil_CreateObject(_x - TILE_SIZE, _y, "Instances", oManCorpse);
	break;
case 1:
	sUtil_CreateObject(_x + TILE_SIZE, _y, "Instances", oManCorpse);
	break;
case 2:
	sUtil_CreateObject(_x, _y - TILE_SIZE, "Instances", oManCorpse);
	break;
case 3:
	sUtil_CreateObject(_x, _y + TILE_SIZE, "Instances", oManCorpse);
	break;
}

