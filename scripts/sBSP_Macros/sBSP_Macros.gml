/// @description	This is a list of macros used within the BSP generation scripts. 
///					IMPORTANT! Do NOT change any of these values or remove the script 
///					otherwise the generator won't work. Feel free to add your own
///					macros as required (as shown below)...

#macro bsp_empty		-4
#macro bsp_outer_wall	150
#macro bsp_wall			100
#macro bsp_door_h		300
#macro bsp_door_v		301
#macro bsp_corridor		200


/// The following macro definitions are for the DEMO ONLY, and as such CAN BE REMOVED
/// In the demo playable level, we have enemies, gold, and potions, and we want to use 
/// the BSP grid to check for them. To make this easier, we add macros for each of the 
/// different grid values:

#macro bsp_DEMO_potion	2
#macro bsp_DEMO_gold	3
