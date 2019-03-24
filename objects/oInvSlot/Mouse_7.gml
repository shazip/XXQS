if(global.iClient.movItemEnt!=noone){
	if(global.iManager.slot!=rid)
	if(itemEnt==noone){
		cSetItemEnt(rid,global.iClient.movItemEnt);
		global.iClient.movItemEnt=noone;
	}else if(itemEnt[?"item"]!=global.iClient.movItemEnt[?"item"]
	and cSlotItemEnt(global.iManager.slot)==noone){
		var tmp=cSlotItemEnt(rid);
		cSetItemEnt(rid,global.iClient.movItemEnt);
		global.iClient.movItemEnt=noone;
		cSetItemEnt(global.iManager.slot,tmp);
	}else{
		var mov=global.iClient.movItemEnt;
		if((itemEnt[?"count"]+mov[?"count"])<=item[?"max"]
		and cSlotItemEnt(global.iManager.slot)==noone){
			ds_map_set(mov,"count",itemEnt[?"count"]+mov[?"count"]);
			cSetItemEnt(rid,mov);
			global.iClient.movItemEnt=noone;
		}
	}
}
