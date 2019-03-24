/// @description 定时清除聊天信息
// You can write your code in this editor

var size=ds_list_size(global.chatList);

if(!global.iThePlayer.openChat){
	for(var i=size-1;i>=0;i--){
		var _map=global.chatList[|i];
		if(_map!=undefined){
			var _sec=_map[?"sec"];
			if(_sec>0){
				ds_map_set(_map,"sec",_sec-1);
			}else{
				ds_list_delete(global.chatList,i);
			}
		}
	}
}

alarm[0]=60;
