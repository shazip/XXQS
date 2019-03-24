var ps=part_system_create();
var pty=part_type_create();
part_type_direction(pty,80,100,0,0);
part_type_speed(pty,0.05,0.1,0,0);
part_type_color2(pty,c_gray,c_ltgray);
part_type_life(pty,10,50);
part_type_shape(pty,pt_shape_smoke);
part_type_size(pty,0.1,1,0,0);
var pe=part_emitter_create(ps);
part_emitter_stream(ps,pe,pty,1);
part_emitter_region(ps,pe,x+10,x-10,y,y-80,ps_shape_line,ps_distr_linear);
cNewPartTimer(ps,pe,5);	

cNewDropItem(x,y-20,cBuildItemEnt(itemEnt,irandom_range(10,15)));