// INPUTS

ANIMATOR_INPUT_UP		= keyboard_check(ord("W"));
ANIMATOR_INPUT_DOWN		= keyboard_check(ord("S"));
ANIMATOR_INPUT_LEFT		= keyboard_check(ord("A"));
ANIMATOR_INPUT_RIGHT	= keyboard_check(ord("D"));
ANIMATOR_INPUT_RUN		= keyboard_check(vk_shift);
ANIMATOR_INPUT_ATTACK	= mouse_check_button(mb_left);



switch (STATE)
{
	case ANIMATOR_STATES.ANIMATOR_IDLE: {
		animator_idle();
	} break;	
	case ANIMATOR_STATES.ANIMATOR_RUN: {
		animator_run();
	} break;	
	case ANIMATOR_STATES.ANIMATOR_JUMP: {
		animator_jump();
	} break;
	case ANIMATOR_STATES.ANIMATOR_ATTACK: {
		animator_attack();
	} break;
	case ANIMATOR_STATES.ANIMATOR_ATTACK_2: {
		animator_attack_2();
	} break;
	case ANIMATOR_STATES.ANIMATOR_ATTACK_3: {
		animator_attack_3();
	} break;
	case ANIMATOR_STATES.ANIMATOR_HIT: {
		animator_hit();
	} break;
	case ANIMATOR_STATES.ANIMATOR_DEATH: {
		animator_death();
	} break;
	case ANIMATOR_STATES.ANIMATOR_KNOCKBACK: {
		animator_knockback();
	} break;
	default: {
		STATE = ANIMATOR_STATES.ANIMATOR_IDLE;
		animator_idle();
	}
}