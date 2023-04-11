// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function enemy_hit(_damage) {
	
	camera_screen_shake(irandom_range(20, 60));
	animator_set_state(ANIMATOR_STATES.ANIMATOR_HIT);
	
	//========= ENEMY SOUND
	switch (ENEMY_TYPE)
	{
		case ENEMY_TYPES.SLIME: {
			sound_play(snd_slime_hit, 2, false, .4, ANIMATOR_AUDIO_EMITTER_1);
		} break;
	}
		
	var d = instance_create_layer(x, y, "Damage", obj_damage);
	d.DAMAGE = _damage;
	
	ENEMY_LIFE -= _damage;
	if(ENEMY_LIFE <= 0) {
		// morte
		animator_set_state(ANIMATOR_STATES.ANIMATOR_DEATH, .45);
	}
	
}