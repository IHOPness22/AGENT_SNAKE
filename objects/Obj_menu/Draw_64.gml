var box_w = 260;
var box_h = 90;
var pad   = 8;

x = display_get_gui_width()  - box_w - pad;
y = pad;

draw_sprite_stretched(spr_box, 0, x, y, box_w, box_h); //create the box first before doing text

draw_set_font(Font1);
draw_set_color(c_lime);  
draw_text(x + 50, y + 30, "CHOOSE MODE"); //the text for first box 

var box_w2 = 260;
var box_h2 = 290;  

draw_sprite_stretched(spr_box, 0, x, y + 90, box_w2, box_h2); //create second box

draw_set_font(Font1);
draw_set_color(c_lime);
draw_text(x + 90, y + 130, "CLASSIC"); //text for second box

draw_set_font(Font1);
draw_set_color(c_lime);
draw_text(x + 90, y + 210, "WARP"); //text for second box

draw_set_font(Font1);
draw_set_color(c_lime);
draw_text(x + 90, y + 290, "AGENT SNAKE");

if (menu_selection == 0) {
    draw_set_font(Font1);
    draw_set_color(c_purple);
    draw_text(x + 70, y + 130, ">");
}
if (menu_selection == 1) {
    draw_set_font(Font1);
    draw_set_color(c_purple);
    draw_text(x + 70, y + 210, ">");
}
if (menu_selection == 2) {
    draw_set_font(Font1);
    draw_set_color(c_purple);
    draw_text(x + 70, y + 290, ">");
}


