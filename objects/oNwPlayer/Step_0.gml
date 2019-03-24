/// @description 其他玩家每步
// You can write your code in this editor

if((mouse_x>x and mouse_y>y) and (mouse_x<x+16 and mouse_y<y+16)){
	mouseIn=true;
}else{
	mouseIn=false;
}


#region Testing Collision

var clDown=collision_rectangle(x+5,y,x+9,y+16,oTerrain,true,false);
var clCenter=collision_rectangle(x+2,y+8,x+12,y+11,oTerrain,true,false);
var clDown2=collision_rectangle(x+5,y+13,x+9,y+15,oTerrain,true,false);

#region Down
if(clDown){
	gravity=0;
	speed=0;
	gravity=0;
	//move_contact_solid(direction,3);
	if(clDown2 and !clCenter){
		y-=0.5;
	}
}
#endregion

#region Center
if(clCenter){
	gravity=0;
	speed=0;
	gravity=0;
	//move_contact_solid(direction,3);
	if(clDown){
		image_speed=6;
		y-=3;
	}
}else{
	image_speed=5;
}

#endregion

#endregion

if(running){
	image_speed=5.5;
}else{
	image_speed=5;
}