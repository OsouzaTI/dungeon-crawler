function Vec2(_x, _y) constructor
{
	x = _x;
	y = _y;
	
	function set(_x, _y) {
		x = _x;
		y = _y;
	}
	
	function is(_x, _y) {
		return x == _x && y == _y;
	}
	
	function distance() {
		return distance_to_point(x, y);
	}
	
	function rng_range(_x, _y) {
		x = irandom_range(_x, _y);
		y = irandom_range(_x, _y); 	
	}
	
	function is_zero() {
		return x == 0 && y == 0;	
	}
	
};	