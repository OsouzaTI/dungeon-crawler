// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function move_top_down(){

	velocity = 4;
	_gravity = 0;
	
	if(keyboard_check(vk_left)) {		
		hspeed = -velocity;			
	} else if (keyboard_check(vk_right)) {			
		hspeed = +velocity;			
	} else {
		hspeed = 0;
	}
	
	if(keyboard_check(vk_up)) {		
		vspeed = -velocity;			
	} else if (keyboard_check(vk_down)) {			
		vspeed = +velocity;			
	} else {
		vspeed = 0;
	}

	// Verifica a colisão com paredes
	if (place_meeting(x + hspeed, y, obj_wall_1)) {
	    while (!place_meeting(x + sign(hspeed), y, obj_wall_1)) {
	        x += sign(hspeed); // move o personagem horizontalmente até que não haja colisão
	    }
	    hspeed = 0; // para o movimento horizontal
	}

	// Verifica a colisão com paredes
	if (place_meeting(x, y + vspeed, obj_wall_1)) {
	    while (!place_meeting(x, y + sign(vspeed), obj_wall_1)) {
	        y += sign(vspeed); // move o personagem verticalmente até que não haja colisão
	    }
	    vspeed = 0; // para o movimento vertical
	}

	// movimenta o personagem
	x += hspeed;
	y += vspeed;

}