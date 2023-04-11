// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function sound_play(_sound, _priority, _repeat = false, _gain = .8, _emitter = ANIMATOR_AUDIO_EMITTER_0){
	
	audio_play_sound_on(_emitter, _sound, _repeat, _priority, _gain);
	
}