// Inherit the parent event
event_inherited();

var itemRes = noone;

switch(irandom(3))
{
case 0: itemRes = oPortion; break;
case 1: itemRes = oWeapon; break;
case 2: itemRes = oArmor; break;
case 3: itemRes = oShoes; break;
}

instance_create_layer(x, y, layer, itemRes);