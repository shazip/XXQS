/// @params player
/// @params buff

var player=argument0;
var buff=argument1;
var len=buffer_read(buff,buffer_u8);
var cmdName=buffer_read(buff,buffer_string);
switch(cmdName){
	#region /list
	case "list":
		sPlayer_sendMsg(player,c_yellow,"→当前有"+string(sGetOnlinePlayers())+"/"+string(sGetMaxPlayers())+"个玩家在线");
		break;
	#endregion
	
	#region /player
	case "player":
		if(len==5){
			var targetName=buffer_read(buff,buffer_string);
			var typ=buffer_read(buff,buffer_string);
			var ci=buffer_read(buff,buffer_string);
						
			if(targetName=="@s"){
				targetName=player[?"name"];
			}
			
			if(sGetPlayerByName(targetName)==noone){
				#region MSG
				sPlayer_sendMsg(player,c_red,"→玩家 "+targetName+" 不在线.");
				sLog("script::sHandleCommand[/player]",player[?"name"]+" 没有成功执行命令.");
				#endregion
				break;
			}
			
			var target=sGetPlayerByName(targetName);
			
			if(target[?ci]==undefined){
				#region MSG
				sPlayer_sendMsg(player,c_red,"→"+target[?"name"]+" 没有 "+ci+" 属性.");
				sLog("script::sHandleCommand[/player]",player[?"name"]+" 没有成功执行命令.");
				#endregion
				break;
			}
			
			if(typ=="real"){
				ds_map_set(target,ci,real(buffer_read(buff,buffer_string)));
			}else if(typ=="string"){
				ds_map_set(target,ci,string(buffer_read(buff,buffer_string)));
			}
			sPlayer_sendLocation(target,target);
			#region MSG
			sPlayer_sendMsg(player,c_yellow,"→成功将 "+target[?"name"]+" 的 "+ci+" 设置为 "+string(target[?ci]));
			sLog("script::sHandleCommand[/player]",player[?"name"]+" 将 "+target[?"name"]+" 的 "+ci+" 设置为 "+string(target[?ci]));
			#endregion
		}else{
			#region MSG
			sPlayer_sendMsg(player,c_orange,"重新设置某玩家的属性.");
			sPlayer_sendMsg(player,c_orange,"用法: /player <玩家> <real/string> <标签> <值>");
			sLog("script::sHandleCommand[/player]","["+player[?"name"]+"]执行此命令时格式错误");
			#endregion
		}
		break;
	#endregion

	#region /give
	case "give":
		if(len==4){
			var targetName=buffer_read(buff,buffer_string);
			var itemName=buffer_read(buff,buffer_string);
			var count=real(buffer_read(buff,buffer_string));
		
			if(targetName=="@s"){
				targetName=player[?"name"];
			}
			
			if(sGetPlayerByName(targetName)==noone){
				#region MSG
				sPlayer_sendMsg(player,c_red,"→玩家 "+targetName+" 不在线.");
				sLog("script::sHandleCommand[/give]",player[?"name"]+" 没有成功执行命令.");
				#endregion
				break;
			}
			
			if(global.item[?itemName]==undefined){
				#region MSG
				sPlayer_sendMsg(player,c_red,"→没有名为 "+itemName+" 的物品.");
				sLog("script::sHandleCommand[/give]",player[?"name"]+" 没有成功执行命令.");
				#endregion
				break;
			}
		
			var item=global.item[?itemName];
		
			if(count<=0 or count >item[?"max"]){
				#region MSG
				sPlayer_sendMsg(player,c_red,"→物品 "+itemName+" 的叠加范围是 1到"+string(item[?"max"]));
				sLog("script::sHandleCommand[/give]",player[?"name"]+" 没有成功执行命令.");
				#endregion
				break;
			}
		
			var target=sGetPlayerByName(targetName);
		
			sPlayer_sendAddItem(player,item,count);
			#region MSG
			sPlayer_sendMsg(player,c_yellow,"→成功将 "+string(count)+" 个 "+item[?"name"]+" 给予 "+targetName);
			sLog("script::sHandleCommand[/player]",player[?"name"]+" 将 "+string(count)+" 个 "+item[?"name"]+" 给予 "+targetName);
			#endregion
		}else{
			#region MSG
			sPlayer_sendMsg(player,c_orange,"给予某玩家指定物品.");
			sPlayer_sendMsg(player,c_orange,"用法: /give <玩家> <物品> <数量>");
			sLog("script::sHandleCommand[/give]","["+player[?"name"]+"]执行此命令时格式错误");
			#endregion
		}
		break;
	#endregion
	
	#region /tp
	case "tp":
		if(len==4){
			var targetName=buffer_read(buff,buffer_string);
						
			if(targetName=="@s"){
				targetName=player[?"name"];
			}
			
			if(sGetPlayerByName(targetName)==noone){
				#region MSG
				sPlayer_sendMsg(player,c_red,"→玩家 "+targetName+" 不在线.");
				sLog("script::sHandleCommand[/tp]",player[?"name"]+" 没有成功执行命令.");
				#endregion
				break;
			}
			
			var _x=real(buffer_read(buff,buffer_string));
			var _y=real(buffer_read(buff,buffer_string));
			var target=sGetPlayerByName(targetName);
			ds_map_set(player,"x",_x);
			ds_map_set(player,"y",_y);
			sPlayer_sendLocation(target,target);
			#region MSG
			sPlayer_sendMsg(player,c_yellow,"→已将 "+targetName+" 传送至 ["+string(_x)+","+string(_y)+"]");
			sLog("script::sHandleCommand[/tp]",player[?"name"]+" 将 "+targetName+" 传送至 ["+string(_x)+","+string(_y)+"]");
			#endregion
		}else{
			#region MSG
			sPlayer_sendMsg(player,c_orange,"传送玩家到指定位置.");
			sPlayer_sendMsg(player,c_orange,"用法: /tp <玩家> <x> <y>");
			sLog("script::sHandleCommand[/tp]","["+player[?"name"]+"]执行此命令时格式错误");
			#endregion
		}
	break;
	#endregion
	
	default:
		sPlayer_sendMsg(player,c_red,"→未知命令");
		break;
}