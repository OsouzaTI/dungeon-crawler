// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function player_hitbox_process(){

	with(obj_player_hitbox)
	{
		
		var hits_attack = ds_list_create();
		var hits = instance_place_list(x, y, obj_enemy, hits_attack, false);
		if (hits > 0) {
		
			for (var i = 0; i < hits; i++) {
			
				var enemy = hits_attack[| i];
				
				if(ds_list_find_index(enemies, enemy) == -1) {				
					ds_list_add(enemies, enemy);	
				
					var _critical_strike = CRITICAL_STRIKE;
					var _critical_rng = 1 - random(1);
					var _critical_damage = CRITICAL_DAMAGE;
					var _base_damage = BASE_DAMAGE;
					
					with (enemy)
					{
						var _damage = 0;
						if(_critical_rng < _critical_strike) {
							_damage = _base_damage + (_critical_damage * _base_damage);
						} else {
							_damage = _base_damage;
						}
					
						enemy_hit(_damage);
					
					};			
				}
			
			}
		
		}
	
		ds_list_destroy(hits_attack);
				

		// destroy a hitbox
		instance_destroy(self);
		
	};

}