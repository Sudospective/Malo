///scr_fade(col,speed)
/*
    col = Color of fade (c_*)
    speed = Speed in steps
*/

fade = instance_create(0,0,obj_fade);
with (fade)
{
    fade_col = argument0;
    fade_inc = argument1;
}
