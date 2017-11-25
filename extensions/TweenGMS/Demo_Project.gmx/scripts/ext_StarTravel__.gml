/// ext_StarTravel__(amount,data[x1|x2|y1|y2|scale1|scale2],target)

var _amount = argument0;
var _data = argument1;
var _target = argument2;

_target.x = lerp(_data[0], _data[1], _amount);
_target.y = lerp(_data[2], _data[3], _amount);

var _scale = lerp(_data[4], _data[5], _amount);
_target.image_xscale = _scale;
_target.image_yscale = _scale;

_target.image_alpha = clamp(_scale*2.0, 0, 1);
