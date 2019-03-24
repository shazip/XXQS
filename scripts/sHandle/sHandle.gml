var buff=argument0;
var sock=argument1;
var tag=buffer_read(buff,buffer_u16);

switch(tag){
	
	#region ST_PLAYER_JOIN
	case ST_PLAYER_JOIN:
		var name=buffer_read(buff,buffer_string);
		if(sGetPlayerByName(name)!=noone){
			network_destroy(sock);
			sLog("script::sHandle[ST_PLAYER_JOIN]","服务器中已存在相同名字的玩家:["+name+"],断开连接");
			break;
		}
		var pwd=buffer_read(buff,buffer_string);
		var player=ds_map_create();
		ds_map_add(player,"name",name);
		ds_map_add(player,"pwd",pwd);
		ds_map_add(player,"sock",sock);
		ds_map_add(player,"faceAngle",0);
		ds_map_add(player,"running",false);
		ds_map_add(player,"ming",200);
		ds_map_add(player,"energy",500);
		ds_map_set(player,"depth",10);
		ds_map_set(player,"hot",40);
		var _pmnList=ds_list_create();
		ds_map_add(player,"pmnList",_pmnList);
		ds_map_add(player,"x",global.serverWorld[?"spawnX"]);
		ds_map_add(player,"y",global.serverWorld[?"spawnY"]);
		var _invList=ds_list_create();
		repeat(36){
			ds_list_add(_invList,noone);
		}

		ds_map_add(player,"inv",_invList);

		
		//把全部在线玩家介绍给新玩家
		for(var i=0;i<ds_list_size(global.playerList);i++){
			var otPlayer =ds_list_find_value(global.playerList,i);
			sPlayer_sendAddPlayer(player,otPlayer);
		}
		
		//把新玩家介绍给所有在线玩家
		for(var i=0;i<ds_list_size(global.playerList);i++){
			var otPlayer =ds_list_find_value(global.playerList,i);
			sPlayer_sendAddPlayer(otPlayer,player);
			sPlayer_sendMsg(otPlayer,c_yellow,player[?"name"]+" 加入了游戏！");
		}
		
		ds_list_add(global.playerList,player);
		
		sPlayer_sendLocation(player,player); //更新位置
		sPlayer_sendInventory(player,player); //更新背包
		sLog("script::sHandle","玩家["+name+"]加入服务器");
		sPlayer_sendMsg(player,c_yellow,"你加入了游戏.");
		sPlayer_sendMsg(player,c_yellow,"当前一共有"+string(sGetOnlinePlayers())+"个玩家在线.");
		break;
		
	#endregion

	#region ST_PLAYER_LOCATION
	case ST_PLAYER_LOCATION:
		var player=sGetPlayerBySock(sock);
		ds_map_set(player,"faceAngle",buffer_read(buff,buffer_u16));
		ds_map_set(player,"x",buffer_read(buff,buffer_u16));
		ds_map_set(player,"y",buffer_read(buff,buffer_u16));
		ds_map_set(player,"running",buffer_read(buff,buffer_bool));
		ds_map_set(player,"ming",buffer_read(buff,buffer_u16));
		ds_map_set(player,"energy",buffer_read(buff,buffer_u16));
		ds_map_set(player,"depth",buffer_read(buff,buffer_u16));
		ds_map_set(player,"hot",buffer_read(buff,buffer_u8));
		for(var i=0;i<ds_list_size(global.playerList);i++){
			var otPlayer =ds_list_find_value(global.playerList,i);
			if(otPlayer!=player){
				sPlayer_sendLocation(player,otPlayer);
			}
		}
		break;
	#endregion
	
	#region ST_PLAYER_CHAT
	case ST_PLAYER_CHAT:
		var player=sGetPlayerBySock(sock);
		var message=buffer_read(buff,buffer_string);
		if(string_length(message)>50){
			sLog("script::sHandle","玩家["+player+"]发送了过长的聊天，长度为："+string_length(message));
			break;
		}
		//把收到的聊天消息发送给全部人
		for(var i=0;i<ds_list_size(global.playerList);i++){
			var otPlayer=ds_list_find_value(global.playerList,i);
			var _nameColor=c_lime;
			var _msgColor=c_white;
			if(sPlayer_hasPermission(player,"pnm.op")){
				_nameColor=c_red;
				_msgColor=c_yellow;
			}
			sPlayer_sendChat(otPlayer,_nameColor,player[?"name"],_msgColor,message);
			sLog("script::sHandle[CHAT]",player[?"name"]+":"+message);
		}
		
		break;
	#endregion
	
	#region ST_PLAYER_CMD
	case ST_PLAYER_CMD:
		var player=sGetPlayerBySock(sock);
		sHandleCommand(player,buff);
		break;
	#endregion
	
	#region ST_GEN_TERRAIN
	case ST_GEN_TERRAIN:
		var player=sGetPlayerBySock(sock);
		sLog("script::sHandle","["+player[?"name"]+"]请求生成地形");
		sPlayer_sendGenTerrain(player);
		sLog("script::sHandle","地形已发送给["+player[?"name"]+"]");
		break;
	#endregion
	
	#region ST_PLAYER_INV
	case ST_PLAYER_INV:
		var player=sGetPlayerBySock(sock);
		for(var i=0;i<36;i++){
			var _item=buffer_read(buff,buffer_u16);
			var _count=buffer_read(buff,buffer_u8);
			var _inv=player[?"inv"];
			var _itemEnt=noone;
			if(_count!=0){
				_itemEnt=ds_map_create();
				ds_map_set(_itemEnt,"item",_item);
				ds_map_set(_itemEnt,"count",_count);
			}else{
				_itemEnt=noone;
			}
			var _lastItemEnt=_inv[|i];
			if(_lastItemEnt!=noone){
				ds_map_destroy(_lastItemEnt); //销毁之前的物品
			}
			ds_list_set(player[?"inv"],i,_itemEnt); //更新物品
		}
		sLog("script::sHandle[ST_PLAYER_INV]","玩家["+player[?"name"]+"]发送来了背包数据.");
		break;
	#endregion 
	
	#region ST_PLAYER_OPEN_INV
	case ST_PLAYER_OPEN_INV:
		var player=sGetPlayerBySock(sock);
		sLog("script::sHandle[ST_PLAYER_OPEN_INV]","玩家["+player[?"name"]+"打开背包.");
		break;
	#endregion

	#region ST_PLAYER_GET_INV
	case ST_PLAYER_GET_INV:
		var player=sGetPlayerBySock(sock);
		sPlayer_sendInventory(player,player);
		break;
	#endregion
	
}
