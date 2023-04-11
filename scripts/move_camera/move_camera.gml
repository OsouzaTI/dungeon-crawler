// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function follow_camera(target){
	
	if(!instance_exists(target)) {
		exit;	
	}
	
	var cam_width = camera_get_view_width(view_camera[0]);
	var cam_height = camera_get_view_height(view_camera[0]);
	
	var _x_shake = 0, _y_shake = 0;
	if(screen_shake > 0) {
		_x_shake += random_range(-screen_shake, screen_shake);
		_y_shake += random_range(-screen_shake, screen_shake);
	}
	
	x = lerp(x, (target.x + _x_shake), 0.1);
	y = lerp(y, (target.y + _y_shake) - cam_height/16, 0.1);
	
	camera_set_view_pos(view_camera[0], x - cam_width/2, y - cam_height/2);
	
}