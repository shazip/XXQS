event_inherited();

if(!ban){
	if(cWinMouseRegion(_ws,_hs,_ws+w*_s,_hs+h*_s)){
		draw_set_color(c_green);
		draw_set_alpha(0.7);
		draw_rectangle(_ws,_hs,_ws+w*_s,_hs+h*_s,false);
		draw_set_color(c_lime);
		draw_rectangle(_ws,_hs,_ws+w*_s,_hs+h*_s,true);
	}else{
		if(!xuan){
			draw_set_color(c_dkgray);
		}else{
			draw_set_color(c_teal);
		}
		draw_set_alpha(0.7);
		draw_rectangle(_ws,_hs,_ws+w*_s,_hs+h*_s,false);
		if(!xuan){
			draw_set_color(c_black);
		}else{
			draw_set_color(c_aqua);
		}
		draw_rectangle(_ws,_hs,_ws+w*_s,_hs+h*_s,true);
	}
}else{
	draw_set_color(c_black);
	draw_set_alpha(0.7);
	draw_rectangle(_ws,_hs,_ws+w*_s,_hs+h*_s,false);
	draw_set_color(c_black);
	draw_rectangle(_ws,_hs,_ws+w*_s,_hs+h*_s,true);
}

if(ban){
	draw_set_color(c_gray);
}else{
	draw_set_color(c_white);
}
draw_set_font(global.SHFONT26);
draw_set_halign(fa_center);
draw_set_valign(fa_center);
draw_set_alpha(1);
draw_text_shadow(_ws+(w*_s/2),_hs+(h*_s/2),text);
