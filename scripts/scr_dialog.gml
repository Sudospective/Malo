///scr_dialog(text,font,col,speed,x,y,halign,valign,box)

/*
    text - String
    font - Specified font from "Fonts"
    col - Color of text (c_*)
    speed - Speed of text scroll in steps
    x - X coordinate
    y - Y coordinate
    halign - Horizontal alignment (fa_*)
    valign - Vertical alginment (fa_*)
    box - Whether box shound be drawn (bool)
*/

txt = instance_create(argument4,argument5,obj_dialog);
with (txt)
{
    txt_padding = 4;
    box_padding = 8;
    txt_width = view_wview;
    txt_string = argument0;
    txt_font = argument1;
    txt_color = argument2;
    txt_speed = argument3;
    txt_halign = argument6;
    txt_valign = argument7;
    box = argument8;
    
    txt_string_length = string_length(txt_string);
    txt_font_size = font_get_size(txt_font);
    
    draw_set_font(txt_font);
    
    txt_string_width = string_width_ext(txt_string,txt_font_size + (txt_font_size/2),txt_width - txt_padding * 2);
    txt_string_height = string_height_ext(txt_string,txt_font_size + (txt_font_size/2),txt_width - txt_padding * 2);
    
    txt_box_w = txt_string_width + (txt_padding * 2);
    txt_box_h = txt_string_height + (txt_padding * 2);
}
