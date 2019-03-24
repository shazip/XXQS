/// @params i
/// @params spr
/// @params spr_len
/// @params j

for(var j=0;j<argument3;j++){
	var _x=irandom_range(argument0*300,(argument0*300)+300);
	var len=global.TERRAIN_HIGHT-(global.TERRAIN_HIGHT-400);
	var _y=raycatCZ(_x,global.TERRAIN_HIGHT-400,oTerrain,len);
	if(_y!=noone){
		var coll=collision_rectangle(_x-8,_y-8,_x+8,_y+8,oGrass,false,false);
		if(!coll){
			var inst=instance_create_depth(_x,_y,21,oGrass);
			inst.sprite_index=argument1;
			inst.image_index=irandom(argument2);
			if(irandom(4)<2){
				inst.bef=false;
				inst.depth=70;
			}else{
				inst.bef=true;
				inst.depth=1;
			}
		}
	}
}
			