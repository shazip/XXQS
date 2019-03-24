event_inherited();

draw_set_font(global.SHFONT20);
if(cWinMouseRegion(_ws,_hs,_ws+(sprite_width*_s),_hs+(sprite_height*_s))){
	draw_sprite_ext(rGuiInvSlot,2,_ws,_hs,_s,_s,0,c_white,1);
	global.iManager.itemEnt=itemEnt;
}else{
	draw_sprite_ext(rGuiInvSlot,1,_ws,_hs,_s,_s,0,c_white,1);
}

if(itemEnt!=noone and itemEnt!=undefined){
	draw_sprite_ext(item[?"spr"],1,_ws+_s,_hs+_s,_s,_s,0,c_white,1);
	
	if(itemEnt[?"count"]!=1){
		draw_set_color(c_white);
		draw_set_alpha(0.8);
		draw_set_halign(fa_right);
		draw_set_valign(fa_bottom);
		draw_text_shadow((_w+18)*_s,(_h+19)*_s,string(itemEnt[?"count"]),);
	}
}
