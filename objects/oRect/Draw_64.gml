
var w=x-getXView();
var h=y-getYView();
var s=1;
if(useDp){
	s=4;
}
draw_set_color(color);
draw_set_alpha(alpha);
draw_rectangle(w*s,h*s,(w+(16*image_xscale))*s,(h+(16*image_yscale))*s,false);
if(outline){
	draw_set_alpha(1);
	draw_rectangle((w*s)-1,(h*s)-1,(w+(16*image_xscale))*s,(h+(16*image_yscale))*s,true);
}