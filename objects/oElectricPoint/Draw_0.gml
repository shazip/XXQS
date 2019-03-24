
for(var i=0;i<ds_list_size(xlist);i++){
	if(i==ds_list_size(xlist)-1){
		if(global.iManager.xuanElectricPoint==self){
			draw_set_color(c_aqua);
			draw_set_alpha(1);
			draw_line_width(xlist[|i],ylist[|i],mouse_x,mouse_y,0.7);
		}
	}else{
		draw_set_color(c_black);
		draw_set_alpha(1);
		draw_line_width(xlist[|i],ylist[|i],xlist[|i+1],ylist[|i+1],0.7);
	}
}