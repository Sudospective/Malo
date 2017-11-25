/// ext_PropertyExampleUniformEase__(amount,data[x1|x2|y1|y2|scale1|scale2|alpha1|alpha2|angle1|angle2|image1|image2|colour1|colour2],target)

var _amount = argument0;
var _data = argument1;
var _target = argument2;

_target.x = lerp(_data[0], _data[1], _amount);
_target.y = lerp(_data[2], _data[3], _amount);

var _scale = lerp(_data[4], _data[5], _amount);
_target.image_xscale = _scale;
_target.image_yscale = _scale;

_target.image_alpha = lerp(_data[6], _data[7], _amount);
_target.image_angle = lerp(_data[8], _data[9], _amount);
_target.image_index = lerp(_data[10], _data[11], _amount);
_target.image_blend = merge_colour(_data[12], _data[13], _amount);
