if(global.iClient.movItemEnt!=noone){
	var tmp=cSlotItemEnt(slot);
	if(tmp!=noone){
		ds_map_set(tmp,"count",tmp[?"count"]+global.iClient.movItemEnt[?"count"]);
		ds_map_destroy(global.iClient.movItemEnt);
		global.iClient.movItemEnt=noone;
	}
}