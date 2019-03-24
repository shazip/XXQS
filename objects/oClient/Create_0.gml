/// @description 客户端初始化
// You can write your code in this editor

#region Win
winTitle=window_get_caption();
first=true;
window_w = window_get_width();
window_h = window_get_height();
window_x = window_get_x();
window_y = window_get_y();

#endregion

#region Macro

#macro CT_LOCATION 0
#macro CT_ADD_PLAYER 1
#macro CT_DEL_PLAYER 2
#macro CT_PLAYER_CHAT 3
#macro CT_PLAYER_MSG 4
#macro CT_GEN_TERRAIN 5
#macro CT_PLAYER_CMD 6
#macro CT_PLAYER_INV 7
#macro CT_ADD_ITEMENT 8

#macro ST_PLAYER_JOIN 0
#macro ST_PLAYER_LOCATION 1
#macro ST_PLAYER_CHAT 2
#macro ST_GEN_TERRAIN 3
#macro ST_PLAYER_CMD 4
#macro ST_PLAYER_INV 5
#macro ST_PLAYER_OPEN_INV 6
#macro ST_PLAYER_GET_INV 7

#endregion

#region Init
depth=-100;
alarm[0]=60;

global.WORLD_WIDTH=5000;
global.WORLD_HIGHT=5000;
global.TERRAIN_HIGHT=3600;
global.WIN_WIDTH=1200;
global.WIN_HEIGHT=860;
global.showDebugInfo=false;

global.terrain=ds_list_create();
global.iTerrainList=ds_list_create();

global.nwplayerList=ds_list_create();

thingRot=0;
#endregion

#region Init Items
#region Macro
#macro TYPE_ITEM 0
#macro TYPE_BUILD 1
#macro TYPE_SIGN 2
#macro TYPE_LOG 3
#macro TYPE_COUPLET 4
#macro TYPE_CHEST 5
#macro TYPE_FURNITURE 6

#macro DIR_DOWN 0
#macro DIR_UP 1

#macro MATERIAL_WOOD 0
#macro MATERIAL_IRON 1
#macro MATERIAL_HIGHMETAL 2
#macro MATERIAL_STONE 3

#macro MATERIAL_UNKNOW 100
#endregion

global.item=ds_map_create();

var _item=ds_map_create();
ds_map_add(_item,"name","Err");
ds_map_add(_item,"type",TYPE_ITEM);
ds_map_add(_item,"spr",rIconErr);
ds_map_add(_item,"max",255);
ds_map_add(_item,"material",MATERIAL_UNKNOW);
ds_map_add(_item,"des","一个不存在的物品.");
ds_map_add(global.item,"err",_item);

var _item=ds_map_create();
ds_map_add(_item,"name","石头");
ds_map_add(_item,"type",TYPE_ITEM);
ds_map_add(_item,"spr",rIconStone);
ds_map_add(_item,"max",255);
ds_map_add(_item,"material",MATERIAL_STONE);
ds_map_add(_item,"des","这种石头虽然到处都能看见,但是用途很大.");
ds_map_add(global.item,"stone",_item);

var _item=ds_map_create();
ds_map_add(_item,"name","建筑图纸");
ds_map_add(_item,"type",TYPE_ITEM);
ds_map_add(_item,"spr",rIconBluePaper);
ds_map_add(_item,"max",6);
ds_map_add(_item,"material",MATERIAL_UNKNOW);
ds_map_add(_item,"des","建筑都需要用到图纸.");
ds_map_add(global.item,"bluepaper",_item);

var _item=ds_map_create();
ds_map_add(_item,"name","木锤");
ds_map_add(_item,"type",TYPE_ITEM);
ds_map_add(_item,"spr",rIconHammer);
ds_map_add(_item,"max",1);
ds_map_add(_item,"material",MATERIAL_WOOD);
ds_map_add(_item,"des","升级、改造、或拆除你的建筑.");
ds_map_add(global.item,"wood_hammer",_item);

