/// @description 按键检测什么的
// You can write your code in this editor


gravity=0.08;

if(buildMode){
	depth=50;
	bef=true;
}else if(hideMode){
	depth=71;
}else{
	depth=10;
}

#region Testing Is Open openGui
openGui=false;
if(openInv or openBuildMenu or global.iClient.showEscMenu or upBuild!=noone){
	openGui=true;
}
#endregion

#region Testing Collision
var clDown=collision_rectangle(x+5,y,x+9,y+16,oTerrain,true,false);
var clCenter=collision_rectangle(x+2,y+8,x+12,y+11,oTerrain,true,false);
var clDown2=collision_rectangle(x+5,y+13,x+9,y+15,oTerrain,true,false);
#region Down
if(clDown){
	collDown=true;
	speed=0;
	gravity=0;
	//move_contact_solid(direction,3);
	if(clDown2 and !clCenter){
		y-=0.5;
	}
}else{
	collDown=false;
}
#endregion
#region Down2
if(clDown2){
	collDown2=true;
}else{
	collDown2=false;
}
#endregion
#region Center
if(clCenter){
	collCenter=true;
	speed=0;
	gravity=0;
	//move_contact_solid(direction,3);
	if(clDown){
		image_speed=6;
		y-=3;
	}
}else{
	image_speed=5;
	collCenter=false;
}

#endregion
if(collDown){
	jumping=false;
}
#endregion

#region Testing Collision Build

var clDown=collision_rectangle(x+5,y,x+9,y+16,oBuildBase,true,false);
var clCenter=collision_rectangle(x+2,y+8,x+12,y+11,oBuildBase,true,false);
var clDown2=collision_rectangle(x+5,y+13,x+9,y+15,oBuildBase,true,false);


#region Down
if(clDown){
	if(!claimBase){
		speed=0;
		gravity=0;
		//move_contact_solid(direction,3);
		if(clDown2 and !clCenter){
			y-=1;
		}
	}
}
#endregion

#region Center
claimBase=false;
if(clCenter){
	//speed=0;
	//gravity=0;
	//move_contact_solid(direction,3);
	if(clDown){
		claimBase=true;
		if(turnLeft){
			x+=nspd;
		}else{
			x-=nspd;
		}
	}
}
if(clDown or clDown2 or clCenter){
	onBuildBase=true;
	jumping=false;
}else{
	onBuildBase=false;
}
#endregion
	
#endregion

#region Testing MouseIn
if((mouse_x>x and mouse_y>y) and (mouse_x<x+16 and mouse_y<y+16)){
	mouseIn=true;
}else{
	mouseIn=false;
}
#endregion

#region Testing Moving Key
moving=false;
if(keyboard_check_pressed(ord("S"))){
	var list=ds_list_create();
	var num=collision_point_list(x+7,y+7,oiBuild,true,false,list,false);
	var fg=false;
	var bg=false;
	if(num>0){
		for(var i=0;i<num;i++){
			var inst=list[|i];
			if(inst.needFace==0){
				fg=true;
			}else if(inst.needFace==1){
				bg=true;
			}
		}
	}
	if(!fg and bg){
		buildMode=!buildMode;
	}
}

if(keyboard_check(vk_space)){
	if(!jumping and (onBuildBase or collDown or collDown2 or collCenter)){
		jumping=true;
		speed=2;
		direction=90;
		gravity=0.08;
	}
}

if(keyboard_check_pressed(vk_lshift)){
	running=true;
}else if(keyboard_check_released(vk_lshift)){
	running=false;
}
if(energy<=100){
	running=false;
}

