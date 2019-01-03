// This object is the main collision parent used to determine how 
// things will be spawned when you create your maze. As such, it should be used for 
// any object that you DON'T want to be overlapping when spawned, like enemies, the 
// player, chests, etc... if you are only spawning potions, or gold, or things that 
// the other objects can "walk" over, then it's not necessary to assign this parent.

// NOTE! This is an essential part of the BSP script set and should not be removed 
// from your game, unless you plan on creating your own spawning mechanism and don't 
// plan on using the script "scr_BSP_Populate_Rooms" or "scr_BSP_Populate_Area".