var _item=ds_map_create();
ds_map_add(_item,"name","警告路标");
ds_map_add(_item,"type",TYPE_SIGN);
ds_map_add(_item,"spr",rIconWarnSign);
ds_map_add(_item,"max",255);
ds_map_add(_item,"material",MATERIAL_IRON);
ds_map_add(_item,"des","装在地上,警告其他玩家.");
ds_map_add(global.item,"warn_sign",_item);
ds_map_add(_item,"signSpr",rWarnSign);

var _item=ds_map_create();
ds_map_add(_item,"name","微笑路标");
ds_map_add(_item,"type",TYPE_SIGN);
ds_map_add(_item,"spr",rIconGreenSign);
ds_map_add(_item,"max",255);
ds_map_add(_item,"material",MATERIAL_IRON);
ds_map_add(_item,"des","可以用来声明自己是友好的.");
ds_map_add(global.item,"green_sign",_item);
ds_map_add(_item,"signSpr",rGreenSign);

var _item=ds_map_create();
ds_map_add(_item,"name","停止路标");
ds_map_add(_item,"type",TYPE_SIGN);
ds_map_add(_item,"spr",rIconStopSign);
ds_map_add(_item,"max",255);
ds_map_add(_item,"material",MATERIAL_IRON);
ds_map_add(_item,"des","停!");
ds_map_add(global.item,"stop_sign",_item);
ds_map_add(_item,"signSpr",rStopSign);

var _item=ds_map_create();
ds_map_add(_item,"name","蓝树原木");
ds_map_add(_item,"type",TYPE_LOG);
ds_map_add(_item,"spr",rIconBlueLog);
ds_map_add(_item,"max",255);
ds_map_add(_item,"material",MATERIAL_WOOD);
ds_map_add(_item,"des","非常有用的材料,可以做成木板.");
ds_map_add(global.item,"blue_log",_item);

var _item=ds_map_create();
ds_map_add(_item,"name","枯死的蓝树原木");
ds_map_add(_item,"type",TYPE_LOG);
ds_map_add(_item,"spr",rIconDieLog);
ds_map_add(_item,"max",255);
ds_map_add(_item,"material",MATERIAL_WOOD);
ds_map_add(_item,"des","适合用来烧火.");
ds_map_add(global.item,"dead_log",_item);

var _item=ds_map_create();
ds_map_add(_item,"name","金色对联");
ds_map_add(_item,"type",TYPE_COUPLET);
ds_map_add(_item,"spr",rIconCouplet);
ds_map_add(_item,"max",255);
ds_map_add(_item,"material",MATERIAL_UNKNOW);
ds_map_add(_item,"des","金闪闪的,贴在大门口必定好看.");
ds_map_add(global.item,"yellow_couplet",_item);
ds_map_add(_item,"index",0);

var _item=ds_map_create();
ds_map_add(_item,"name","木制大型箱子");
ds_map_add(_item,"type",TYPE_FURNITURE);
ds_map_add(_item,"spr",rIconBigWoodChest);
ds_map_add(_item,"max",1);
ds_map_add(_item,"material",MATERIAL_WOOD);
ds_map_add(_item,"des","木头做的大箱子,可以装很多东西.");
ds_map_add(global.item,"wood_big_chest",_item);
ds_map_add(_item,"thiSpr",rWoodBigChest);
ds_map_add(_item,"obj",oBigChest);
ds_map_add(_item,"dir",DIR_DOWN);
ds_map_add(_item,"cap",5);
ds_map_add(_item,"material",MATERIAL_WOOD);

var _item=ds_map_create();
ds_map_add(_item,"name","路灯");
ds_map_add(_item,"type",TYPE_SIGN);
ds_map_add(_item,"spr",rIconLamp);
ds_map_add(_item,"max",100);
ds_map_add(_item,"material",MATERIAL_HIGHMETAL);
ds_map_add(_item,"des","发出光芒,照亮地面");
ds_map_add(global.item,"lamp",_item);
ds_map_add(_item,"signSpr",rLamp);

