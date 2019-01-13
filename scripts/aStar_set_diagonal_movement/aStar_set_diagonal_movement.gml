/// @description aStar_set_diagonal_movement(diagonalMovement)
/// @param diagonalMovement
/*
 * Sets if the pathfinder are allowed to move diagonally or not.
 *
 * diagonalMovement: if the pathfinder should be able to move diagonally
 *
 * Returns: None
*/
if(instance_exists(oPathFinder))
    oPathFinder.cuttingCorners = argument0;
