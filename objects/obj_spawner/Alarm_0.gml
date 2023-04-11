while(NUM_OF_INSTANCES < MAX_INSTANCES_PER_SPAWN) {
	
	var offset = SPAWN_DISTANCE;
	var enemy_x = irandom_range(x - offset, x + offset);
	var enemy_y = irandom_range(y - offset, y + offset);
		
	var slime = instance_create_layer(enemy_x, enemy_y, "Instances", ENEMY_INSTANCE);
	ds_list_add(ENEMY_LIST, slime);
		
	NUM_OF_INSTANCES++;
	
}

SPAWN_LOCK = false;