move_speed = 4;
tilemap = layer_tilemap_get_id("Tiles_Col");
face = 0;
ready = false;
length = 0;
score = 0;

grow_remaining = 0;
snake = ds_list_create();
var coord_pair1 = { x: x, y : y};
snake[0] = ds_list_add(snake, coord_pair1);


