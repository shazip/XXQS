event_inherited();

if(spr!=noone and ok==2){
	
	if(cent){
		draw_sprite_ext(spr,-1,_ws-(sprW/2),_hs-(sprH/2),image_xscale*_s,image_yscale*_s,0,c_white,1);
	}else{
		draw_sprite_ext(spr,-1,_ws,_hs,image_xscale*4,image_yscale*_s,0,c_white,1);
	}
}