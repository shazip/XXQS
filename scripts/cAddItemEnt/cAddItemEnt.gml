/// @params ItemEnt

var itemEnt_=argument0;
var item_=itemEnt_[?"item"];

for(var i=0;i<30;i++){
	var tmp_=cSlotItemEnt(i);
	if(tmp_==noone){
		cSetItemEnt(i,itemEnt_);
		return true;
	}else{
		var tmpItem_=tmp_[?"item"];
		if(tmpItem_==item_){
			if(itemEnt_[?"count"]+tmp_[?"count"]<=item_[?"max"]){
				ds_map_set(tmp_,"count",itemEnt_[?"count"]+tmp_[?"count"]);
				ds_map_destroy(itemEnt_);
				return true;
			}else{
				var c=itemEnt_[?"count"]-(tmpItem_[?"max"]-tmp_[?"count"]);
				ds_map_set(tmp_,"count",tmpItem_[?"max"]);
				ds_map_set(itemEnt_,"count",c);
				continue;
			}
		}else{
			continue;
		}
	}
}

//TODO 背包满了，请求服务器把物品丢在地上
//cNewDropItem(global.iThePlayer.x,global.iThePlayer.y,itemEnt_);

return false;