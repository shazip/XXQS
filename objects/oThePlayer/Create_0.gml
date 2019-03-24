/// @description 客户端玩家初始化
// You can write your code in this editor

depth=10;
image_speed=5;
gravity=0.07;
speed=0.5;
direction=270;
alarm[0]=4;
alarm[1]=4;
alarm[2]=30;
ming=200;
energy=500;
hot=40;

lastFaceAngle=0;
faceAngle=0;
spd=1;
nspd=1;
moving=false;
turnLeft=false;
jumping=false;
colling=false;
running=false;
name=global.serverDataList[|0];
dead=false;

lastX=0;
lastY=0;

collDown=false;
collCenter=false;
collDown2=false;

lastFaceAngle=0;
lastMing=0;
lastEnergy=0;


#region INV
inventory=ds_list_create();
repeat(36){
	ds_list_add(inventory,noone);
}
repeat(30){
	ds_list_add(inventory,noone);
}

openInv=false;
openOtherInv=false;
invInst=noone;
xuanSlot=0;
invSide=inst_PlayerEquip;

#endregion

mouseIn=false;
canPlace=false;
placeX=0;
placeY=0;
claimBase=false;
openBuildMenu=false;
xuanBuild=0;
buildStatu=0;
onBuildBase=false;
buildMode=false;
buildFace=3;
upBuild=noone;
openGui=false;
openChat=false;

electricing=false;

drawCol=c_white;
harryMode=false;
harryTarget=noone;
hideMode=false;
canHarryRange[0]=0;
canHarryRange[1]=0;
canHarryRange[2]=0;
canHarryRange[3]=0;
inBuild=false;;
ps=part_system_create();
pty=part_type_create();
part_type_direction(pty,70,120,0,0);
part_type_speed(pty,0.1,0.5,0,0);
part_type_color2(pty,c_blue,c_aqua);
part_type_life(pty,50,100);
part_type_shape(pty,pt_shape_pixel);
part_type_size(pty,0.5,1.5,0,0);
pe=noone;
