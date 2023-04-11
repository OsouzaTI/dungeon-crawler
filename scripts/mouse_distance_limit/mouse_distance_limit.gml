// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function mouse_distance_limit(object){
		
	var lx, ly;
	
	// define a distância máxima permitida entre o mouse e o player
	var maxDistance = 50;

	// calcular a distância entre o mouse e o player
	var distance = point_distance(object.x, object.y, mouse_x, mouse_y);

	// se a distância for maior do que a distância máxima, atualize a posição da luz
	if (distance > maxDistance) {
	    var _direction = point_direction(object.x, object.y, mouse_x, mouse_y);
	    lx = object.x + lengthdir_x(maxDistance, _direction);
	    ly = object.y + lengthdir_y(maxDistance, _direction);
	} else {
	    lx = mouse_x;
	    ly = mouse_y;
	}
	
	return {x: lx, y: ly};
	
}