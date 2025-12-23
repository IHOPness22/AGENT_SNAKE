move_speed = 4;
tilemap = layer_tilemap_get_id("Tiles_Col");
face = noone;
ready = false;
length = 0;
score = 0;
cell = 32;
length = 1;
move_delay = 8;
move_tick = 0;
x = floor(x / cell) * cell;
y = floor(y / cell) * cell;

grow_remaining = 0;
snake = ds_list_create();
var coord_pair1 = { x: x, y : y};
ds_list_add(snake, coord_pair1);

dir_x = 1;
dir_y = 0;
queued_face = -1;

ax = noone; 
ay = noone;

game_over = false;

audio_play_sound(AGENT_THEME, false, true);

enum STATE {
    SPAWNING,
    ALIVE,
    DEAD
}

state = STATE.ALIVE;

shoot_cd = 40;