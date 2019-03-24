
var _w = window_get_width();
var _h = window_get_height();
var _x = window_get_x();
var _y = window_get_y();

if (_w != window_w) or (_h != window_h) or first{
	camera_set_view_size(view_camera[0],_w,_h);
    view_wport[0] = _w;
    view_hport[0] = _h;
	camera_set_view_pos(view_camera[0],_x - window_x,_y - window_y);
	camera_set_view_border(view_camera[0],_w/2,_h/2);
    surface_resize(application_surface,_w,_h);
    display_reset(0,0);
    window_w = _w;
    window_h = _h;
	if(first){
		first=false;
	}
}
window_x = _x;
window_y = _y;
