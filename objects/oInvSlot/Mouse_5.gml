if(itemEnt!=noone and global.iClient.movItemEnt==noone){
	if(itemEnt[?"count"]>1 ){
		var tmp=ds_map_create();
		ds_map_copy(tmp,itemEnt);
		ds_map_set(tmp,"count",floor(itemEnt[?"count"]/2));
		ds_map_set(itemEnt,"count",ceil(itemEnt[?"count"]/2));
		global.iClient.movItemEnt=tmp;
		global.iManager.slot=rid;
	}
}