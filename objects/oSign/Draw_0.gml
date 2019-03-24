
draw_sprite_ext(sprite_index,image_index,x,y,1,1,rot,c_white,1);

if(sprite_index==rLamp){
	draw_set_color(c_orange)
	draw_lensflare(x,y-47,200,2,2,1,choose(3,4,5),choose(0.5,0.6,0.7));
}