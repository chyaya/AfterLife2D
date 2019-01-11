event_inherited();

m_DirX = 0;
m_DirY = 0;

m_Path = undefined;
m_PathEndPos = position_create(-100, -100);

if(irandom(1) == 0)
{
	image_xscale = -1;	
}

if(false == variable_instance_exists(id, "m_Level"))
{
	m_Level = irandom(2);
}


if(false == variable_instance_exists(id, "m_AttackType"))
{
	m_AttackType = irandom(1);
}
	
var stats = sUtil_MakeStats(m_Level);
m_MaxHealth = stats[?"health"];
m_Damage = stats[?"damage"];
m_MoveSpeed = stats[?"moveSpeed"];
ds_map_destroy(stats);

if(false == variable_instance_exists(id, "m_CurHealth"))
{
	m_CurHealth = m_MaxHealth;
}
m_LastHealth = m_CurHealth;

if(m_CurHealth == 0)
{
	sPawn_Dead();
}
	
m_RottenSprFrame = 0;
m_LastImageIndex = -1;

m_Sound_Idle = ds_list_create();
m_Sound_Hit = ds_list_create();
m_Sound_Dead = ds_list_create();


