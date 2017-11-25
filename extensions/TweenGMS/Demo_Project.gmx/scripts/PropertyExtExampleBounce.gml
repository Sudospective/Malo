/// PropertyExtExampleBounce()

// Toggle side we are bouncing on (0 = start, 1 = destination)
bounceSide = !bounceSide;

// If bouncing against start
if (bounceSide == 0)
{
    // Update tween with modified extended property data
    TweenSetExtData(argument0, x, random(room_width), y, random(room_height-200), 0, 1.5, 0, 1.0, random(540), random(540), 0, 30, c_white, random(c_white));
}
