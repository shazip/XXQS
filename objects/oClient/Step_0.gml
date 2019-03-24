/// @description 客户端每步
// You can write your code in this editor
#region Update Window
window_set_caption(winTitle+"   FPS:"+string(fps));
var _w = window_get_width();
var _h = window_get_height();
var _x = window_get_x();
var _y = window_get_y();
if (_w != window_w) or (_h != window_h) or first {
	camera_set_view_size(view_camera[0],_w/4,_h/4);
    view_wport[0] = _w;
    view_hport[0] = _h;
	camera_set_view_pos(view_camera[0],_x - window_x,_y - window_y);
	camera_set_view_border(view_camera[0],_w/2,_h/2);
    surface_resize(application_surface,_w,_h);
    display_reset(0,0);
    window_w = _w;
    window_h = _h;
	first=false;
}
window_x = _x;
window_y = _y;

global.WIN_WIDTH=_w;
global.WIN_HEIGHT=_h;
#endregion

if(keyboard_check_pressed(vk_f2)){
	global.showDebugInfo=!global.showDebugInfo;
}

if(keyboard_check_pressed(vk_escape)){
	if(global.iThePlayer.openInv){
		global.iThePlayer.openInv=false;
		cCloseInv();
	}else if(global.iThePlayer.openBuildMenu){
		global.iThePlayer.openBuildMenu=false;
	}else if(global.iThePlayer.upBuild!=noone){
		global.iThePlayer.upBuild=noone;
	}else{
		showEscMenu=!showEscMenu;
	}
}


xuanNwPlayer=collision_rectangle(mouse_x-4,mouse_y-4,mouse_x+4,mouse_y+4,oNwPlayer,false,false);
if(!xuanNwPlayer){
	xuanNwPlayer=noone;
}
if(mouse_check_button_pressed(mb_left))
if(cGetItemInHand()==global.item[?"bluepaper"]){
	lastMouseX=window_mouse_get_x();
	lastMouseY=window_mouse_get_y();
	//TODO
}

if(mouse_check_button(mb_right)){
	if(cGetItemInHand()==global.item[?"bluepaper"]){
		
		global.iThePlayer.openBuildMenu=true;
	}else{
		global.iThePlayer.openBuildMenu=false;
	}
}else{
	global.iThePlayer.openBuildMenu=false;
}
global.iThePlayer.xuanBuild=buildXuan;