if keyboard_check_pressed(vk_up) {
    audio_play_sound(KEY_SOUND, false, false);
    menu_selection = (menu_selection - 1 + array_length(menu)) mod array_length(menu);
}
if keyboard_check_pressed(vk_down) {
    audio_play_sound(KEY_SOUND, false, false);
    menu_selection = (menu_selection + 1) mod array_length(menu);
}
if keyboard_check_pressed(vk_enter) {
    audio_play_sound(ENTER_SOUND, false, false);
    if (menu_selection == 0) { room_goto(Classic);}
    if (menu_selection == 1) { room_goto(Warp);}
    if (menu_selection == 2) { room_goto(Tutorial);}  
    audio_stop_sound(MENU_THEME);          
}