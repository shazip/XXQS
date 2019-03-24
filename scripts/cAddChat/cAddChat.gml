/// @params nameColor
/// @params name
/// @params msgColor
/// @params message
var _map=ds_map_create();
ds_map_add(_map,"type","chat");
ds_map_add(_map,"nameColor",argument0);
ds_map_add(_map,"name",argument1);
ds_map_add(_map,"msgColor",argument2);
ds_map_add(_map,"message",argument3);
ds_map_add(_map,"sec",8);
ds_list_add(global.chatList,_map);
cAddChatList(_map);