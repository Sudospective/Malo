switch (menu1_pos)
{
    case 0:
    {
        audio_play_sound(snd_menu_forward,0,false);
        audio_sound_gain(global.mus,0,1000);
        
        TweenFire(id,y__,EaseInExpo,0,true,0.0,1.0,y,y - 240);
        TweenFire(id,ext_background_colour__,EaseLinear,0,true,0.5,1.0,0.0,1.0,c_black,c_white);
        TweenFire(id,timer__,EaseLinear,0,true,0.0,2.0,0,1);
        
        break;
    }
    case 1:
    {
        audio_play_sound(snd_menu_forward,0,false);
        instance_create(396,88,selector2);
        break;
    }
    case 2:
    {
        audio_play_sound(snd_menu_back,0,false);
        audio_sound_gain(global.mus,0,1000);
        
        TweenFire(id,y__,EaseInExpo,0,true,0.0,1.0,y,y + 240);
        TweenFire(id,timer__,EaseLinear,0,true,0.0,1.5,0,1);
        
        break;
    }
}
