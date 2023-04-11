if (cooldown > 0) {
	cooldown -= 1 / room_speed;	
}

sprite_rotate_mouse();
gun_attach_player();
