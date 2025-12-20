rightKey = keyboard_check_pressed(vk_right);
leftKey = keyboard_check_pressed(vk_left);
upKey = keyboard_check_pressed(vk_up);
downKey = keyboard_check_pressed(vk_down);

var _hor = rightKey - leftKey;
var _ver = downKey - upKey;
var face_angle = face * 90;

move_and_collide(_hor * move_speed, _ver * move_speed, tilemap, undefined, undefined, move_speed, move_speed); 

if (_hor > 0) {
    image_angle = 90;
    face = 0;
}
if (_hor < 0) {
    image_angle = 270;
    face = 2;
}
if (_ver < 0) {
    image_angle = 180;
    face = 1;
}
if (_ver > 0) {
    image_angle = 0;
    face = 3;
}

motion_set(face_angle, move_speed);