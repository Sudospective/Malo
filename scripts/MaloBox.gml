#define MaloBox
///MaloBox(text,font,pt,textcol,speed,x1,y1,x2,y2,halign,valign,boxcol,boxalpha)

/*
    #########################
    ##MaloBox Dialog Engine##
    #########################
    
    MaloBox is a dialog engine that is part of the MaloLib Suite made by the
    Syndi Dev Team for the debut indie video game "Malo". It includes
    customizations such as fonts, size, color, scrolling speed, and so on.
    
    Update Log:
    
    v0.1        * | INFO     | ADDITION    ~ | CHANGE    - | REMOVAL
    ----
    *   Initial release
        
    KNOWN BUGS:
    -----------
    *   None
        
    TO-DO:
    ------
    +   Add more emphasizers
    +   Add a feature to turn on autosizer (draws text box at correct size
        initially, fits text in box correctly)
    +   Add support for custom sounds for different characters
    +   Possibly add support custom NPC configurations in the future
        
                
    Arguments
    ---------
    text - Dialog to print (str)
    font - Specified font from "Fonts" (var)
    pt - Font size (int or "NA")
    textcol - Color of text (c_*)
    speed - Speed of text scroll in steps (int)
    x1 - X1 area coordinate (int)
    y1 - Y1 area coordinate (int)
    x2 - X2 area coordinate (int)
    y2 - Y2 area coordinate (int)
    halign - Horizontal alignment (fa_*)
    valign - Vertical alginment (fa_*)
    boxcol - Color of textbox (c_*)
    boxalpha - Alpha of textbox (int)
*/

txt = instance_create(argument5,argument6,obj_dialog);
with (txt)
{
    txt_padding = 4;
    box_padding = 8;
    txt_x = argument5;
    txt_y = argument6;
    txt_width = argument7;
    txt_height = argument8;
    /*
    if (is_array(argument0))
    {
        txt_multi = true;
        txt_array = argument0;
        txt_string = argument0[global.msg];
    }
    else
    {
        txt_multi = false;
        txt_string = argument0;
    }
    */
    txt_string = argument0;
    if (is_array(txt_string)) cur_string = txt_string[global.msg];
    else cur_string = txt_string;
    txt_font = argument1;
    def_color = argument3;
    txt_speed = argument4;
    txt_halign = argument9;
    txt_valign = argument10;
    box_color = argument11;
    box_alpha = argument12;
    txt_color = def_color;
    
    txt_string_length = string_length(cur_string);
    if argument2 != "NA" then txt_font_size = argument2 else txt_font_size = font_get_size(txt_font);
    
    draw_set_font(txt_font);
    
    txt_string_width = string_width_ext(cur_string,txt_font_size + (txt_font_size/2),txt_width - (box_padding*2) - (txt_padding*2));
    txt_string_height = string_height_ext(cur_string,txt_font_size + (txt_font_size/2),txt_width - (box_padding*2) - (txt_padding*2));
    
    var i,o;
    var red_start = string_pos("[cr]",cur_string),
        red_end = string_pos("[/cr]",cur_string),
        red_len = red_end - (red_start + 4),
        blu_start = string_pos("[cb]",cur_string),
        blu_end = string_pos("[/cb]",cur_string),
        blu_len = blu_end - (blu_start + 4),
        grn_start = string_pos("[cg]",cur_string),
        grn_end = string_pos("[/cg]",cur_string),
        grn_len = grn_end - (grn_start + 4),
        yel_start = string_pos("[cy]",cur_string),
        yel_end = string_pos("[/cy]",cur_string),
        yel_len = yel_end - (yel_start + 4),
        pur_start = string_pos("[cp]",cur_string),
        pur_end = string_pos("[/cp]",cur_string),
        pur_len = pur_end - (pur_start + 4);
    
    for (i=0;i<=cur_string;i+=1)
    {    
        switch(i)
        {
            case (red_start):
                is_emph = true;
                //MaloParse(cur_string);  --This thing sucks and I will fight it.
                emph[o] = string_copy(cur_string,red_start + 4,red_len);
                string_delete(cur_string,red_start,red_start + 4);
                string_delete(cur_string,red_end,red_end + 4);
                emph_color[i] = c_red;
                continue;
            case (blu_start):
                is_emph = true;
                emph[o] = string_copy(cur_string,blu_start + 4,blu_len);
                string_delete(cur_string,blu_start,blu_start + 4);
                string_delete(cur_string,blu_end,blu_end + 4);
                emph_color[i] = c_blue;
                continue;
            case (grn_start):
                is_emph = true;
                emph[o] = string_copy(cur_string,grn_start + 4,grn_len);
                string_delete(cur_string,grn_start,grn_start + 4);
                string_delete(cur_string,grn_end,grn_end + 4);
                emph_color[i] = c_green;
                continue;
            case (yel_start):
                is_emph = true;
                emph[o] = string_copy(cur_string,yel_start + 4,yel_len);
                string_delete(cur_string,yel_start,yel_start + 4);
                string_delete(cur_string,yel_end,yel_end + 4);
                emph_color[i] = c_yellow;
                continue;
            case (pur_start):
                is_emph = true;
                emph[o] = string_copy(cur_string,pur_start + 4,pur_len);
                string_delete(cur_string,pur_start,pur_start + 4);
                string_delete(cur_string,pur_end,pur_end + 4);
                emph_color[i] = c_purple;
                continue;
            default:
                is_emph = false;
                break;
        }
    }
}

