// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function move_keyboard(){
	
	// Define a velocidade máxima do jogador
	var player_max_speed = ANIMATOR_INPUT_RUN ? 3.5 : 2.5;

	// Define a aceleração do jogador
	var player_acceleration = 0.2;

	// Define a fricção do jogador
	var player_friction = 0.1;

	// offset de colisão
	var collision_offset = 2.00;

	// Move o jogador em direção ao mouse
	var _move =	keyboard_check(ord("W")) || keyboard_check(ord("A")) ||
				keyboard_check(ord("S")) || keyboard_check(ord("D"));
	
	
	var _direction_x = ANIMATOR_INPUT_RIGHT - ANIMATOR_INPUT_LEFT;
	var _direction_y = ANIMATOR_INPUT_DOWN - ANIMATOR_INPUT_UP;
	
	if (
		ANIMATOR_INPUT_UP	|| ANIMATOR_INPUT_DOWN ||
		ANIMATOR_INPUT_LEFT || ANIMATOR_INPUT_RIGHT
	) {
		
		// seta animação do player pelo animator
		animator_set_state(ANIMATOR_STATES.ANIMATOR_RUN, ANIMATOR_INPUT_RUN ? 2.0 : .8);
		
	    // Define a direção do jogador
	    var _direction = point_direction(x, y, x + sign(_direction_x), y + sign(_direction_y));

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