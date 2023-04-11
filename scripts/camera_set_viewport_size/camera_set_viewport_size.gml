// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function camera_set_viewport_size(camera_id, width){
	camera_set_view_size(camera_id, width, (9/16) * width);
}