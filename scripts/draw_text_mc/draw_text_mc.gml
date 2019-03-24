/// @params x
/// @params y
/// @params string

var tmpColor=draw_get_color();
var tmpAlpha=draw_get_alpha();
draw_set_color(c_black);
draw_set_alpha(1);
var _color_str=cMcTextParse(string(argument2));
draw_set_color(tmpColor);
draw_text_custom(argument0,argument1,_color_str,1);

draw_set_color(tmpColor);
draw_set_alpha(tmpAlpha);