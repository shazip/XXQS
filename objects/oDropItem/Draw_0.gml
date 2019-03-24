if(itemEnt!=noone){
	var item=itemEnt[?"item"];
	if(itemEnt[?"count"]>1){
		draw_sprite_ext(item[?"spr"],-1,x+1,y+1,0.8,0.8,0,c_white,1);
	}
	if(itemEnt[?"count"]>2){
		draw_sprite_ext(item[?"spr"],-1,x-1,y-1,0.8,0.8,0,c_white,1);
	}
	draw_sprite_ext(item[?"spr"],-1,x,y,0.8,0.8,0,c_white,1);
}else{
	draw_self();
}
