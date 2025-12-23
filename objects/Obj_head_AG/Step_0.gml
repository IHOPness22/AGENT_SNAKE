if state == STATE.ALIVE {
    

rightKey = keyboard_check_pressed(vk_right);
leftKey = keyboard_check_pressed(vk_left);
upKey = keyboard_check_pressed(vk_up);
downKey = keyboard_check_pressed(vk_down);
shootKey = keyboard_check_pressed(vk_space);    


if (rightKey && face != 2) { queued_face = 0; }
else if (leftKey && face != 0) { queued_face = 2 }
else if (upKey && face != 3) { queued_face = 1; }
else if (downKey && face != 1) { queued_face = 3; }


if (rightKey || leftKey || downKey || upKey) {
    ready = true;
}  



//lock the player so thay cant run into themselves
if (ready) {
    move_tick++;
    
    if (move_tick >= move_delay) {
        move_tick = 0;
        
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
        
        
        //check if snake collides with its own body 
        var hit = false;
        if (!hit) {
        for (var i=0; i<ds_list_size(snake); i++) {
            var _coord = snake[| i];
            if (_coord.x == next_x && _coord.y == next_y) {
                state = STATE.DEAD;
                hit = true;
            }
        }
            
        }
        
        
        var collider = instance_place(next_x, next_y, Obj_apple);
        if (collider != noone) {
            instance_destroy(collider);
            score += 1;
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
}

//move with the head
if state == STATE.DEAD {
    image_alpha = 0;
    if keyboard_check_pressed(vk_enter) {
        audio_stop_sound(AGENT_THEME);
        room_goto(input_menu);
    }
}

//make max amounts egg depending on size 
var egg_cap = ds_list_size(snake);
var eggs_active = instance_number(Obj_bullet);


//lay egg mechanics
shoot_cd--;
if (shoot_cd <= 0 && shootKey && eggs_active < egg_cap) {
    var last_index = ds_list_size(snake) - 1;
    var _coord = snake[| last_index];
    var b = instance_create_depth(_coord.x, _coord.y, depth, Obj_bullet);
    b.dir_x = dir_x;
    b.dir_y = dir_y;
    shoot_cd = 20;
}