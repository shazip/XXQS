/// @params x
/// @params y
/// @params in
/// @params owner

var inst=instance_create_depth(argument0,argument1,0,oElectricPoint);
inst.in=argument2;
inst.owner=argument3;
return inst;