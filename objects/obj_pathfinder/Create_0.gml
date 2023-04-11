start_node = ds_priority_create();
open_list = ds_priority_create();
close_list = ds_priority_create();
path_list = ds_list_create();

start_node.f = 0;
start_node.g = 0;
start_node.h = 0;
start_node.parent = undefined;