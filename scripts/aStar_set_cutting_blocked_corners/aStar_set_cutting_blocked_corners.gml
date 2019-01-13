/// @description aStar_set_cutting_blocked_corners(cuttingBlockedCorners)
/// @param cuttingBlockedCorners
/*
 * Sets if the pathfinder are allowed to cut blocked corners (Read more about this in
 * the script "aStar_get_cutting_blocked_corners".
 *
 * curringBlockedCorners: if the pathfinder should be able to cut blocked corners or not
 *
 * Returns: None
*/
if(instance_exists(oPathFinder))
    oPathFinder.cuttingBlockedCorners = argument0;
