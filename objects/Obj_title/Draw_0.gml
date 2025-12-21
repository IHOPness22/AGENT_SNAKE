var title_screen = "AGENT SNAKE"
draw_text_colour(250, 64, title_screen, c_lime, c_lime, c_lime, c_lime, image_alpha); 
draw_set_font(Font1);
var enter_text = "PRESS ANY KEY"
if new_color == "GREEN" { 
    draw_text_colour(230, 192, enter_text, c_lime, c_lime, c_lime, c_lime, image_alpha); }
if new_color == "RED" {
    draw_text_colour(230, 192, enter_text, c_red, c_red, c_red, c_red, image_alpha); }
if new_color == "YELLOW" {
    draw_text_colour(230, 192, enter_text, c_yellow, c_yellow, c_yellow, c_yellow, image_alpha); }
if new_color == "WHITE" {
    draw_text_colour(230, 192, enter_text, c_white, c_white, c_white, c_white, image_alpha); }
if new_color == "BLUE" {
    draw_text_colour(230, 192, enter_text, c_blue, c_blue, c_blue, c_blue, image_alpha); }