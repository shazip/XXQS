/// @params map

ds_list_add(global.chatList2,argument0);
if(ds_list_size(global.chatList2)>24){
	ds_map_destroy(global.chatList2[|0]);
	ds_list_delete(global.chatList2,0);
}