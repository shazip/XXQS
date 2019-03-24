/// @description 服务端网络
// You can write your code in this editor

var nid=ds_map_find_value(async_load,"id");
if(nid==global.serverSock){
	var type = ds_map_find_value(async_load, "type");
	switch(type){
		case network_type_connect:
			var sock = ds_map_find_value(async_load, "socket");
			ds_map_add(global.socketMap, sock,sock);
			sLog("oServer.Async.Networking","有客户端连接:["+string(sock)+"]");
			break;
			
		case network_type_disconnect:
			var sock = ds_map_find_value(async_load, "socket");
			var player=sGetPlayerBySock(sock);
			var tmp=noone;
			for(var i=0;i<ds_list_size(global.playerList);i++){
				var otPlayer =global.playerList[|i];
				if(otPlayer==player){
					tmp=i;
					continue;
				}
				sPlayer_sendDelPlayer(otPlayer,player);
				sPlayer_sendMsg(otPlayer,c_yellow,player[?"name"]+" 退出了游戏。");

			}
			sLog("oServer.Async.Networking","玩家["+player[?"name"]+"]退出游戏");
			ds_list_delete(global.playerList,tmp);
			sLog("oServer.Async.Networking","有客户端断开连接:["+string(sock)+"]");
			ds_map_delete(global.socketMap, sock);
			break;
	}
}else if(nid!=global.clientSock){
	var buff = ds_map_find_value(async_load, "buffer"); 
	sHandle(buff,nid);
}