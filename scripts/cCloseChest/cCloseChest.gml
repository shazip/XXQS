
var inst=global.iThePlayer.invInst
var list=inst.invList;
var cap=inst.cap;

for(var i=0;i<cap*6;i++){
	list[|i]=cSlotItemEnt(36+i);
}

for(var i=0;i<cap*6;i++){
	cSetItemEnt(36+i,noone);
}

inst.isOpen=false;
global.iThePlayer.openOtherInv=false;
global.iThePlayer.invInst=noone;

