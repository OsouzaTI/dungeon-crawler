/// @description init shadow casting

vertex_format_begin();
vertex_format_add_position();
vertex_format_add_color();
VertexFormat = vertex_format_end();

VBuffer = vertex_create_buffer();

surf = -1;

LightPosRadius = shader_get_uniform(Shader0, "u_fLightPositionRadius");
PlayerPosition = shader_get_uniform(Shader0, "u_fPlayerPosition");
Time = shader_get_uniform(Shader0, "u_fTime");