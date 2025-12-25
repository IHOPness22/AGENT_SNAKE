move_speed = 3;
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

sx = 0;
sy = 0;


game_over = false;

green = 0;



state = STATE.SPAWNING;
randomize();