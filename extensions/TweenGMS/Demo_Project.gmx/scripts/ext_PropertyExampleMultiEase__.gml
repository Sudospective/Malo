/// ext_PropertyExampleMultiEase__(amount,data[target|x1|x2|y1|y2|scale1|scale2|alpha1|alpha2|angle1|angle2|image1|image2|colour1|colour2])

var _amount = argument0;
var _data = argument1;
var _target = argument2;

_target.x = Ease(_data[0], _data[1], _amount, EaseInOutElastic);
_target.y = Ease(_data[2], _data[3], _amount, EaseInOutBounce);

var _scale = Ease(_data[4], _data[5], _amount, EaseInOutBack);
_target.image_xscale = _scale;
_target.image_yscale = _scale;

_target.image_alpha = Ease(_data[6], _data[7], _amount, EaseInOutSine);
_target.image_angle = Ease(_data[8], _data[9], _amount, EaseInOutQuad);
_target.image_index = Ease(_data[10], _data[11], _amount, EaseInOutCubic);
_target.image_blend = merge_colour(_data[12], _data[13], Ease(0, 1, _amount, EaseInOutQuart));
