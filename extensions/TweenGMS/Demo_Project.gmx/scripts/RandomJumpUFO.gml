/// RandomJumpUFO

/// Jump to a new random location if not visible
if (round(image_alpha) == 0)
{
    var _boundary = 100;
    x = irandom_range(_boundary, room_width-_boundary);
    y = irandom_range(_boundary, room_height-_boundary);
}
