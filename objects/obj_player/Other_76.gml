if event_data[? "event_type"] == "sprite event" // or you can check "sprite event"
{
    switch (event_data[? "message"])
    {
        case "on_hit":{					
            // som do slash
			sound_play(snd_player_slash, 1);
			create_player_hitbox(x, y, sprite_index, image_index, obj_player_hitbox);
		} break;
        case "on_hit_3":{		
			if(!animator_is_state(ANIMATOR_STATES.ANIMATOR_ATTACK_3)) return;
            // som do slash
			sound_play(snd_player_slash, 1);
			create_player_hitbox(x, y, sprite_index, image_index, obj_player_hitbox);
		} break;
    }
} 