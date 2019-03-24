/// @params name
for(var i=0;i<ds_list_size(global.nwplayerList);i++){
	var _nwp=ds_list_find_value(global.nwplayerList,i);
	if(_nwp.name==argument0){
		return _nwp;
	}	
}
return noone;