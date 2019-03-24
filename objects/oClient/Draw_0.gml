/// @description 绘制游戏,和辅助绘制GUI什么的
// You can write your code in this editor

if(!global.iThePlayer.openGui){
	
#region Draw Build Blue

var _itemEnt=cGetItemEntInHand();
if(_itemEnt!=noone){
	var item=_itemEnt[?"item"];
	
	#region Build
	if(item==global.item[?"bluepaper"]){
		global.iThePlayer.buildStatu=0;
		switch(global.iThePlayer.xuanBuild){
		#region 地基
			case 0:
				if(global.iThePlayer.buildFace==3){ //正面模式
				#region Init
					var _leftUp=collision_point(mouse_x-20,mouse_y-18,oTerrain,true,false);
					var _rightUp=collision_point(mouse_x+20,mouse_y-18,oTerrain,true,false);
					var _leftDown=collision_point(mouse_x-20,mouse_y-8,oTerrain,true,false);
					var _rightDown=collision_point(mouse_x+20,mouse_y-8,oTerrain,true,false);
					var _rectLeft=collision_rectangle(
						mouse_x-24-16,mouse_y-32,
						mouse_x-24,mouse_y+32,
						oBuildBase,true,false);
					var _rectRight=collision_rectangle(
						mouse_x+24+16,mouse_y-32,
						mouse_x+24,mouse_y+32,
						oBuildBase,true,false);
					#endregion
					if(_rectLeft){
						#region _rectLeft
						var _leftUpL=collision_point(_rectLeft.x-20,_rectLeft.y-18,oTerrain,true,false);
						var _rightUpL=collision_point(_rectLeft.x+20,_rectLeft.y-18,oTerrain,true,false);
						var _leftDownL=collision_point(_rectLeft.x-20,_rectLeft.y-8,oTerrain,true,false);
						var _rightDownL=collision_point(_rectLeft.x+20,_rectLeft.y-8,oTerrain,true,false);
						var _hasL=collision_point(_rectLeft.x+40,_rectLeft.y,oBuildBase,false,false);
						if(!_hasL and (!_leftUpL or !_rightUpL) and _leftDownL and _rightDownL){
							draw_sprite_ext(rWoodBase,0,_rectLeft.x+40,_rectLeft.y,1,1,0,c_aqua,0.5);
							global.iThePlayer.canPlace=true;
							global.iThePlayer.placeX=_rectLeft.x+40;
							global.iThePlayer.placeY=_rectLeft.y;
						}else{
							global.iThePlayer.canPlace=false;
							draw_sprite_ext(rWoodBase,0,_rectLeft.x+40,_rectLeft.y,1,1,0,c_red,0.5);
						}
						#endregion
					}else if(_rectRight){
						#region _rectRight
						var _leftUpR=collision_point(_rectRight.x-20,_rectRight.y-18,oTerrain,true,false);
						var _rightUpR=collision_point(_rectRight.x+20,_rectRight.y-18,oTerrain,true,false);
						var _leftDownR=collision_point(_rectRight.x-20,_rectRight.y-8,oTerrain,true,false);
						var _rightDownR=collision_point(_rectRight.x+20,_rectRight.y-8,oTerrain,true,false);
						var _hasR=collision_point(_rectRight.x-40,_rectRight.y,oBuildBase,false,false);
						if(!_hasR and (!_leftUpR or !_rightUpR) and _leftDownR and _rightDownR){
							draw_sprite_ext(rWoodBase,0,_rectRight.x-40,_rectRight.y,1,1,0,c_aqua,0.5);
							global.iThePlayer.canPlace=true;
							global.iThePlayer.placeX=_rectRight.x-40;
							global.iThePlayer.placeY=_rectRight.y;
						}else{
							global.iThePlayer.canPlace=false;
							draw_sprite_ext(rWoodBase,0,_rectRight.x-40,_rectRight.y,1,1,0,c_red,0.5);
						}
						#endregion
					}else{	
						if((!_leftUp or !_rightUp) and _leftDown and _rightDown){
							draw_sprite_ext(rWoodBase,0,mouse_x,mouse_y,1,1,0,c_aqua,0.5);
							global.iThePlayer.canPlace=true;
							global.iThePlayer.placeX=mouse_x;
							global.iThePlayer.placeY=mouse_y;
						}else{
							draw_sprite_ext(rWoodBase,0,mouse_x,mouse_y,1,1,0,c_red,0.5);
							global.iThePlayer.canPlace=false;
						}
					}
				}
					break;
				#endregion
				
		#region 墙壁
		case 1:
			if(global.iThePlayer.buildFace==1){
				#region 后面模式
				var _pointDown=collision_point(mouse_x,mouse_y+40,oBuildBase,false,false);
				var _pointDownS=collision_point(mouse_x,mouse_y+40,oBuildBkgWall,false,false);
				if(_pointDown){
					var _center=collision_point(_pointDown.x,_pointDown.y-36,oBuildBkgWall,false,false);
					if(!_center){
						draw_sprite_ext(rWoodBkgWall,0,_pointDown.x,_pointDown.y-40,1,1,0,c_aqua,0.5);
						global.iThePlayer.canPlace=true;
						global.iThePlayer.placeX=_pointDown.x;
						global.iThePlayer.placeY=_pointDown.y-40;
					}else{
						global.iThePlayer.canPlace=false;
						draw_sprite_ext(rWoodBkgWall,0,_pointDown.x,_pointDown.y-40,1,1,0,c_red,0.5);
					}
				}else if(_pointDownS){
					var _center=collision_point(_pointDownS.x,_pointDownS.y-36,oBuildBkgWall,false,false);
					if(!_center){
						draw_sprite_ext(rWoodBkgWall,0,_pointDownS.x,_pointDownS.y-40,1,1,0,c_aqua,0.5);
						global.iThePlayer.canPlace=true;
						global.iThePlayer.placeX=_pointDownS.x;
						global.iThePlayer.placeY=_pointDownS.y-40;
					}else{
						global.iThePlayer.canPlace=false;
						draw_sprite_ext(rWoodBkgWall,0,_pointDownS.x,_pointDownS.y-40,1,1,0,c_red,0.5);
					}
				}else{
						global.iThePlayer.canPlace=false;
						draw_sprite_ext(rWoodBkgWall,0,mouse_x,mouse_y,1,1,0,c_red,0.5);
				}
				#endregion
				}else if(global.iThePlayer.buildFace==2){
				#region 左边模式
					var _pointDown=collision_point(mouse_x,mouse_y+40,oBuildBase,false,false);
					if(!_pointDown){
						_pointDown=collision_point(mouse_x,mouse_y+40,oBuildHWall,false,false);
					}
					if(!_pointDown){
						_pointDown=collision_rectangle(mouse_x-20,mouse_y-20,mouse_x+20,mouse_y+20,oBuildFloor,false,false);
					}
					if(_pointDown){
						var turnLeft=_pointDown.x>=mouse_x;
						var _y=40;
						if(_pointDown.object_index==oBuildFloor)
							_y=0;
						if(turnLeft){
							#region Left
							var _pointLeft=collision_point(_pointDown.x-19,_pointDown.y-_y,oBuildHWall,false,false);
							if(!_pointLeft){
								draw_sprite_ext(rWoodHWallL,0,_pointDown.x,_pointDown.y-_y,1,1,0,c_aqua,0.5);
								global.iThePlayer.canPlace=true;
								global.iThePlayer.placeX=_pointDown.x;
								global.iThePlayer.placeY=_pointDown.y-_y;
								global.iThePlayer.buildStatu=0;
							}else{
								global.iThePlayer.canPlace=false;
								draw_sprite_ext(rWoodHWallL,0,_pointDown.x,_pointDown.y-_y,1,1,0,c_red,0.5);
							}
							#endregion
						}else{
							#region Right
							var _pointRight=collision_point(_pointDown.x+19,_pointDown.y-_y,oBuildHWall,false,false);
							if(!_pointRight){
								draw_sprite_ext(rWoodHWallR,0,_pointDown.x,_pointDown.y-_y,1,1,0,c_aqua,0.5);
								global.iThePlayer.canPlace=true;
								global.iThePlayer.placeX=_pointDown.x;
								global.iThePlayer.placeY=_pointDown.y-_y;
								global.iThePlayer.buildStatu=1;
							}else{
								global.iThePlayer.canPlace=false;
								draw_sprite_ext(rWoodHWallR,0,_pointDown.x,_pointDown.y-_y,1,1,0,c_red,0.5);
							}
							#endregion
						}
					}else{
						global.iThePlayer.canPlace=false;
						draw_sprite_ext(rWoodHWallL,0,mouse_x+20,mouse_y,1,1,0,c_red,0.5);
					}
					break;
					#endregion
				}else if(global.iThePlayer.buildFace==0){
				#region 前面模式
					var _pointDown=collision_point(mouse_x,mouse_y+40,oBuildBase,false,false);
					var _pointDownS=collision_point(mouse_x,mouse_y+40,oBuildWall,false,false);
					if(!_pointDown){
						_pointDown=collision_point(mouse_x,mouse_y,oBuildBkgWall,false,false);
					}
					if(!_pointDown){
						_pointDown=collision_point(mouse_x,mouse_y+40,oBuildDoorFrame,false,false);
					}
					if(_pointDown){
						var _y=40;
						if(_pointDown.object_index==oBuildBkgWall)
							_y=0;
						var _center=collision_point(_pointDown.x,_pointDown.y-_y,oBuildWall,false,false);
						if(!_center){
							draw_sprite_ext(rWoodWall,0,_pointDown.x,_pointDown.y-_y,1,1,0,c_aqua,0.5);
							global.iThePlayer.canPlace=true;
							global.iThePlayer.placeX=_pointDown.x;
							global.iThePlayer.placeY=_pointDown.y-_y;
						}else{
							global.iThePlayer.canPlace=false;
							draw_sprite_ext(rWoodWall,0,_pointDown.x,_pointDown.y-_y,1,1,0,c_red,0.5);
						}
					}else if(_pointDownS){
						var _center=collision_point(_pointDownS.x,_pointDownS.y-36,oBuildWall,false,false);
						if(!_center){
							draw_sprite_ext(rWoodWall,0,_pointDownS.x,_pointDownS.y-40,1,1,0,c_aqua,0.5);
							global.iThePlayer.canPlace=true;
							global.iThePlayer.placeX=_pointDownS.x;
							global.iThePlayer.placeY=_pointDownS.y-40;
						}else{
							global.iThePlayer.canPlace=false;
							draw_sprite_ext(rWoodWall,0,_pointDownS.x,_pointDownS.y-40,1,1,0,c_red,0.5);
						}
					}else{
							global.iThePlayer.canPlace=false;
							draw_sprite_ext(rWoodWall,0,mouse_x,mouse_y,1,1,0,c_red,0.5);
					}
					#endregion
				}
				break;
				#endregion
				
		#region 地板
			case 2:
				if(global.iThePlayer.buildFace==3){ //正面模式
					var _pointCenter=collision_point(mouse_x,mouse_y+40,oBuildBkgWall,false,false);
					//draw_point_color(mouse_x,mouse_y+40,c_blue);
					if(_pointCenter){
						var _center=collision_point(_pointCenter.x,_pointCenter.y-22,oBuildFloor,false,false);
						if(!_center){
							draw_sprite_ext(rWoodFloor,0,_pointCenter.x,_pointCenter.y-40,1,1,0,c_aqua,0.5);
							//draw_point_color(_pointCenter.x,_pointCenter.y-22,c_red);
							global.iThePlayer.canPlace=true;
							global.iThePlayer.placeX=_pointCenter.x;
							global.iThePlayer.placeY=_pointCenter.y-40;
						}else{
							global.iThePlayer.canPlace=false;
							draw_sprite_ext(rWoodFloor,0,_pointCenter.x,_pointCenter.y-40,1,1,0,c_red,0.5);
						}
					}else{
						global.iThePlayer.canPlace=false;
						draw_sprite_ext(rWoodFloor,0,mouse_x,mouse_y-20,1,1,0,c_red,0.5);
					}
				}
				break;
			#endregion
				
		#region 门框
			case 3:
				if(global.iThePlayer.buildFace==0){
					#region 前面模式
					var _pointDown=collision_point(mouse_x,mouse_y+40,oBuildBase,false,false);
					var _pointDownS=collision_point(mouse_x,mouse_y+40,oBuildDoorFrame,false,false);
					if(!_pointDown){
						_pointDown=collision_point(mouse_x,mouse_y,oBuildBkgWall,false,false);
					}
					if(_pointDown){
						var _y=40;
						if(_pointDown.object_index==oBuildBkgWall)
							_y=0;
						var _center=collision_point(_pointDown.x,_pointDown.y-_y,oBuildDoorFrame,false,false);
						if(!_center){
							draw_sprite_ext(rWoodDoorFrame,0,_pointDown.x,_pointDown.y-_y,1,1,0,c_aqua,0.5);
							global.iThePlayer.canPlace=true;
							global.iThePlayer.placeX=_pointDown.x;
							global.iThePlayer.placeY=_pointDown.y-_y;
						}else{
							global.iThePlayer.canPlace=false;
							draw_sprite_ext(rWoodDoorFrame,0,_pointDown.x,_pointDown.y-_y,1,1,0,c_red,0.5);
						}
					}else if(_pointDownS){
						var _center=collision_point(_pointDownS.x,_pointDownS.y-36,oBuildDoorFrame,false,false);
						if(!_center){
							draw_sprite_ext(rWoodDoorFrame,0,_pointDownS.x,_pointDownS.y-40,1,1,0,c_aqua,0.5);
							global.iThePlayer.canPlace=true;
							global.iThePlayer.placeX=_pointDownS.x;
							global.iThePlayer.placeY=_pointDownS.y-40;
						}else{
							global.iThePlayer.canPlace=false;
							draw_sprite_ext(rWoodDoorFrame,0,_pointDownS.x,_pointDownS.y-40,1,1,0,c_red,0.5);
						}
					}else{
							global.iThePlayer.canPlace=false;
							draw_sprite_ext(rWoodDoorFrame,0,mouse_x,mouse_y,1,1,0,c_red,0.5);
					}
					#endregion
				}
			break;
		#endregion
		
			}
		}
#endregion

	#region thing
	switch(item[?"type"]){
		#region TYPE_SIGN
		case TYPE_SIGN:
			if(!global.iThePlayer.openGui){
				var point0=collision_point(mouse_x,mouse_y,oTerrain,true,false);
				var point1=collision_point(mouse_x,mouse_y-16,oTerrain,true,false);
				if(point0 and !point1){
					draw_sprite_ext(item[?"signSpr"],0,mouse_x,mouse_y,1,1,thingRot,c_aqua,0.5);
					if(mouse_check_button_pressed(mb_left)){
						var inst=instance_create_depth(mouse_x,mouse_y,0,oSign);
						inst.sprite_index=item[?"signSpr"];
						inst.rot=thingRot;
						ds_map_set(_itemEnt,"count",_itemEnt[?"count"]-1);
					}
				}else{
					draw_sprite_ext(item[?"signSpr"],0,mouse_x,mouse_y,1,1,thingRot,c_red,0.5);
				}
			}
			break;
		#endregion
		
		#region TYPE_FURNITURE
		case TYPE_FURNITURE:
			var tmp=16;
			switch(item[?"dir"]){
				case DIR_DOWN:
					var line=collision_line(mouse_x-10,mouse_y,mouse_x-10,mouse_y+38,oBuildFloor,false,false);
					var line2=collision_line(mouse_x+10,mouse_y,mouse_x+10,mouse_y+38,oBuildFloor,false,false);
					if(!line and !line2){
						line=collision_line(mouse_x-10,mouse_y,mouse_x-6,mouse_y+38,oBuildBase,false,false);
						line2=collision_line(mouse_x+10,mouse_y,mouse_x+10,mouse_y+38,oBuildBase,false,false);
						tmp=-21;
					}
					break;
				case DIR_UP:
					var line=collision_line(mouse_x-10,mouse_y,mouse_x-10,mouse_y+38,oBuildFloor,false,false);
					var line2=collision_line(mouse_x+10,mouse_y,mouse_x+10,mouse_y+38,oBuildFloor,false,false);
					tmp=+20;
					break;
			}
			if(line and line2){
				var pointTerr=collision_rectangle(mouse_x-8,line.y+tmp,mouse_x+8,(line.y+tmp)-7,oTerrain,true,false);
				var furniture=collision_rectangle(mouse_x-8,line.y+tmp,mouse_x+8,(line.y+tmp)-8,oFurniture,true,false);
				if(!furniture and !pointTerr){
					draw_sprite_ext(item[?"thiSpr"],0,mouse_x,line.y+tmp,1,1,0,c_aqua,0.5);
					if(mouse_check_button_pressed(mb_left)){
						var inst=instance_create_depth(mouse_x,line.y+tmp,0,item[?"obj"]);
						inst.material=item[?"material"];
						inst.cap=item[?"cap"];
						inst.sprite_index=item[?"thiSpr"];
						ds_map_set(_itemEnt,"count",_itemEnt[?"count"]-1);
					}
				}else{
					draw_sprite_ext(item[?"thiSpr"],0,mouse_x,line.y+tmp,1,1,0,c_red,0.5);
				}
			}else{
				draw_sprite_ext(item[?"thiSpr"],0,mouse_x,mouse_y,1,1,0,c_red,0.5);
			}
			break;
		#endregion
		
	}
	
#endregion
	
}
#endregion

#region Draw Hammer
if(cGetItemInHand()==global.item[?"wood_hammer"]){
	draw_sprite_ext(rIconHammer,-1,mouse_x-12,mouse_y-12,1.2,1.2,0,c_white,1);
}
#endregion

}

#region Draw Player Collision Box
if(global.iThePlayer!=noone)
	with(global.iThePlayer){
		if(global.showDebugInfo){
			draw_set_color(c_red);
			draw_rectangle(x+5,y,x+9,y+16,true);
			draw_set_color(c_yellow);
			draw_rectangle(x+2,y+8,x+12,y+14,true);
			draw_set_color(c_blue);
			draw_rectangle(x+5,y+13,x+9,y+15,true);
			draw_set_color(c_lime);
			draw_line(x+7,y+8,x+7,y+global.WORLD_HIGHT);
			draw_set_color(c_blue);
			draw_rectangle(canHarryRange[0],canHarryRange[1],canHarryRange[2],canHarryRange[3],true);
	}
}
#endregion
