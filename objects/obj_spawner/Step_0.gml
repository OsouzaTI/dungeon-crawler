NUM_OF_INSTANCES = ds_list_size(ENEMY_LIST);

for(var i = 0; i < ds_list_size(ENEMY_LIST); i++)
{
	var _enemy = ENEMY_LIST[| i];
	if(!instance_exists(_enemy)) {
		ds_list_delete(ENEMY_LIST, i);
	}
}

if (NUM_OF_INSTANCES == 0 && !SPAWN_LOCK)  {
	alarm[0] = SPAWN_TIME * room_speed;
	SPAWN_LOCK = true;
}