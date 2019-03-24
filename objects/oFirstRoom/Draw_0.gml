/// @description 绘制GUI
// You can write your code in this editor

draw_set_alpha(1);
draw_set_color($fff2cc);
draw_rectangle(getXView(),getYView(),getXView()+window_get_width(),getYView()+window_get_height(),false);

draw_set_alpha(1);
for(var i=0;i<5;i++){
	draw_sprite_ext(rGuiTerrain,3,getXView()+((300*3)*i)-300-(mouse_x/40),(getYView()+window_get_height())-(215*3),3,3,0,c_white,1);
	draw_sprite_ext(rGuiTerrain,0,getXView()+((300*3)*i)-300-(mouse_x/30),(getYView()+window_get_height())-(215*3),3,3,0,c_white,1);
	draw_sprite_ext(rGuiTerrain,1,getXView()+((300*3)*i)-300-(mouse_x/20),(getYView()+window_get_height())-(215*3),3,3,0,c_white,1);
}


draw_sprite_ext(rGuiTerrain,2,(getXView()+window_get_width())-300*3,getYView()+window_get_height()-215*3,3,3,0,c_white,1);
