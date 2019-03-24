event_inherited();

draw_set_font(font);
draw_set_color(color);
draw_set_alpha(1);
draw_set_halign(halign);
draw_set_valign(valign);
var tmp=text;
if(text==noone){
	tmp="NOONE";
}
draw_text_shadow(_ws,_hs,string(tmp));
