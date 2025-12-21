rightKey = keyboard_check_pressed(vk_right);
leftKey = keyboard_check_pressed(vk_left);
upKey = keyboard_check_pressed(vk_up);
downKey = keyboard_check_pressed(vk_down);


if (rightKey) {
    image_angle = 90;
    face = 0;
    dir_x = 1;
    dir_y = 0;
    
}
else if (leftKey) {
    image_angle = 270;
    face = 2;
    dir_x = -1;
    dir_y = 0;
}
else if (upKey) {
    image_angle = 180;
    face = 1;
    dir_x = 0;
    dir_y = -1;
}
else if (downKey) {
    image_angle = 0;
    face = 3;
    dir_x = 0;
    dir_y = 1;
}

if (rightKey || leftKey || downKey || upKey) {
    ready = true;
}

if (ready) {
    move_tick++;
    
    if (move_tick >= move_delay) {
        move_tick = 0;
        
        next_x = x + dir_x * cell;
        next_y = y + dir_y * cell;
        
        next_x = (next_x + room_width) mod room_width;
        next_y = (next_y + room_height) mod room_height;
        
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

//move with the head
