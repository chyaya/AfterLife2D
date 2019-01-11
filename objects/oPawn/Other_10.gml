/// @description Dead

sPawn_Dead();

sUtil_PlayRandomSound(m_Sound_Dead);

if(oPlayerController.m_PlayerObject == self)
{
	sUtil_DoUnpossess(oPlayerController);
}	
else if(irandom(2) == 0)
{
	instance_create_layer(x, y, "Instances", oSoul);
}