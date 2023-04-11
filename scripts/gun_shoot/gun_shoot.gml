// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function gun_shoot(object_bullet){

	if(mouse_check_button(mb_left) && cooldown <= 0) {
		
		if(AMMUNITION < 0) exit;
		
		// caso tenha munição
		instance_create_layer(x, y, "Ammos", object_bullet);
		cooldown = FIRE_RATE;
		
	}

}