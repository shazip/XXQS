
event_inherited();

var _down=collision_point(x,y+24,oBuildBase,false,false);
if(_down){
	draw_set_alpha(1);
	draw_sprite(rBuildWShadow,1,x,y);
}
