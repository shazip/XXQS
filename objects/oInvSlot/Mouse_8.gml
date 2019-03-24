
if(itemEnt==noone){
	if(global.iClient.movItemEnt!=noone){
		cSetItemEnt(rid,global.iClient.movItemEnt);
		global.iClient.movItemEnt=noone;
	}
	
}else{
	var mov=global.iClient.movItemEnt;
	if(mov!=noone){
		if(global.iManager.slot!=rid)
		if(mov[?"item"]==itemEnt[?"item"])
		if((itemEnt[?"count"]+mov[?"count"])<=item[?"max"]){
			ds_map_set(itemEnt,"count",itemEnt[?"count"]+mov[?"count"]);
			global.iClient.movItemEnt=noone;
		}
	}
}
