/// @params x
/// @params y
/// @params x1
/// @params y1
/// @params x2
/// @params y2

var x_=argument0;
var y_=argument1;
var x1_=argument2;
var y1_=argument3;
var x2_=argument4;
var y2_=argument5;

if((x_>x1_ and y_>y1_) and (x_<=x2_ and y_<=y2_)){
	return true;
}
return false;