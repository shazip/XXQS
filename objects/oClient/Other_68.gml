/// @description 客户端网络
// You can write your code in this editor
var nid=ds_map_find_value(async_load,"id");
if(nid==global.clientSock){
	var buff=ds_map_find_value(async_load,"buffer");
	cHandle(buff);
}