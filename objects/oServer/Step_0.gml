
if(!genedPlant){
	if(sGetOnlinePlayers()==1){
		#region 绿地
		for(var i=0;i<30;i++){
			zWorldGen_genGrass(i,rBlueGrass,7,8);
			zWorldGen_genTree(i,rBlueTree,7,8);
			#region GEN Flower
			var _j=8;
			if(i>=29){
				_j=2;
			}
			for(var j=0;j<5;j++){
				var _x=irandom_range(i*300,(i*300)+300);
				var len=global.TERRAIN_HIGHT-(global.TERRAIN_HIGHT-300);
				var _y=raycatCZ(_x,global.TERRAIN_HIGHT-300,oTerrain,len);
				if(_y!=noone){
					var coll=collision_rectangle(_x-8,_y-8,_x+8,_y+8,oFlower,false,false);
					if(!coll){
						var inst=instance_create_depth(_x,_y,21,oFlower);
						inst.image_index=irandom(7);
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
			#endregion

		}
		#endregion
		
		#region 荒地
		for(var i=30;i<60;i++){
			zWorldGen_genGrass(i,rDieGrass,7,2);
			zWorldGen_genTree(i,rDieTree,7,2);

		}
		#endregion
		
		#region 热带草原
		for(var i=60;i<90;i++){
			zWorldGen_genGrass(i,rHotGrass,7,5);
			zWorldGen_genTree(i,rHotTree,7,1);
		}
		#endregion
		
		genedPlant=true;
	}
}