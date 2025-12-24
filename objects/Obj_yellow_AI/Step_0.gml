
if state == STATE.SPAWNING && yellow == 1 && score == 3 {
    yellow--;
    var ai = instance_find(Obj_yellow_AI, 0);
    ai.state = STATE.ALIVE;
    var spawn = irandom_range(0, 3);
    sx = ai.x;
    sy = ai.y;
    if spawn == 1 {
        ai.x = irandom_range(0, 20) * cell;
        ai.y = 0;
        ai.image_angle = 0;
        ai.face = 3;
        ai.dir_x = 0;
        ai.dir_y = 1;
        ai.queued_face = -1;
    }
    else if spawn == 0 {
        ai.x = 672;
        ai.y = irandom_range(0, 20) * cell;
        ai.image_angle = 270;
        ai.face = 2;
        ai.dir_x = -1;
        ai.dir_y = 0;
        ai.queued_face = -1;
    }
    else if spawn == 2 {
        ai.x = 0;
        ai.y = irandom_range(0, 20) * cell;
        ai.image_angle = 90; 
        ai.face = 0;
        ai.dir_x = 1;
        ai.dir_y = 0;
        ai.queued_face = -1;
    }
    else if spawn == 3 {
        ai.x = irandom_range(0, 20) * cell; 
        ai.y = 672;
        ai.image_angle = 180;
        ai.face = 1;
        ai.dir_x = 0;
        ai.dir_y = -1;
        ai.queued_face = -1;
    }
    ds_list_clear(ai.snake);
    for (var i=0; i < irandom_range(4, 6); i++) {
        var seg_x = ai.x - ai.dir_x * cell * i;
        var seg_y = ai.y - ai.dir_y * cell * i;
        var _coord = {x: seg_x, y: seg_y};
        ds_list_insert(ai.snake,0, _coord);
    }
    ai.grow_remaining = 0;
}






if state == STATE.ALIVE {


//lock the player so thay cant run into themselves

    move_tick++;
    
    if (move_tick >= move_delay) {
        move_tick = 0;
        
        straight_face = face;
        right_face = (face + 3) mod 4;
        left_face = (face + 1) mod 4;
        
        face_dx = [ 1,  0, -1,  0];
        face_dy = [ 0, -1,  0,  1];
        
        test_face = left_face;

        var apple = instance_find(Obj_apple, 0);
        var player = Obj_head_AG;
        
        if (apple == noone) {
        queued_face = -1; // or keep going straight
        exit;
        }

        
        
        var panic_tiles = 2;     // too close = basically forbidden
        var fear_tiles  = 6;     // inside this radius = penalize
        var fear_weight = 4;     // bigger = more cowardly

        var best_face = straight_face;
        var best_score = -10000000000; // very low

//loop candiddates manually
for (var k = 0; k < 3; k++) {
    var faces = [ straight_face, left_face, right_face ];
    var tf = faces[k];

    // convert face -> dx,dy
    var dx = face_dx[tf];
    var dy = face_dy[tf];

    // predict next tile
    var nx = x + dx * cell;
    var ny = y + dy * cell;

    // wrap
    nx = (nx + room_width) mod room_width;
    ny = (ny + room_height) mod room_height;

    // distance to apple (want smaller)
    var dA = abs(nx - apple.x) + abs(ny - apple.y);

    // distance to player head (want larger)
    var dP = abs(nx - player.x) + abs(ny - player.y);

    // base score: chase apple
    var move_score = -dA;

    // coward penalty
    if (dP <= panic_tiles * cell) {
        move_score -= 1000000; // basically forbidden
    } else if (dP <= fear_tiles * cell) {
        // closer to player => bigger penalty
        move_score -= fear_weight * (fear_tiles * cell - dP);
    }

    // tiny preference for straight to reduce jitter
    if (tf == straight_face) move_score += 1;

    // pick best
    if (move_score > best_score) {
        best_score = move_score;
        best_face = tf;
    }
}
        queued_face = (best_face == face) ? -1 : best_face;

        if (queued_face != -1) { // apply at most one turn per tile
            if (queued_face == 0) {
                image_angle = 90;
                face = 0;
                dir_x = 1;
                dir_y = 0;
            }
            if (queued_face == 1) {
                image_angle = 180;
                face = 1;
                dir_x = 0;
                dir_y = -1;
            }
            if (queued_face == 2) {
                image_angle = 270;
                face = 2;
                dir_x = -1;
                dir_y = 0;
            }
            if (queued_face == 3) {
                image_angle = 0;
                face = 3;
                dir_x = 0;
                dir_y = 1;
            }
        }
        
        
        next_x = x + dir_x * cell;
        next_y = y + dir_y * cell;
        
        next_x = (next_x + room_width) mod room_width;
        next_y = (next_y + room_height) mod room_height;
        
        
        var collider = instance_place(next_x, next_y, Obj_apple);
        if (collider != noone) {
            instance_destroy(collider);
            grow_remaining += 1;
            var valid = false;
            while (!valid) {
                ax = irandom_range(0, (room_width div cell) - 1) * cell
                ay = irandom_range(0, (room_height div cell) - 1) * cell
                valid = true;
                for (var i=0; i < ds_list_size(snake); i++) {
                    var _coord = snake[| i];
                    if _coord.x == ax && _coord.y == ay {
                        valid = false;
                        break;
                }
                } 
            }
            instance_create_depth(ax, ay, depth, Obj_apple);      
        }
        
        var hit_egg = instance_place(x, y, Obj_bullet);
        if (hit_egg != noone) {
            instance_destroy(hit_egg);

        if (ds_list_size(snake) > 1) {
            var last_index = ds_list_size(snake) - 1;
            ds_list_delete(snake, last_index);
        }
        }
        
        
        
        var coord_pair2 = {x: next_x, y: next_y};
        ds_list_insert(snake, 0, coord_pair2);
        
        var last_index = ds_list_size(snake) - 1;
    
        if grow_remaining == 0 
        {
            ds_list_delete(snake, last_index);
        }
        else {
            grow_remaining--;
        }
    
        
        x = next_x; 
        y = next_y; 
    }
}


    

//move with the head
if state == STATE.DEAD {
    image_alpha = 0;
    instance_destroy();
    }