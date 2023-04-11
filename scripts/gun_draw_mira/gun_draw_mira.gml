// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function gun_draw_mira(){
	
	draw_self();
	
	var dir = point_direction(obj_player.x, obj_player.y, mouse_x, mouse_y);
	
	draw_line_color(obj_player.x, obj_player.y, mouse_x, mouse_y, c_red, c_red);
	
}