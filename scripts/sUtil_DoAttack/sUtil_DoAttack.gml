var attackObj = argument0;
var attackCoolTime = argument1;

with (instance_create_layer(attackObj.x, attackObj.y, "Instances", oBlank))
{
	m_OwnerObj = attackObj.id;
		
	instance_change(oMelee, true);
}

attackObj.m_Attacking = true;
attackObj.alarm[0] = argument1;