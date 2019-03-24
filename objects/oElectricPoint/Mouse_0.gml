if(global.iThePlayer.electricing){
	var item=cGetItemInHand();
	if(item==global.item[?"wrench"]){
		var xuan=global.iManager.xuanElectricPoint;
		if(ds_list_size(xlist)<=1)
		if(xuan==noone and !ok){
			ds_list_clear(xlist);
			ds_list_clear(ylist);
			ds_list_add(xlist,x);
			ds_list_add(ylist,y);
			global.iManager.xuanElectricPoint=self;
		}if(xuan!=self and xuan!=noone){
			var inst=xuan;
			if(in==!inst.in){
				ds_list_add(inst.xlist,x);
				ds_list_add(inst.ylist,y);
				otpoint=inst;
				inst.tpoint=self;
				inst.ok=true;
				ok=true;
				global.iManager.xuanElectricPoint=noone;
			}
		}
	}
			
	if(item==global.item[?"shears"]){
		ds_list_clear(xlist);
		ds_list_clear(ylist);
		if(tpoint!=noone){
			tpoint.otpoint=noone;
			tpoint.ok=false;
			ok=false;
			tpoint=noone;
		}
		if(otpoint!=noone){
			otpoint.tpoint=noone;
			otpoint.ok=false;
			ok=false;
			ds_list_clear(otpoint.xlist);
			ds_list_clear(otpoint.ylist);
			otpoint=noone;
		}
	}
}