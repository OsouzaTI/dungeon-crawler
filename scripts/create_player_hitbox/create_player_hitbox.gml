// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function create_player_hitbox(_x, _y, _sprite_index, _image_index, _hitbox, _layer = "Instances"){
	// instanciando a hitbox
	var hb = instance_create_layer(_x, _y, _layer, _hitbox);
	hb.sprite_index = _sprite_index;			
	hb.image_index = _image_index; // sprite do corte da espada	
	hb.image_xscale = image_xscale;
	hb.image_speed = PLAYER_ATTACK_IMAGE_SPEED;
}