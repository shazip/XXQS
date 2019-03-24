if(other.itemEnt!=noone){
	if(hideMode){
		var tmp=other.itemEnt[?"item"];
		cAddCinfo2(c_lime,"+"+string(other.itemEnt[?"count"])+"个"+tmp[?"name"]);
		cAddItemEnt(other.itemEnt);
		instance_destroy(other);
	}
}