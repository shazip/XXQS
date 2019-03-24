/// @params color
/// @params message
var _map=ds_map_create();
ds_map_add(_map,"type","cinfo");
ds_map_add(_map,"msgColor",argument0);
ds_map_add(_map,"message",argument1);
ds_map_add(_map,"sec",8);
ds_list_add(global.chatList,_map);
cAddChatList(_map);