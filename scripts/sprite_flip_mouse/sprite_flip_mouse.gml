// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function sprite_flip_mouse() {

	// Calcule a direção do mouse em relação ao objeto
	dir = point_direction(x, y, mouse_x, mouse_y);

	// Altere a escala horizontal do sprite do objeto com base na direção do mouse
	if (dir > 90 && dir < 270) {
	    return true;
	} else {
	    return false;
	}

}