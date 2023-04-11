event_inherited();

if(
	!instance_exists(obj_player) ||
	!instance_exists(obj_dungeon_generator) ||
	!(ENEMY_LIFE > 0)
) exit;

if(distance_to_object(obj_player) < DETECTION_RANGE) {
	
	// ========= move em direção ao player
	animator_set_state(ANIMATOR_STATES.ANIMATOR_IDLE);
	
	var destination = {
		x: ((obj_player.x div 32) * 32),
		y: ((obj_player.y div 32) * 32) - 10,
	}

	if(mp_grid_path(obj_dungeon_generator.mp_grid, path, x, y, destination.x + ENEMY_RNG, destination.y + ENEMY_RNG, true)) {
		path_start(path, ENEMY_SPEED, path_action_stop, false);
	} else {
		move_towards_point(obj_player.x, obj_player.y, ENEMY_SPEED);
	}
	
	enemy_audio_move();
	
} else if (distance_to_object(obj_player) < DETECTION_RANGE * 1.2) {
	
	// escolhem caminhos aleatorios
	var destination = {
		x: (( (x + ENEMY_INTEREST_POINT.x) div 32) * 32),
		y: (( (y + ENEMY_INTEREST_POINT.y) div 32) * 32),
	}

	if(mp_grid_path(obj_dungeon_generator.mp_grid, path, x, y, destination.x, destination.y, true)) {
		path_start(path, ENEMY_SPEED, path_action_stop, false);
	}
	
	enemy_audio_move();
	
}