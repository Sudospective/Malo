vol_anim_out = TweenNull();
vol_anim_in = TweenNull();
scr_anim_out = TweenNull();
scr_anim_in = TweenNull();

switch (menu2_pos)
{
    case 0:
    {
        if (instance_exists(obj_volume) and (not TweenExists(vol_anim_out) or not TweenExists(vol_anim_in)))
        {
            audio_play_sound(snd_menu_forward,0,false);
            
            global.volume = obj_volume.vol / 10;
            audio_master_gain(global.volume);
            
            ini_open("data.ini");
                ini_write_real("prefs","audio",global.volume);
            ini_close();
            
            vol_anim_out = TweenFire(obj_volume,y__,EaseInExpo,0,true,0.0,0.5,y + 12,y + 240);
            TweenFire(obj_volume,timer__,EaseLinear,0,true,0.0,1.0,0,1);
        }
        if (!instance_exists(obj_volume) and (not TweenExists(vol_anim_in) or not TweenExists(vol_anim_out)))
        {
            audio_play_sound(snd_menu_forward,0,false);
            instance_create(x + 160,y + 12,obj_volume);
            vol_anim_in = TweenFire(obj_volume,y__,EaseOutExpo,0,true,0.0,0.5,y + 240,y + 12);
        }
        break;
    }
    case 1:
    {
        //audio_play_sound(snd_menu_deny,0,false);
        if (instance_exists(obj_screen) and (not TweenExists(scr_anim_in) or not TweenIsActive(scr_anim_in)))
        {
            audio_play_sound(snd_menu_forward,0,false);
            /*
            if (global.isfull == 0) window_set_fullscreen(false);
            if (global.isfull == 1) window_set_fullscreen(true);
            */
            //[SUDDEN REALIZATION THAT BINARY IS BOOLEAN]
            window_set_fullscreen(global.isfull);
            
            ini_open("data.ini");
                ini_write_real("prefs","window_mode",global.isfull);
            ini_close();
            
            scr_anim_out = TweenFire(obj_screen,y__,EaseInExpo,0,true,0.0,0.5,y + 28,y + 240);
            TweenFire(obj_screen,timer__,EaseLinear,0,true,0.0,0.5,0,1);
        }
        if (!instance_exists(obj_screen) and (not TweenExists(scr_anim_out) or not TweenIsActive(scr_anim_out)))
        {
            audio_play_sound(snd_menu_forward,0,false);
            instance_create(x + 176,y + 28,obj_screen);
            scr_anim_in = TweenFire(obj_screen,y__,EaseOutExpo,0,true,0.0,0.5,y + 240,y + 28);
        }
        break;
    }
    case 2:
    {
        audio_play_sound(snd_menu_back,0,false);
        instance_create(76,88,selector1);
        break;
    }
}
