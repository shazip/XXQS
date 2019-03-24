if((window_mouse_get_x()>argument0
	and window_mouse_get_y()>argument1) 
	and (window_mouse_get_x()<=argument2
	and window_mouse_get_y()<=argument3)){
		return true;
}
return false;