#define MaloStringGet
///Gets the current dialog string.

/*
M

if (is_array(obj_dialog.txt_string))
    {
        txt_return = obj_dialog.txt_string.msg;
    }
    else
    {
        txt_return = obj_dialog.txt_string;
    }
    return txt_return;

#define MaloParse
///MaloParse(str,ret)
/*
MaloParse: MaloBox Scriptmark Parser
------------------------------------
INFO:
    MaloParse is a simple scriptmark parser for the preparation
    of the MaloEmph() emphasis extension function. It takes a
    string and parses it into all the different substrings that
    contain scriptmarks.

USAGE:
    MaloParse(str);
    
    str -   The string to parse (str)
    
    ret -   Variables of parsed scriptmarks, requestable by
            primary color name (red, grn, etc.)
            
            Variables of MaloEmph() functions (emph_red,
            emph_grn, etc.)
            
EXAMPLE:
    MaloParse(
        "[cr]Four[/cr] [cy]score[/cy] and [cr]seven[/cr] \
        [cp]years[/cp] ago..."
    );
    
    would generate the following strings:
        red = "Four|seven"
        blu = ""
        grn = ""
        yel = "score"
        pur = "years"
        
    and the following functions:
        emph_red = MaloEmph(red,"|",c_red)
        emph_blu = MaloEmph(blu,"|",c_blue)
        emph_grn = MaloEmph(grn,"|",c_green)
        emph_yel = MaloEmph(yel,"|",c_yellow)
        emph_pur = MaloEmph(pur,"|",c_purple)
    
    which, in turn, MaloEmph would output the
    original string with color.
*/

/*
    To be completely level with you, I goddamn
    hate this fucking script. It's the bane of
    my existance and I've already stayed up
    for three nights in a row just to get the
    stupid thing to accept the parsing scheme
    and output anything other than 17 fucking
    separators.
    
    Well, hope you enjoy this garbage.
*/

//Initialize variables, grab the current string.
var str, sep, wsp, len, i, o;
var emph,emph_color;
str = cur_string;
sep = "|";
len = string_length(str);
key_red = false;
key_blu = false;
key_grn = false;
key_yel = false;
key_pur = false;

