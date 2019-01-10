/// @description Dead

sPawn_Dead();

if(oPlayerController.m_PlayerObject == self)
{
	sUtil_DoUnpossess(oPlayerController);
}	
else if(irandom(2) == 0)
{
	instance_create_layer(x, y, "Instances", oSoul);
}