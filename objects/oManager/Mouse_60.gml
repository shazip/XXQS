if(global.iClient.movItemEnt!=noone){
	var tmp=cSlotItemEnt(slot);
	var mov=global.iClient.movItemEnt;
	var movItem=mov[?"item"];
	if(tmp!=noone){
		if(tmp[?"count"]>1 and mov[?"count"]<movItem[?"max"]){
			ds_map_set(mov,"count",mov[?"count"]+1);
			ds_map_set(tmp,"count",tmp[?"count"]-1);
		}
	}
}