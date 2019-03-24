if(itemEnt!=noone and global.iClient.movItemEnt==noone){
	global.iClient.movItemEnt=itemEnt;
	cSetItemEnt(rid,noone);
	global.iManager.slot=rid;
}