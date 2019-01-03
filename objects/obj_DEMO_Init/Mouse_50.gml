// Demo controls.
if alarm[0] < 0
{
alarm[0] = 5;
// Test room width
if mouse_x > 16 && mouse_x < 48
    {
    if mouse_y > 16 && mouse_y < 48
        {
        if rm_w < 2048 rm_w += 32;
        }
    else if mouse_y > 80 && mouse_y < 112
        {
        if rm_w > 256 rm_w -= 32;
        }
    }

// Test room height
if mouse_x > 80 && mouse_x < 112
    {
    if mouse_y > 16 && mouse_y < 48
        {
        if rm_h < 2048 rm_h += 32;
        }
    else if mouse_y > 80 && mouse_y < 112
        {
        if rm_h > 256 rm_h -= 32;
        }
    }

// Number of splits to generate
if mouse_x > 144 && mouse_x < 172
    {
    if mouse_y > 16 && mouse_y < 48
        {
        if global.splitNum < 99 global.splitNum++;
        }
    else if mouse_y > 80 && mouse_y < 112
        {
        if global.splitNum > 2 global.splitNum--;
        }
    }

// Minimum width (in grid squares) of each split
if mouse_x > 208 && mouse_x < 240
    {
    if mouse_y > 16 && mouse_y < 48
        {
        if global.splitSize < 128 global.splitSize++;
        }
    else if mouse_y > 80 && mouse_y < 112
        {
        if global.splitSize > 3 global.splitSize--;
        }
    }

// Number of rooms to skip (max is limited by the split number)
if mouse_x > 272 && mouse_x < 304
    {
    if mouse_y > 16 && mouse_y < 48
        {
        if global.roomSkip < global.splitNum global.roomSkip++;
        }
    else if mouse_y > 80 && mouse_y < 112
        {
        if global.roomSkip > 0 global.roomSkip--;
        }
    }

// Number of rooms to skip (max is limited by the split number)
if mouse_x > 336 && mouse_x < 368
    {
    if mouse_y > 16 && mouse_y < 48
        {
        if global.cellSize < 64 global.cellSize += 8;
        }
    else if mouse_y > 80 && mouse_y < 112
        {
        if global.cellSize > 8 global.cellSize -= 8;
        }
    }
}

