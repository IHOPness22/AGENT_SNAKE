key = keyboard_check_pressed(vk_anykey);
clockticker++;
starticker++;
if (clockticker >= timer) {
    clockticker = 0;
    random_index =  random(array_length(color) - 1);
    new_color = color[random_index];
} 

if starticker == 0 {
    repeat (9) {
    var random_x = irandom(room_width);
    var random_y = irandom(room_height);
    instance_create_layer(random_x, random_y, "Instances", Obj_stars);
    }
}
if starticker >= star_timer {
    starticker = -20;
    instance_destroy(Obj_stars);
}

if key {
    audio_play_sound(ENTER_SOUND, false, false);
    audio_stop_sound(TITLE_THEME);
    room_goto(input_menu);
}




