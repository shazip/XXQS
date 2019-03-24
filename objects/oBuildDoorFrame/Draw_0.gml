
if(global.iThePlayer!=noone)
if(cGetItemInHand()==global.item[?"bluepaper"]
	or cGetItemInHand()==global.item[?"wood_hammer"]){
	if(global.iThePlayer.buildFace==0){
		draw_sprite_ext(sprite_index,0,x,y,1,1,0,c_yellow,0.3);
	}
}else if(!global.iThePlayer.buildMode){
	draw_sprite(sprite_index,image_index,x,y);
	if(coupletIndex!=-1){
		draw_sprite(rCouplet,coupletIndex,x,y);
	}
}

if(blue and global.iThePlayer.buildFace==needFace){
	draw_sprite_ext(sprite_index,0,x,y,1,1,0,c_aqua,0.5);
}
