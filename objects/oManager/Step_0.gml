
for(var i=0;i<ds_list_size(global.iThePlayer.inventory);i++){
	var _itemEnt=cSlotItemEnt(i);
	if(_itemEnt!=noone){
		if(_itemEnt[?"count"]<=0){
			cDestroyItemEnt(i);
		}
	}
}
if(global.iClient.movItemEnt!=noone)
if(global.iClient.movItemEnt[?"count"]<=0){
	ds_map_destroy(global.iClient.movItemEnt);
	global.iClient.movItemEnt=noone;
}

if(xuanElectricPoint!=noone){
	if(mouse_check_button_pressed(mb_left)){
		ds_list_add(xuanElectricPoint.xlist,mouse_x);
		ds_list_add(xuanElectricPoint.ylist,mouse_y);
	}
}

if(!global.iThePlayer.electricing
or cGetItemInHand()!=global.item[?"wrench"]){
	if(xuanElectricPoint!=noone){
		if(!xuanElectricPoint.ok){
			ds_list_clear(xuanElectricPoint.xlist);
			ds_list_clear(xuanElectricPoint.ylist);
		}
	}
	xuanElectricPoint=noone;
}