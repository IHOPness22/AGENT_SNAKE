if (state != STATE.ALIVE) exit;
for (var i = 1; i < ds_list_size(snake); i++) {
    var p = snake[| i];          // struct {x, y}
    draw_sprite(spr_yellow_body, 0, p.x, p.y);  // replace with your body sprite
}

if state == STATE.SPAWNING && yellow == 1 && score == 3 {
for (var i = 1; i < ds_list_size(ai.snake); i++) {
    var p = ai.snake[| i];          // struct {x, y}
    draw_sprite(spr_yellow_body, 0, p.x, p.y);  // replace with your body sprite
}
}

draw_self();
// draw head on top
