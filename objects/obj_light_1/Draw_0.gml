if( !surface_exists(surf) ){
    surf = surface_create(room_width,room_height);
}


var delta = {
	dx: mouse_x - x,
	dy: mouse_y - y
};

var angle = radtodeg(arctan2(delta.dy, delta.dx));

var mouse_position = mouse_distance_limit(obj_player);
var lx = mouse_position.x;
var ly = mouse_position.y;
//var lx = obj_player.x;       // the light position, based around the mouse location
//var ly = obj_player.y;

var rad = 260;            // the radius of the light
var tile_size = 32;     // size of a tile
var tilemap = layer_tilemap_get_id("DungeonWallTiles");


var startx = floor((lx-rad)/tile_size);
var endx = floor((lx+rad)/tile_size);
var starty = floor((ly-rad)/tile_size);
var endy = floor((ly+rad)/tile_size);

draw_set_color(c_yellow);
draw_rectangle(startx*tile_size,starty*tile_size, endx*tile_size,endy*tile_size,true);  

surface_set_target(surf);
draw_clear_alpha(0,0);

// processando a caixa ao redor da luz
vertex_begin(VBuffer, VertexFormat);
for(var yy=starty;yy<=endy;yy++)
{
    for(var xx=startx;xx<=endx;xx++)
    {
        var tile = tilemap_get(tilemap,xx,yy);
        if( tile!=0 ){

			// get corners of the 
            var px1 = xx*tile_size;     // top left
            var py1 = yy*tile_size;
            var px2 = px1+tile_size;    // bottom right
            var py2 = py1+tile_size;

			if( !shadow_sign_test( px1,py1, px2,py1, lx,ly) ){
		        shadow_project(VBuffer,  px1,py1, px2,py1, lx,ly );
		    }
			
		    if( !shadow_sign_test( px2,py1, px2,py2, lx,ly) ){
		        shadow_project(VBuffer,  px2,py1, px2,py2, lx,ly );
		    }
			
		    if( !shadow_sign_test( px2,py2, px1,py2, lx,ly) ){
		        shadow_project(VBuffer,  px2,py2, px1,py2, lx,ly );
		    }
			
		    if( !shadow_sign_test( px1,py2, px1,py1, lx,ly) ){
		        shadow_project(VBuffer,  px1,py2, px1,py1, lx,ly );                      
		    }


        }
    }
}

vertex_end(VBuffer);    
vertex_submit(VBuffer,pr_trianglelist,-1);

surface_reset_target();

shader_set(Shader0);
shader_set_uniform_f( LightPosRadius, lx, ly, rad, 0.0 );
shader_set_uniform_f( PlayerPosition, obj_player.x, obj_player.y );
shader_set_uniform_f( Time, current_time );
draw_surface(surf,0,0);
shader_reset();
