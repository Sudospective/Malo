#define MaloFade
/*





    USAGE:
    
        MaloFade{dir}(col,speed)
        
        {dir} = Direction of fade (In, Out)
        col = Color of fade (c_*)
        speed = Speed in steps
*/

#define MaloFadeIn
///MaloFadeIn(col,speed)

fade = instance_create(0,0,obj_fade);

with (fade)
{
    fade_dir = in;
    fade_col = argument0;
    fade_speed = argument1;
}

#define MaloFadeOut
///MaloFadeOut(col,speed)

fade = instance_create(0,0,obj_fade);

with (fade)
{
    fade_dir = out;
    fade_col = argument0;
    fade_speed = argument1;
}