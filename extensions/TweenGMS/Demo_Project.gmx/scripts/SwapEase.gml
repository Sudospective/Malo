/// SwapEase(tween,ease1,ease2)

var _t = argument0;
var _ease1 = argument1;
var _ease2 = argument2;

if (TweenGetEase(_t) == _ease1)
{
    TweenSetEase(_t, _ease2);
}
else
{
    TweenSetEase(_t, _ease1);
}