//Drinking game idea: every time you feel empathy
//for my desire to end my life from this bullshit,
//take a shot.
for (i=1; i<=len; i+=1)
{
    i_prv = string_char_at(str,i-1);
    i_nxt = string_char_at(str,i+1);
    
    red_bp = string_pos("[cr]",str) - 1;
    red_bb = string_pos("[cr]",str);
    red_be = string_pos("[cr]",str) + string_length("[cr]");
    red_ep = string_pos("[/cr]",str) - 1;
    red_eb = string_pos("[/cr]",str);
    red_ee = string_pos("[/cr]",str) + string_length("[/cr]");
    
    blu_bp = string_pos("[cb]",str) - 1;
    blu_bb = string_pos("[cb]",str);
    blu_be = string_pos("[cb]",str) + string_length("[cb]");
    blu_ep = string_pos("[/cb]",str) - 1;
    blu_eb = string_pos("[/cb]",str);
    blu_ee = string_pos("[/cb]",str) + string_length("[/cb]");
    
    grn_bp = string_pos("[cg]",str) - 1;
    grn_bb = string_pos("[cg]",str);
    grn_be = string_pos("[cg]",str) + string_length("[cg]");
    grn_ep = string_pos("[/cg]",str) - 1;
    grn_eb = string_pos("[/cg]",str);
    grn_ee = string_pos("[/cg]",str) + string_length("[/cg]");
    
    yel_bp = string_pos("[cy]",str) - 1;
    yel_bb = string_pos("[cy]",str);
    yel_be = string_pos("[cy]",str) + string_length("[cy]");
    yel_ep = string_pos("[/cy]",str) - 1;
    yel_eb = string_pos("[/cy]",str);
    yel_ee = string_pos("[/cy]",str) + string_length("[/cy]");
    
    pur_bp = string_pos("[cp]",str) - 1;
    pur_bb = string_pos("[cp]",str);
    pur_be = string_pos("[cp]",str) + string_length("[cp]");
    pur_ep = string_pos("[/cp]",str) - 1;
    pur_eb = string_pos("[/cp]",str);
    pur_ee = string_pos("[/cp]",str) + string_length("[/cp]");
    //[MASS SUICIDAL ALCOHOL POISONING]
    
    //Alright, now for the parsing.
    
    //This code will run completely through, even
    //if the first condition is satisfied, and then
    //loop continuously at the very end, until the
    //end of the string is reached, in which case it
    //will finally break and continue with the rest
    //of the script.
    switch(i)
    {
    
    //When we find the beginning scriptmark,
    //jump to the end of it, record a separator,
    //and mark it as that scriptmark keyword.
    case red_bb:
        i = red_eb;
        red += sep;
        key_red = true;
        
    case blu_bb:
        i = blu_eb;
        blu += sep;
        key_blu = true;
        
    case grn_bb:
        i = grn_eb;
        grn += sep;
        key_grn = true;
        
    case yel_bb:
        i = yel_eb;
        yel += sep;
        key_yel = true;
        
    case pur_bb:
        i = pur_eb;
        pur += sep;
        key_pur = true;
        
    //If we have a scriptmark keyworld of a
    //certain color, record the string inside
    //that color's scriptmark.
    case key_red:
        red += chr(i);
    case key_blu:
        blu += chr(i);
    case key_grn:
        grn += chr(i);
    case key_yel:
        yel += chr(i);
    case key_pur:
        pur += chr(i);
        
    //If we get to the end of a scriptmark via
    //its ending tag, put a separator, jump to
    //the end of the tag, and mark our keyword
    //as inactive. Also, keep a tally of how
    //many words we've recorded to make things
    //easier for MaloEmph.
    case red_eb:
        red += sep;
        i = red_ee;
        key_red = false;
    case blu_eb:
        blu += sep;
        i = blu_ee;
        key_blu = false;
    case grn_eb:
        grn += sep;
        i = grn_ee;
        key_grn = false;
    case yel_eb:
        yel += sep;
        i = yel_ee;
        key_yel = false;
    case pur_eb:
        pur += sep;
        i = pur_ee;
        key_pur = false;
        continue;
    
    //If we reach the end of the string, stop parsing.
    case len:
        break;
    
    //If we don't have any matching cases but we still
    //haven't reached the end of the string, loop back
    //and read the next index.
    default:
        continue;
    }
}

//If our key is still active somehow, only put a separator.
if (key_red) red += sep;
if (key_blu) blu += sep;
if (key_grn) grn += sep;
if (key_yel) yel += sep;
if (key_pur) pur += sep;

//Send all of these parsings to the MaloEmph extension if they
//aren't blank and return them as variables for debugging if
//needed (it's needed).
/*
if (red != "") emph_red = MaloEmphRed(red,sep);
if (blu != "") emph_blu = MaloEmph(blu,sep);
if (grn != "") emph_grn = MaloEmph(grn,sep);
if (yel != "") emph_yel = MaloEmph(yel,sep);
if (pur != "") emph_pur = MaloEmph(pur,sep);
*/

/*
    _  
   / |______       __    __  ______
  /   fuck  |     /  \  / / / ___  |
  \   _you__|    / /\ \/ / / /__/ /
   \_|          /_/  \_/  |______/    "I just wanted to make the words gayer" ~ Coco 2017
     
*/