if(keyboard_check(ord("A"))){
	faceAngle=0;
	x-=spd;
	nspd=spd;
	if(running){
		x-=0.8;
		nspd+=0.8;
	}
	turnLeft=true;
	moving=true;
	
}else if(keyboard_check(ord("D"))){
	faceAngle=2;
	x+=spd;
	nspd=spd;
	if(running){
		x+=0.8;
		nspd+=0.8;;
	}
	turnLeft=false;
	moving=true;
	
}else if(keyboard_check(ord("S"))){
	faceAngle=1;
	
}else if(mouse_x<x){
	faceAngle=3;
	
}else if(mouse_x>x+16){
	faceAngle=4;
	
}else{
	faceAngle=1;
	
}

#endregion

#region Testing Chat Key
if(keyboard_check_pressed(vk_enter)){
	var message=get_string("发送聊天","");
	if(string_length(message)>0){
		if(string_length(message)>50){
			cAddCinfo(c_red,"聊天内容太长了,发送失败.");
			cLog("oThePlayer.Step[PerSendChat]","欲发送的聊天内容过长[>50]");
		}else{
			cPlayer_sendChat(message);
			cLog("oThePlayer.Step[PerSendChat]","已发送");
		
		}
	}
}else if(keyboard_check_pressed(221)){
	var str=get_string("执行命令","");
	if(string_length(str)>0){
		var arr=string_split(str," ");
		cPlayer_sendCommand(arr);
		cAddCinfo(c_ltgray,"←"+str);
		cLog("oThePlayer.Step[Testing Chat Key]","请求执行命令: "+str);
	}
}else if(keyboard_check_pressed(ord("T"))){
	openChat=!openChat;
}
#endregion

#region Testing Inventory Key

if(keyboard_check_pressed(vk_tab)){
	openInv=!openInv;
	if(openInv){
		cLog("oThePlayer.Step","发送打开背包请求..");
		cPlayer_openInventory();
	}else{
		cCloseInv();
	}

}

#endregion

#region Testing Build

if(collision_point(x+7,y+7,oiBuild,false,false)){
	inBuild=true;
}else{
	inBuild=false;
}

if(upBuild!=noone)
if(cGetItemInHand()!=global.item[?"wood_hammer"]){
	upBuild=noone;
}

if(openBuildMenu){
	if(cGetItemInHand()!=global.item[?"bluepaper"] or openInv){
		openBuildMenu=false;
	}
}
	
if(mouse_check_button_pressed(mb_middle)){
	if(cGetItemInHand()==global.item[?"bluepaper"] and !openInv){
		openBuildMenu=!openBuildMenu;
	}
	
	if(cGetItemInHand()==global.item[?"wood_hammer"] and upBuild!=noone){
		upBuild=noone;
	}
}


if(buildMode)
if(!collision_line(x+7,y+8,x+7,y+global.WORLD_HIGHT,oiBuild,false,false)){
	buildMode=false;
}

if(canPlace and !openBuildMenu and !openInv 
and cGetItemInHand()==global.item[?"bluepaper"]){
	if(mouse_check_button_pressed(mb_left)){
		switch(xuanBuild){
			#region 地基
			case 0:
				if(buildFace==3){
					instance_create_depth(placeX,placeY,0,oBuildBase);
					cLog("oThePlayer.Step[Testing Build]",
						"在["+string(placeX)+","+string(placeY)+"]放置了【地基】.");
				}
				break;
			#endregion
			
			#region 墙壁
			case 1:
				if(buildFace==1){ 
					#region 后面模式
					instance_create_depth(placeX,placeY,0,oBuildBkgWall);
					#endregion
				}else if(buildFace==2){
					#region 左边模式
					var inst=instance_create_depth(placeX,placeY,0,oBuildHWall);
					if(buildStatu==0){
						inst.isLeft=true;
					}else{
						inst.isLeft=false;
					}
					#endregion
				}else{
					#region 前面模式
					instance_create_depth(placeX,placeY,0,oBuildWall);
					#endregion
				}
				cLog("oThePlayer.Step[Testing Build]",
				"在["+string(placeX)+","+string(placeY)+"]放置了【墙壁】,朝向："+cGetBuildFaceStr());
				break;
			#endregion

			#region 地板
			case 2:
				if(buildFace==3){
					instance_create_depth(placeX,placeY,0,oBuildFloor);
					cLog("oThePlayer.Step[Testing Build]",
						"在["+string(placeX)+","+string(placeY)+"]放置了【地板】.");
				}
				break;
			#endregion
			
			#region 门框
			case 3:
				instance_create_depth(placeX,placeY,0,oBuildDoorFrame);
				cLog("oThePlayer.Step[Testing Build]",
					"在["+string(placeX)+","+string(placeY)+"]放置了【门框】.");
				break;
			#endregion
			
		}
	}
}
#endregion

