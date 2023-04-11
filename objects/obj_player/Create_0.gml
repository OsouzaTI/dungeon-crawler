event_inherited();

PLAYER_ATTACK_IMAGE_SPEED = .8;

function animator_idle() {
	
	if(sprite_index != spr_player_idle) {
		sprite_index = spr_player_idle;
		mask_index = spr_player_collision_mask;
		image_index = 0;
	}
	
};

function animator_run() {
	
	if(sprite_index != spr_player_run) {
		sprite_index = spr_player_run;
		mask_index = spr_player_collision_mask;
		image_index = 0;		
	}
	
};

function animator_attack() {
	
	if(sprite_index != spr_player_attack) {
		sprite_index = spr_player_attack;		
		image_index = 0;		
	}
	
	player_hitbox_process();
	
	if(ANIMATOR_INPUT_ATTACK && animation_frame_in_range(2, 4)) {
		animator_set_state_force(ANIMATOR_STATES.ANIMATOR_ATTACK_2, PLAYER_ATTACK_IMAGE_SPEED);	
	}
	
};


function animator_attack_2() {
	
	if(sprite_index != spr_player_attack_combo) {
		sprite_index = spr_player_attack_combo;	
		image_index = 0;
	}
	
	player_hitbox_process();
	
	if(ANIMATOR_INPUT_ATTACK && animation_frame_in_range(9, 11)) {
		animator_set_state_force(ANIMATOR_STATES.ANIMATOR_ATTACK_3, PLAYER_ATTACK_IMAGE_SPEED);	
	}
	
}

function animator_attack_3() {
	
	if(sprite_index != spr_player_attack_spinning) {
		sprite_index = spr_player_attack_spinning;	
		image_index = 0;
	}
	
	player_hitbox_process();
			
}

path = path_add();
