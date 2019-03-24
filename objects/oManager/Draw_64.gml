
#region Draw MovingItem
if(global.iClient.movItemEnt!=noone){

	var item=global.iClient.movItemEnt[?"item"];
	
		
	draw_sprite_ext(item[?"spr"],-1,
		window_mouse_get_x()-(8*4),
		window_mouse_get_y()-(8*4),4,4,0,c_white,1);
	
	var c=global.iClient.movItemEnt[?"count"];
	if(c!=1){
		draw_set_alpha(1);
		draw_set_halign(fa_right);
		draw_set_valign(fa_bottom);
		draw_set_font(global.SHFONT20);
		draw_set_color(c_white);
		draw_text_shadow(window_mouse_get_x()+(10*4),window_mouse_get_y()+(10*4),string(c));
	}
}
#endregion

#region 画格子的文字悬浮

if(itemEnt!=noone){
	var item=itemEnt[?"item"];
	draw_set_font(global.SHFONT20);
	draw_set_alpha(0.7)
	draw_set_color(c_black);
	draw_rectangle(
		window_mouse_get_x(),
		window_mouse_get_y()+4,
		window_mouse_get_x()+string_width(item[?"name"])+8,
		window_mouse_get_y()-string_height(item[?"name"]),
		false);
	draw_set_alpha(1)
	draw_set_color(c_purple);
	draw_rectangle(
		window_mouse_get_x(),
		window_mouse_get_y()+4,
		window_mouse_get_x()+string_width(item[?"name"])+8,
		window_mouse_get_y()-string_height(item[?"name"]),
		true);
		
	draw_set_halign(fa_left);
	draw_set_valign(fa_center);
	draw_set_color(c_white);
	draw_set_alpha(1);
	draw_text_shadow(window_mouse_get_x()+4,window_mouse_get_y()-10,item[?"name"]);
}
itemEnt=noone;
#endregion

