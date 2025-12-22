draw_text(10, 10, score);

if state == STATE.DEAD {
    var box_w = 260;
    var box_h = 90;
    var pad   = 8;

    x = display_get_gui_width()  - box_w - pad;
    y = pad;

    draw_sprite_stretched(spr_box, 0, 200, 139, box_w, box_h);
    
    
    draw_text_colour(230, 169, "SCORE:", c_lime, c_lime, c_lime, c_lime, 1);
    
    draw_text(330, 169, score);
}