event_inherited();

draw_sprite_ext(sprite_index,image_index,_ws,_hs,_s,_s,0,c_white,1);
if(itemEnt!=noone and rid!=noone and item!=undefined){
	draw_sprite_ext(item[?"spr"],-1,_ws,_hs,_s,_s,0,c_white,1);
}

if(itemEnt!=noone){
	if(itemEnt[?"count"]!=1){
		draw_set_color(c_white);
		draw_set_alpha(1);
		draw_set_halign(fa_right);
		draw_set_valign(fa_bottom);
		draw_text_shadow((_w+16)*_s,(_h+18)*_s,string(itemEnt[?"count"]));
	}
}