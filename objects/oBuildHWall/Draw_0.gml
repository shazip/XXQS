
draw_self();
draw_set_alpha(1);

if(isLeft){ //Left
	if(dwRight){
		draw_sprite(rBuildHShadow,0,x+3,y);
	}
	if(dwLeft and !dwOT){
		draw_sprite(rBuildHShadow,1,x-40,y);
	}
	
}else{ //Right
	if(dwRight and !dwOT){
		draw_sprite(rBuildHShadow,0,x+40,y);
	}
	if(dwLeft){
		draw_sprite(rBuildHShadow,1,x-3,y);
	}
}

if(needFace!=-1)
if(global.iThePlayer.buildFace!=needFace)
	exit;
	
if(blue){
	draw_sprite_ext(sprite_index,0,x,y,1,1,0,c_aqua,0.5);
}