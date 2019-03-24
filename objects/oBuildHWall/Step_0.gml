
#region Blue

blue=false;

if(needFace!=-1)
if(global.iThePlayer.buildFace==needFace)
if(cGetItemInHand()==global.item[?"wood_hammer"]){
	if(global.iThePlayer.upBuild==noone)
	if(!global.iThePlayer.openGui)
	if(isLeft){
		if(cMouseRegion(x-width,y-height,x,y+height)){
			blue=true;
			if(mouse_check_button_pressed(mb_left)){
				global.iThePlayer.upBuild=self;
				global.iThePlayer.openInv=true;
			}
		}
	}else{
		if(cMouseRegion(x,y-height,x+width,y+height)){
			blue=true;
			if(mouse_check_button_pressed(mb_left)){
				global.iThePlayer.upBuild=self;
				global.iThePlayer.openInv=true;
			}
		}
	}
}

if(global.iThePlayer.upBuild==self){
	blue=true;
}

#endregion

#region Testfor Level
switch(level){
	case 0:
		image_index=1;
		break;
	case 1:
		image_index=2;
		break;
}
#endregion

if(isLeft){
	if(level==-1){
		sprite_index=rWoodHWallL;
	}else{
		sprite_index=rLevelHWallL;
	}
	dwRight=collision_point(x,y,oBuildBkgWall,false,false);
	dwLeft=collision_point(x-40,y,oBuildBkgWall,false,false);
	dwOT=collision_point(x-22,y,oBuildHWall,false,false);
	hasFloor=collision_point(x,y,oBuildFloor,false,false);
}else{
	if(level==-1){
		sprite_index=rWoodHWallR;
	}else{
		sprite_index=rLevelHWallR;
	}
	dwRight=collision_point(x+40,y,oBuildBkgWall,false,false);
	dwLeft=collision_point(x,y,oBuildBkgWall,false,false);
	dwOT=collision_point(x+22,y,oBuildHWall,false,false);
	hasFloor=collision_point(x+40,y,oBuildFloor,false,false);
}
