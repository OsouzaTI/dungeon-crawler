// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function enemy_spawner_create(x, y, layer_id, object_spawner){
	instance_create_layer(x, y, layer_id, object_spawner);
}