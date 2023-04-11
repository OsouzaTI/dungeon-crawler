// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function move_mouse_direction(){
	
	// Define a velocidade máxima do jogador
	var player_max_speed = 5;

	// Define a aceleração do jogador
	var player_acceleration = 0.2;

	// Define a fricção do jogador
	var player_friction = 0.1;

	// offset de colisão
	var collision_offset = 2.00;

	// Move o jogador em direção ao mouse
	var mouse_distance = distance_to_point(mouse_x, mouse_y);
	if (keyboard_check(ord("W")) && mouse_distance > 10) {
		
		// seta animação do player pelo animator
		animator_set_state(ANIMATOR_STATES.ANIMATOR_RUN, .8);
		
	    // Define a direção do jogador
	    var _direction = point_direction(x, y, mouse_x, mouse_y);

	    // Define a aceleração horizontal e vertical do jogador
	    var acceleration_h = lengthdir_x(player_acceleration, _direction);
	    var acceleration_v = lengthdir_y(player_acceleration, _direction);

	    // Adiciona a aceleração à velocidade horizontal e vertical do jogador
	    hspeed += acceleration_h;
	    vspeed += acceleration_v;

	    // Limita a velocidade horizontal e vertical do jogador
	    hspeed = clamp(hspeed, -player_max_speed, player_max_speed);
	    vspeed = clamp(vspeed, -player_max_speed, player_max_speed);
	} else {
	    // Aplica a fricção horizontal e vertical do jogador
	    hspeed = physics_approach(hspeed, 0, player_friction);
	    vspeed = physics_approach(vspeed, 0, player_friction);
		
		if (hspeed == 0 && vspeed == 0) {
			// seta animação do player pelo animator
			animator_set_state(ANIMATOR_STATES.ANIMATOR_IDLE);
		}
		
	}

	// Verifica a colisão com paredes
	if (place_meeting(x + hspeed, y, obj_wall_1)) {
	    while (!place_meeting(x + sign(hspeed), y, obj_wall_1)) {
	        x += sign(hspeed); // move o personagem horizontalmente até que não haja colisão
	    }
		x += -sign(hspeed) * collision_offset;
	    hspeed = 0; // para o movimento horizontal
	} 

	if (place_meeting(x, y + vspeed, obj_wall_1)) {
	    while (!place_meeting(x, y + sign(vspeed), obj_wall_1)) {
	        y += sign(vspeed); // move o personagem verticalmente até que não haja colisão
	    }
		y += -sign(vspeed) * collision_offset;
	    vspeed = 0; // para o movimento vertical
	}


}