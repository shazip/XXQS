/// @params Chest

argument0.isOpen=true;
global.iThePlayer.openOtherInv=true;

for(var i=0;i<argument0.cap*6;i++){
	cSetItemEnt(i+36,argument0.invList[|i]);
}

global.iThePlayer.openInv=true;
global.iThePlayer.invInst=argument0;