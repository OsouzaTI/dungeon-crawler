// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function sprite_rotate_mouse(){

	var delta = {
		dx: mouse_x - x,
		dy: mouse_y - y
	};

	var angle = radtodeg(arctan2(delta.dy, delta.dx));

	// setando rotação da imagem
	image_angle = -angle;

}	