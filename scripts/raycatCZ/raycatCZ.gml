/// @params x
/// @params y
/// @params obj
/// @params len

var _x=argument0;
var _y=argument1;
var _obj=argument2;
var len=argument3;


for(var i=0;i<len;i++){
	var inst=collision_point(_x,_y+i,_obj,true,false);
	if(inst){
		return _y+i; 
	}
}
return noone;