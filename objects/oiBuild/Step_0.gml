blue=false;

if(needFace!=-1)
if(global.iThePlayer.buildFace!=needFace)
	exit;

if(cGetItemInHand()==global.item[?"wood_hammer"]){
	if(global.iThePlayer.upBuild==noone)
	if(!global.iThePlayer.openGui)
	if(cMouseRegion(x-width,y-height,x+width,y+height)){
		blue=true;
		if(mouse_check_button_pressed(mb_left)){
			global.iThePlayer.upBuild=self;
			global.iThePlayer.openInv=true;
		}
	}
}

if(global.iThePlayer.upBuild==self){
	blue=true;
}