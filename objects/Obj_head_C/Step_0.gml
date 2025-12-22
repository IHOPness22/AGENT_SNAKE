if state == STATE.ALIVE {

rightKey = keyboard_check_pressed(vk_right);
leftKey = keyboard_check_pressed(vk_left);
upKey = keyboard_check_pressed(vk_up);
downKey = keyboard_check_pressed(vk_down);


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
        
        //check if snake collides with wall
        if (next_x < 0 || next_x >= room_width || next_y < 0 || next_y >= room_height)
        {
            state = STATE.DEAD;
            //add game over function
        }
        
        var collider = instance_place(next_x, next_y, Obj_apple);
        if (collider != noone) {
            instance_destroy(collider);
            score += 1;
            grow_remaining += 1;
            instance_create_depth(random_range(0, (room_width div cell) - 1) * cell, random_range(0, (room_height div cell) - 1) * cell, depth, Obj_apple);
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
    
}