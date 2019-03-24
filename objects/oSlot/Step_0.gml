if(global.iThePlayer.xuanSlot==rid){
	image_index=1;
}else{
	image_index=0;
}


itemEnt=cSlotItemEnt(rid);
if(itemEnt!=noone){
	item=itemEnt[?"item"];
}