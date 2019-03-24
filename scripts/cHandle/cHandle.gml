/// @params sock
var buff=argument0;
var tag=buffer_read(buff,buffer_u16);
switch(tag){
	
	#region CT_ADD_PLAYER
	case CT_ADD_PLAYER:
		var _name=buffer_read(buff,buffer_string);
		var _x=buffer_read(buff,buffer_u16);
		var _y=buffer_read(buff,buffer_u16);
		if(_name!=global.iThePlayer.name){
			var inst=instance_create_depth(_x,_y,100,oNwPlayer);
			inst.x=_x;
			inst.y=_y;
			inst.name=_name;
			ds_list_add(global.nwplayerList,inst);
			cLog("script::cHandle[CT_ADD_PLAYER]","有新玩家加入了游戏:["+_name+"]");
		}else{
			cLog("script::cHandle[CT_ADD_PLAYER]","我加入了游戏");
		}
	break;
	#endregion
	
	#region CT_DEL_PLAYER
	case CT_DEL_PLAYER:
		var _name=buffer_read(buff,buffer_string);
		cLog("script::cHandle[CT_DEL_PLAYER]","玩家["+_name+"]退出了游戏");
		for(var i=0;i<ds_list_size(global.nwplayerList);i++){
			var nwplayer=global.nwplayerList[|i];
			if(nwplayer.name==_name){
				instance_destroy(global.nwplayerList[|i]);
				ds_list_delete(global.nwplayerList,i);
				cLog("script::cHandle[CT_DEL_PLAYER]","清除了下线玩家["+_name+"]");
				break;
			}
		}
		break;
	#endregion
	
	#region CT_LOCATION
	case CT_LOCATION:
		var _name=buffer_read(buff,buffer_string);
		var _faceAngle=buffer_read(buff,buffer_u16);
		var _x=buffer_read(buff,buffer_u16);
		var _y=buffer_read(buff,buffer_u16);
		var _running=buffer_read(buff,buffer_bool);
		var _ming=buffer_read(buff,buffer_u16);
		var _energy=buffer_read(buff,buffer_u16);
		var _depth=buffer_read(buff,buffer_u16);
		var _hot=buffer_read(buff,buffer_u8);
		
		if(_name==global.iThePlayer.name){
			global.iThePlayer.x=_x;
			global.iThePlayer.y=_y;
			global.iThePlayer.ming=_ming;
			global.iThePlayer.energy=_energy;
			global.iThePlayer.hot=_hot;
			cLog("script::cHandle","更新我的位置至:["+string(_x)+","+string(_y)+"]");
		}else{
			var inst=cGetNwPlayerByName(_name);
			inst.x=_x;
			inst.y=_y;
			inst.faceAngle=_faceAngle;
			inst.running=_running;
			inst.ming=_ming;
			inst.energy=_energy;
			inst.depth=_depth;
			inst.hot=_hot;
			//cLog("script::cHandle","更新["+_name+"]的位置至:["+string(_x)+","+string(_y)+"]");
		}
	break;
	#endregion
	
	#region CT_PLAYER_CHAT
	case CT_PLAYER_CHAT:
		var _nameColor=buffer_read(buff,buffer_u32);
		var _name=buffer_read(buff,buffer_string);
		var _msgColor=buffer_read(buff,buffer_u32);
		var _message=buffer_read(buff,buffer_string);
		cAddChat(_nameColor,_name,_msgColor,_message);
		cLog("script::cHandle[CT_PLAYER_CHAT]",_name+":"+_message);

	break;
	#endregion

	#region CT_PLAYER_MSG
	case CT_PLAYER_MSG:
		var _msgColor=buffer_read(buff,buffer_u32);
		var _message=buffer_read(buff,buffer_string);
		cAddCinfo(_msgColor,_message);
		cLog("script::cHandle[CT_PLAYER_MSG]",_message);

	break;
	#endregion
	
	#region CT_GEN_TERRAIN
	case CT_GEN_TERRAIN:
		var trSize=buffer_read(buff,buffer_u8);
		cLog("script::cHandle[CT_GEN_TERRAIN]","生成地形中...");
		var terrtype=0;
		var jiya=0;
		for(var i=0;i<trSize;i++){
			var _d=buffer_read(buff,buffer_u16);
			switch(_d){
				case 10001:
					terrtype=0;
					break;
				case 10002:
					terrtype=1;
					break;
				case 10003:
					terrtype=2;
					break;
			}
			if(_d>10000){
				jiya++;
			}else{
				var ji=i-jiya;
				ds_list_set(global.terrain,ji,_d);
				var _t=instance_create_depth(ji*300,global.TERRAIN_HIGHT-100,102,oTerrain);
				_t.terrtype=terrtype;
				_t.sprite_index=rSandTerrain;
				_t.image_index=_d;
				ds_list_add(global.iTerrainList,_t);
			}
		}
		cLog("script::cHandle[CT_GEN_TERRAIN]","地形已生成.");

	break;
	#endregion
	
	#region CT_PLAYER_INV
	case CT_PLAYER_INV:
		for(var i=0;i<36;i++){
			var _item=buffer_read(buff,buffer_u16);
			var _count=buffer_read(buff,buffer_u8);
			var _itemEnt=noone;
			if(_count!=0){
				_itemEnt=ds_map_create();
				ds_map_set(_itemEnt,"item",_item);
				ds_map_set(_itemEnt,"count",_count);
			}else{
				_itemEnt=noone;
			}
			var _lastItemEnt=global.iThePlayer.inventory[|i];
			if(_lastItemEnt!=noone){
				ds_map_destroy(_lastItemEnt); //销毁之前的物品
			}
			ds_list_set(global.iThePlayer.inventory,i,_itemEnt); //更新物品
		}
		cLog("script::cHandle[CT_PLAYER_INV]","从服务器获取了背包数据.");
		break;
	#endregion
	
	#region CT_ADD_ITEMENT
	case CT_ADD_ITEMENT:
		var _item=buffer_read(buff,buffer_u16);
		var _count=buffer_read(buff,buffer_u8);
		cAddItemEnt(cBuildItemEnt(_item,_count));
		cLog("script::cHandle[CT_ADD_ITEMENT]","收到"+string(_count)+"个"+_item[?"name"]);
		break;
	#endregion
}