var _item=ds_map_create();
ds_map_add(_item,"name","扳手");
ds_map_add(_item,"type",TYPE_ITEM);
ds_map_add(_item,"spr",rIconWrench);
ds_map_add(_item,"max",1);
ds_map_add(_item,"material",MATERIAL_HIGHMETAL);
ds_map_add(_item,"des","接线必不可少");
ds_map_add(global.item,"wrench",_item);

var _item=ds_map_create();
ds_map_add(_item,"name","剪线钳");
ds_map_add(_item,"type",TYPE_ITEM);
ds_map_add(_item,"spr",rIconShears);
ds_map_add(_item,"max",1);
ds_map_add(_item,"material",MATERIAL_HIGHMETAL);
ds_map_add(_item,"des","对线进行加工");
ds_map_add(global.item,"shears",_item);

var _item=ds_map_create();
ds_map_add(_item,"name","数字万用表");
ds_map_add(_item,"type",TYPE_ITEM);
ds_map_add(_item,"spr",rIconAvometer);
ds_map_add(_item,"max",1);
ds_map_add(_item,"material",MATERIAL_HIGHMETAL);
ds_map_add(_item,"des","用于调试电路或测量仪器");
ds_map_add(global.item,"avometer",_item);

var _item=ds_map_create();
ds_map_add(_item,"name","量子发电机");
ds_map_add(_item,"type",TYPE_FURNITURE);
ds_map_add(_item,"spr",rIconQuantumGenerator);
ds_map_add(_item,"max",1);
ds_map_add(_item,"material",MATERIAL_UNKNOW);
ds_map_add(_item,"thiSpr",rQuantumGenerator);
ds_map_add(_item,"obj",oGenerator);
ds_map_add(_item,"dir",DIR_DOWN);
ds_map_add(_item,"des","虽然能无限发电!但很危险,你利用不了.");
ds_map_add(global.item,"quantum_generator",_item);

var _item=ds_map_create();
ds_map_add(_item,"name","电灯");
ds_map_add(_item,"type",TYPE_FURNITURE);
ds_map_add(_item,"spr",rIconElectricLight);
ds_map_add(_item,"max",100);
ds_map_add(_item,"material",MATERIAL_HIGHMETAL);
ds_map_add(_item,"thiSpr",rElectricLight);
ds_map_add(_item,"obj",oElectricLight);
ds_map_add(_item,"dir",DIR_UP);
ds_map_add(_item,"des","通电发出亮光,用于照明.");
ds_map_add(global.item,"electric_light",_item);
#endregion



#region GUI
#macro INV_PLAYER 0
#macro INV_CHEST 1;
global.infoLine=noone;
global.chatList=ds_list_create();
global.chatList2=ds_list_create();
xuanInv=INV_PLAYER;
xuanSlot=-1;
xuanCount=0;
movItemEnt=noone;
xuanNwPlayer=noone;
showEscMenu=false;

lastMouseX=-1;
lastMouseY=-1;
#region son
	buildXuan=0;
	
	linearBuild[0]="地基";
	linearBuild[1]="墙壁";
	linearBuild[2]="地板";
	linearBuild[3]="门框";
	linearBuild[4]="窗户框";
	linearBuild[5]="楼梯";
	linearBuild[6]="台阶地基";
	linearBuild[7]="地板框架";
	linearBuild[8]="墙壁框架";
	linearBuild[9]="屋顶";
	linearBuild[10]="半墙";
	linearBuild[11]="围墙";


#endregion
#endregion

#region Network
global.clientSock=network_create_socket(network_socket_tcp);
server= network_connect(global.clientSock,
	global.serverDataList[|2],
	global.serverDataList[|3]);
if(server < 0){
    cLog("oClient.Create","连接服务器【失败】");
}else{
    cLog("oClient.Create","连接服务器【成功】");
	
}
#endregion
