draw_set_font(fnt_damage);
draw_set_color(c_red);

draw_text(x, y - DAMAGE_OFFSET, DAMAGE);
y -= SHOW_DAMAGE_SPEED;
SHOW_DAMAGE_LIFE_CLICLE -= 1 / room_speed;

if(SHOW_DAMAGE_LIFE_CLICLE <= 0) {
	instance_destroy();	
}

draw_set_font(fnt_default);
draw_set_color(c_white);