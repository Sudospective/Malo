/// StarLoop(star_tween)

var _dir = irandom(360);
var _radius = point_distance(xstart,ystart,0,0);
var _startRadius = _radius / random_range(1, 20);
var _duration = _radius/_startRadius/5;
var _xStart = xstart+lengthdir_x(_startRadius, _dir);
var _yStart = ystart+lengthdir_y(_startRadius, _dir);
var _xDest = xstart+lengthdir_x(_radius, _dir);
var _yDest = ystart+lengthdir_y(_radius, _dir);
var _scaleStart = 0.0;
var _scaleDest = 1.0;

// Create new extended tween property data
TweenSetExtData(argument0, _xStart, _xDest, _yStart, _yDest, _scaleStart, _scaleDest);

// Update duration
TweenSetDuration(argument0, _duration);
