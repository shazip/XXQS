if(global.iClient.movItemEnt!=noone){
	var tmp=cSlotItemEnt(slot);
	if(tmp==noone){
		cSetItemEnt(slot,global.iClient.movItemEnt);
		global.iClient.movItemEnt=noone;
	}
}