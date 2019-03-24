/// @params player
/// @params pmnStr

var pmnList=argument0[?"pmnList"];
for(var i=0;i<ds_list_size(pmnList);i++){
	var permission=ds_list_find_value(pmnList,i);
	if(permission==argument1){
		return true;
	}
}
return false;