
if(global.iThePlayer.harryTarget==self and cCanHarry(x,y)){
	draw_set_alpha(0.5);
	draw_set_color(c_white);
	draw_circle(x,y,blueSize,false);
	draw_set_alpha(1);
	draw_set_color(c_black);
	draw_circle(x,y,blueSize,true);
}