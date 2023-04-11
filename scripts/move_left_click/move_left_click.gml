// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function move_left_click(){
	var destination = {
		x: (mouse_x div 32)	* 32 + 16,
		y: (mouse_y div 32)	* 32 + 16,
	}

	if(mp_grid_path(obj_dungeon_generator.mp_grid, path, x, y, destination.x, destination.y, true)) {
		path_start(path, 5, path_action_stop, false);
	}
}