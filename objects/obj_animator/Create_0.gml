///@desc Animação
vector2d();

enum ANIMATOR_STATES 
{
	ANIMATOR_IDLE,
	ANIMATOR_RUN,
	ANIMATOR_JUMP,
	ANIMATOR_ATTACK,
	ANIMATOR_ATTACK_2,
	ANIMATOR_ATTACK_3,
	ANIMATOR_HIT,
	ANIMATOR_KNOCKBACK,
	ANIMATOR_DEATH
};

ANIMATOR_SPEED = .5;
ANIMATOR_FLIP = false;
ANIMATOR_ANIMATION_END = false;
ANIMATOR_PREVIOUS_POSITION = new Vec2(0, 0);
ANIMATOR_PREVIOUS_PLAYER_POSITION = new Vec2(0, 0);
ANIMATOR_DATA = new Vec2(0, 0);

// Audio emitters
ANIMATOR_AUDIO_EMITTER_0 = audio_emitter_create();
ANIMATOR_AUDIO_EMITTER_1 = audio_emitter_create();


// estado inicial 
STATE = ANIMATOR_STATES.ANIMATOR_IDLE;

// functions
function animator_set_state(_state,  _speed = ANIMATOR_SPEED) {
	var _is_idle_or_run =	(STATE == ANIMATOR_STATES.ANIMATOR_IDLE)		||
							(STATE == ANIMATOR_STATES.ANIMATOR_RUN)			||
							(STATE == ANIMATOR_STATES.ANIMATOR_HIT);
							
	if (STATE != _state && (ANIMATOR_ANIMATION_END || _is_idle_or_run) ) {		
		ANIMATOR_ANIMATION_END = false;
		STATE = _state;
		image_speed = _speed;	
		ANIMATOR_PREVIOUS_POSITION.set(x, y);
		if(!animator_is_state(ANIMATOR_STATES.ANIMATOR_IDLE)) {
			ANIMATOR_PREVIOUS_PLAYER_POSITION.set(obj_player.x, obj_player.y);
		}
	}
}

function animator_set_state_force(_state,  _speed = ANIMATOR_SPEED) {
							
	if (STATE != _state) {		
		ANIMATOR_ANIMATION_END = false;
		STATE = _state;
		image_speed = _speed;	
		ANIMATOR_PREVIOUS_POSITION.set(x, y);
		if(!animator_is_state(ANIMATOR_STATES.ANIMATOR_IDLE)) {
			ANIMATOR_PREVIOUS_PLAYER_POSITION.set(obj_player.x, obj_player.y);
		}
	}
	
}


function animator_is_state(_state) {
	return STATE == _state;
}

function animator_set_flip(_flip) {
	if (ANIMATOR_FLIP != _flip) {
		ANIMATOR_FLIP = _flip;
		if(ANIMATOR_FLIP) {
			image_xscale = -1; // flip horizontal para a esquerda
		} else {
			image_xscale =  1; // flip horizontal para a esquerda
		}
	}
}

function animation_end() {
	return ANIMATOR_ANIMATION_END;
}

function animator_idle() {};
function animator_run() {};
function animator_jump() {};
function animator_attack() {};
function animator_attack_2() {};
function animator_attack_3() {};
function animator_hit() {};
function animator_death() {};
function animator_knockback() {};