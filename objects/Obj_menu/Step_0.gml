if keyboard_check_pressed(vk_up) {
    menu_selection = (menu_selection - 1 + array_length(menu)) mod array_length(menu);
}
if keyboard_check_pressed(vk_down) {
    menu_selection = (menu_selection + 1) mod array_length(menu);
}
if keyboard_check_pressed(vk_enter) {
    if (menu_selection == 0) { room_goto(Classic);}
    if (menu_selection == 1) { room_goto(Warp);}
    if (menu_selection == 2) { room_goto(Agent_Snake);}        
}