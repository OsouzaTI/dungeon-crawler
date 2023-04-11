function move_plataform(){
	
	velocity = 5;
	jump_speed = 15;
	_gravity = 1;
		
		
	if(keyboard_check(vk_left)) {		
		hspeed = -velocity;			
	} else if (keyboard_check(vk_right)) {			
		hspeed = +velocity;			
	} else {
		hspeed = 0;
	}

	// Verifica a colisão com paredes
	if (place_meeting(x + hspeed, y - 1, obj_wall_1)) {
	    while (!place_meeting(x + sign(hspeed), y - 1, obj_wall_1)) {
	        x += sign(hspeed); // move o personagem horizontalmente até que não haja colisão
	    }
	    hspeed = 0; // para o movimento horizontal
	}

	// verificando colisão como o chão
	if (!place_meeting(x, y + vspeed, obj_wall_1)) {	    
   		vspeed += _gravity;
	} else {
		y -= vspeed / 2;
		vspeed = 0;
	}
	
	// Pulo
	if (keyboard_check_pressed(vk_space)) {
	    // Verifica se está no chão antes de pular
	    if (place_meeting(x, y + 1, obj_wall_1)) {
	        vspeed = -jump_speed; // aplica a velocidade vertical do pulo
	    }
	}
	

}