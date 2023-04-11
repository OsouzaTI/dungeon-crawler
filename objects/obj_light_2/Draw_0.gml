if( !surface_exists(surf) ){
    surf = surface_create(room_width,room_height);
}


surface_set_target(surf);
draw_set_color(c_black);
draw_set_alpha(.8);
draw_rectangle(0, 0, room_width, room_height, 0);

gpu_set_blendmode(bm_subtract);

draw_circle(mouse_x, mouse_y, 100, 0);

gpu_set_blendmode(bm_normal);
draw_set_alpha(1);

surface_reset_target();
draw_surface(surf,0,0);