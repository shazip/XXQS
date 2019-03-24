if(global.iThePlayer.electricing or global.showDebugInfo){
	var _x=(x-getXView())*4;
	var _y=(y-getYView())*4;
	var xuan=global.iManager.xuanElectricPoint;
	var index=0;
	if(ok){
		index=4;
	}else if(xuan==noone){
		index=0;
	}else if(cWinMouseRegion(_x-4,_y-4,_x+4,_y+4)){
		index=1;
	}else if(xuan.in==!in){
		index=2;
	}else{
		index=3;
	}
	draw_sprite_ext(rElectricPoint,index,_x,_y,4,4,0,c_white,1);
	if(cWinMouseRegion(_x-4,_y-4,_x+6,_y+6)){
		var tmp="[输出点]";
		if(in) tmp="[输入点]";
		var str="§a"+owner.display+"\n"+tmp+"\n需要"+string(owner.need)+"W"
		+"\n当前"+string(energy)+"W";

		draw_set_halign(fa_center);
		draw_set_valign(fa_bottom);
		draw_set_font(global.SHFONT14);
		draw_text_shadow(window_mouse_get_x(),window_mouse_get_y()-12,str);
	}
	
}