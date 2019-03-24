var _tmp_itemEnt=cGetItemEntInHand();
if(_tmp_itemEnt!=noone){
	if(_tmp_itemEnt[?"item"]!=undefined){
		return _tmp_itemEnt[?"item"];
	}else{
		return noone;
	}
}
return noone