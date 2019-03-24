/// @params x
/// @params y
/// @params string
/// @params w
/// @params h

var _x=argument0;
var _y=argument1;
var _string=argument2;
var _w=argument3;
var _h=argument4;

var lastHalign=draw_get_halign();
var lastValign=draw_get_valign();
draw_set_halign(fa_center);
draw_set_valign(fa_center);
if(cWinMouseRegion(
	_x-(_w/2),
	_y-(_h/2),
	_x+(_w/2),
	_y+(_h/2))){
	draw_set_color(c_lime);
	if(mouse_check_button_pressed(mb_left)){
		return true;
	}
}else{
	draw_set_color(draw_get_color());
}
draw_text_shadow(_x,_y,_string);
draw_set_halign(lastHalign);
draw_set_valign(lastValign);

return false;