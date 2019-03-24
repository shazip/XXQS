/// @params x
/// @params y
/// @params list
/// @params w
/// @params h
/// @params gap

var _x=argument0;
var _y=argument1;
var _list=argument2;
var _w=argument3;
var _h=argument4;
var _gap=argument5;

var lastColor=draw_get_color();
for(var i=0;i<ds_list_size(_list);i++){
	if(draw_event_text(_x,_y+(i*_gap),string(_list[|i]),_w,_h)){
		draw_set_color(lastColor);
		return i;
	}
	draw_set_color(lastColor);
}

return -1;