#region Testing Destroy

canHarryRange[0]=(x+7)-24;
canHarryRange[1]=(y+7)-24;
canHarryRange[2]=(x+7)+24;
canHarryRange[3]=(y+7)+24;

if(harryMode and harryTarget!=noone){
	if(pe==noone){
		pe=part_emitter_create(ps);
		part_emitter_stream(ps,pe,pty,1);
	}
	part_emitter_region(ps,pe,harryTarget.x-4,harryTarget.x+4,harryTarget.y-4,harryTarget.y+4,
		ps_shape_line,ps_distr_linear);
}else{
	if(pe!=noone){
		part_emitter_destroy(ps,pe);
		pe=noone;
	}
}


if(keyboard_check(ord("S")) and !inBuild){
	hideMode=true;
	harryTarget=collision_point(mouse_x,mouse_y,oiCanHarry,true,false);
	if(mouse_check_button(mb_left)
	and harryTarget
	and cCanHarry(harryTarget.x,harryTarget.y)){
		harryMode=true;
	}else{
		harryMode=false;
	}
}else{
	hideMode=false;
	harryMode=false;
	harryTarget=noone;
}

#endregion

#region Update Last And Testing Running
if(x!=lastX
or y!=lastY
or faceAngle!=lastFaceAngle
or ming!=lastMing
or energy!=lastEnergy){
	cPlayer_sendLocation();
}

if(running){
	image_speed=5.5;
}else{
	image_speed=5;
}

lasyX=x;
lastY=y;
lastFaceAngle=faceAngle;
lastMing=ming;
lastEnergy=energy;
#endregion

#region 电力
electricing=(cGetItemInHand()==global.item[?"wrench"]
	or cGetItemInHand()==global.item[?"avometer"]
	or cGetItemInHand()==global.item[?"shears"]);
#endregion

#region 更新GUI
inst_mingText.text=string(ming);
inst_energyText.text=string(energy);
inst_hotText.text=string(hot)+"℃"
inst_nameText.text=global.serverDataList[|0];

inst_PlayerInvLayout.canSee=openInv;
if(openInv){
	if((cGetItemInHand()==global.item[?"wood_hammer"]
	or cGetItemInHand()==global.item[?"bluepaper"])
	and upBuild==noone){
		invSide=inst_HammerLayout;
	}else if(upBuild!=noone){
		invSide=inst_UpBuildLayout;
	}else{
		invSide=inst_PlayerEquip;
	}
}else{
	invSide.canSee=false;
}


#region Inv上半
inst_ChestLayout.canSee=openOtherInv;
if(openInv)
if(!openOtherInv){
	inst_PlayerInvLayout.customH=-35;
	invSide.customH=-35;
}else{
	inst_PlayerInvLayout.customH=0;
	invSide.customH=0;
}
#endregion

#region 可视控制
	with(oGuiLayout){
		if(side==true){
			if(other.openInv){
				canSee=(other.invSide==self);
			}else{
				canSee=false;
			}
		}
	}
#endregion
#endregion

#region 更新背景
var tmp=collision_line(x+7,y+8,x+7,y+global.WORLD_HIGHT,oTerrain,false,false);
if(tmp){
	global.iCamera.bkg=tmp.terrtype;
}
#endregion

