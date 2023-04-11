event_inherited();

randomize();

enum ENEMY_TYPES
{
	NONE,
	SLIME,
	SKELETON,
	ZOMBIE
};

DETECTION_RANGE = 120;

ENEMY_TYPE = ENEMY_TYPES.NONE;
ENEMY_SPEED = random_range(1, 2);
ENEMY_RNG = irandom_range(-irandom_range(10, 20), irandom_range(10, 20));
ENEMY_LIFE = 10;
ENEMY_INTEREST_POINT = new Vec2(0, 0);
ENEMY_KNOCKBACK_DISTANCE = 60;
ENEMY_KNOCKBACK_SPEED = 10;

path = path_add();


function animator_knockback() {
	
	x += ENEMY_KNOCKBACK_SPEED * ANIMATOR_DATA.x * 60 * (1/room_speed);	
	
	if(distance_to_point(ANIMATOR_PREVIOUS_PLAYER_POSITION.x, ANIMATOR_PREVIOUS_PLAYER_POSITION.y) > ENEMY_KNOCKBACK_DISTANCE) {
		animator_set_state_force(ANIMATOR_STATES.ANIMATOR_IDLE);
	}
	
}


function enemy_audio_move() {};

function enemy_select_point_interest() {
	// iniciando o alarme
	alarm[0] = room_speed * 5; // a cada 5 segundos
}


enemy_select_point_interest();