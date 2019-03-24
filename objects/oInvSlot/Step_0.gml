
if(rid!=noone){
	itemEnt=cSlotItemEnt(rid);
	if(itemEnt!=global.iClient.movItemEnt){
		if(itemEnt!=noone){
			item=itemEnt[?"item"];
		}
	}else{
		itemEnt=noone;
		item=noone;
	}
}