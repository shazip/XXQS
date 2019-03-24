
#region 加载子控件
if(layout!=noone and !ok){

	w=image_xscale*16;
	h=image_yscale*16;

	tmpList=ds_list_create();
	sonNum=collision_rectangle_list(x,y,x+w,y+h,oiGui,false,false,tmpList,false);
	dataList=ds_list_create();
	var tmp=0;
	for(var i=0;i<sonNum;i++){
		var map=ds_map_create();
		var inst=tmpList[|i];
		if(inst.layer==layer_get_id(targetLayer) or targetLayer==noone){
			inst.layout=layout;
			if(inst.object_index==oRect){
				inst.depth++;
			}
			ds_map_add(map,"inst",inst);
			ds_map_add(map,"w",inst.x-x);
			ds_map_add(map,"h",inst.y-y);
			ds_list_add(dataList,map);
		}else{
			tmp++;
		}
	}
	sonNum-=tmp;
	ds_list_destroy(tmpList);
	ok=true;
}
#endregion

#region 存活控制
if(!canSee and !__canSeeSW){
	for(var i=0;i<sonNum;i++){
		var map=dataList[|i];
		var inst=map[?"inst"];
		if(inst.object_index==oInvSlot){
			inst.itemEnt=noone;
			inst.item=noone;
		}
		instance_deactivate_object(inst);
	}
	__canSeeSW=true;
	cLog("oGuiLayout.Step","布局["+string(layout)+"]已置为不可视");
}else if(canSee and __canSeeSW){
	for(var i=0;i<sonNum;i++){
		var map=dataList[|i];
		var inst=map[?"inst"];
		instance_activate_object(inst);
	}
	__canSeeSW=false;
	cLog("oGuiLayout.Step","布局["+string(layout)+"]已置为可视");
}
#endregion
