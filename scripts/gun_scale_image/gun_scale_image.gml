// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function gun_scale_image(scale){
	var _scale = clamp(scale, 0, 1);
	image_xscale = _scale;
	image_yscale = _scale;
}