if(global.iThePlayer.buildMode==needFace){
	var itemEnt=cGetItemEntInHand();
	if(itemEnt!=noone){
		var item=itemEnt[?"item"];
		if(item[?"type"]==TYPE_COUPLET){
			if(coupletIndex==-1){
				coupletIndex=item[?"index"];
				ds_map_set(item,"count",1);
			}
		}
	}
}