draw_text(10, 10, score);

draw_text(50, 10, "FPS: " + string(fps));


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

if call_score >= call_chance {
    draw_text_colour(384, 10, "MOM IS CALLING!!!", c_lime, c_lime, c_lime, c_lime, image_alpha);
}

if mom_here {
    alarm[1] = 30;
}