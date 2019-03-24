/// @params slotNum
var _itemEnt=ds_list_find_value(global.iThePlayer.inventory,argument0);

if(_itemEnt==undefined or _itemEnt==noone){
	return noone;
}

var _item=ds_map_find_value(_itemEnt,"item");
if(_item==undefined or _item==noone){
	return noone;
}
return _item;