#define MaloEmph_old
///MaloEmph(sub,sep,col)

/*
MaloEmph: The MaloBox Scriptmark Emphasis Extension
---------------------------------------------------
MaloEmph is an extension of MaloBox that allows for custom effects for
MaloBox dialog. It can be called either manually or by using a special
Markdown-dirived scriptmark indicator that tells the engine what to do
with the text.

[Currently, only five colors are supported: red, blue, green, yellow,
and purple.]

INFO:
    Parses words and adds a special emphasis color to them. Any color
    supported by GameMaker is supported, but please keep in mind that
    too many colors can look fairly ugly.
    
MANUAL USAGE:
    MaloEmph("cat|dog|house|bee","|",c_red)

    sub - Substrings to emphasize (str)
    sep - Substring separator (str)
    col - Color of emphasis (c_*)
    
    [Note, if you set a separator and would like to use that separator
    in your string as well, you will need to put a special escape
    tilde (`} to tell the function to skip separator assumption of that
    character.
    
    For example:
        MaloEmph(" This `| That | Another","|",c_green)
    will give us the following array:
        { "This | That" , "Another" }
    
QUICKHAND USAGE:
    MaloEmph is automatically called every string written via MaloBox
    and looks for the following scriptmarks:
    
    [cr]red[/cr]
    [cg]green[/cg]
    [cb]blue[/cb]
    [cy]yellow[/cy]
    [cp]purple[/cp]
*/

emph_txt = argument0;
emph_sep = argument1;
emph_color = argument2;
emph_esc = "`";

var i,emph,o = 0,len = string_length(emph_txt),emph_start,emph_end;

//Put all of our substrings into an array based on the
//separator we set in the function.
for (i=0;i<=len;i+=1;)
{
    sep_loc = string_pos(emph_sep,emph_txt);
    lastpos_i = i;
    
    switch(i) {
    case sep_loc:
        emph[o] = string_copy(emph_txt,lastpos_i,sep_loc - 1);
        lastpos_i = i;
        o += 1;
        continue;
    case len:
        emph[o] = string_copy(emph_txt,lastpos_i,len);
        break;
    }
}

emph_count = o;
i = 0;

var cur_cat = "";
emph_start[i] = string_pos(emph[i],cur_string);
emph_end[i] = emph_start[i] + string_length(emph[i]);

for (i=0;i<=emph_count;i+=1;)
{
    switch(i)
    {
    case emph_start:
        cur_cat = string_copy(cur_string,0,i);
    }
}

#define MaloEmph
///MaloEmph(s_array,c_array)

/*
MaloEmph: The MaloBox Scriptmark Emphasis Extension
---------------------------------------------------
MaloEmph is an extension of MaloBox that allows for custom effects for
MaloBox dialog. It can be called either manually or by using a special
Markdown-dirived scriptmark indicator that tells the engine what to do
with the text.

[Currently, only five colors are supported: red, blue, green, yellow,
and purple.]

INFO:
    Parses words and adds a special emphasis color to them. Any color
    supported by GameMaker is supported, but please keep in mind that
    too many colors can look fairly ugly.
    
MANUAL USAGE:
    MaloEmph(s_array,c_array);

    s_array - Array of substrings
    c_array - Array of colors
    
    For example:
        myTextArray[0] = "cat"; myColorArray[0] = c_red;
        myTextArray[1] = "dog"; myColorArray[1] = c_green;
        myTextArray[2] = "house"; myColorArray[2] = c_blue;
        myTextArray[3] = "bee"; myColorArray[3] = c_yellow;
        MaloEmph(myTextArray,myColorArray)
    
    The function will then pass this into MaloLib's "obj_dialog"
    object which is usually called by the MaloBox function.
    
QUICKHAND USAGE:
    MaloEmph is automatically called every string written via MaloBox
    and looks for the following scriptmarks:
    
    [cr]red[/cr]
    [cg]green[/cg]
    [cb]blue[/cb]
    [cy]yellow[/cy]
    [cp]purple[/cp]
    
    If you are using these effects, it is recommended you use the
    provided scriptmarks instead of trying to handmake a solution,
    unless you have very specific needs.
*/


