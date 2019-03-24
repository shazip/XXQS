/// @description drawing fire with transparency variations 


draw_set_color(color)
draw_sprite_ext(spr_fire,choose(0,1,2,3,4,5),x,y,choose(-1,1),1,choose(.6,.9,1,1.1,1.4),color,1)
draw_lensflare(x,y,250,2,2,1,choose(3,4,5),choose(0.5,0.6,0.7))
draw_set_font(FontS)
draw_set_halign(fa_center)
draw_text(x,y-50,string_hash_to_newline(string(color)))

draw_text(320,200,string_hash_to_newline("Color Sencible"))


x = mouse_x

