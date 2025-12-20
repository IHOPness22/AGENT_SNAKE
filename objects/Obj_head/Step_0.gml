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
        
        x += dir_x * cell;
        y += dir_y * cell;
        
        x = (x + room_width) mod room_width;
        y = (y + room_height) mod room_height;
    }
}





move_wrap(true, true, 32); //makes player 

var collider = instance_place(x, y, Obj_apple);
if (collider != noone) {
    instance_destroy(collider);
    score += 1;
    length += 1;
    instance_create_depth(random_range(0, (room_width div cell) - 1) * cell, random_range(0, (room_height div cell) - 1) * cell, depth, Obj_apple);
}


//move with the head
