event_inherited();

image_xscale = 2;
image_yscale = 2;

function animator_idle() {
	
	if(sprite_index != spr_slime_green_left_idle) {
		sprite_index = spr_slime_green_left_idle;
		image_index = 0;
	}
	
	
};

function animator_hit() {
	
	if(sprite_index != spr_slime_green_right_idle) {
		sprite_index = spr_slime_green_right_idle;
		image_index = 0;
		ANIMATOR_DATA.set(obj_player.image_xscale, 0);
		animator_set_state(ANIMATOR_STATES.ANIMATOR_KNOCKBACK);
	}	
	
};

function animator_death() {


	if(sprite_index != spr_slime_green_left_dead) {
		sprite_index = spr_slime_green_left_dead;
		image_index = 0;
	}

	if(ANIMATOR_ANIMATION_END) {
		instance_destroy();
	}
	
	hspeed = 0;
	vspeed = 0;
	
};

// ========= STATUS FUNCTIONS


// ========= AUDIO FUNCS

function enemy_audio_move() {
	
	if(!audio_is_playing(snd_slime_move)) {
		sound_play(snd_slime_move, 1);
	}
	

};