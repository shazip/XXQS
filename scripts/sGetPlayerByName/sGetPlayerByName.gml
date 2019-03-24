/// @params name
for(var i=0;i<ds_list_size(global.playerList);i++){
	var player=ds_list_find_value(global.playerList,i);
	if(player[?"name"]==argument0){
		return player;
	}	
}
return noone;