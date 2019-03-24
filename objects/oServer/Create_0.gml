/// @description 服务端初始化
// You can write your code in this editor

global.maxPlayers=20;
global.socketMap=ds_map_create();
global.playerList=ds_list_create();
global.serverSock=network_create_server(network_socket_tcp,25566,global.maxPlayers);
global.serverWorld=ds_map_create();
ds_map_add(global.serverWorld,"spawnX",20000);
ds_map_add(global.serverWorld,"spawnY",3000);
var _list=ds_list_create();

sLog("oServer.Create","开始生成地形...");
ds_list_add(_list,10001);
for(var i=0;i<30;i++){
	ds_list_add(_list,irandom(1));
}
ds_list_add(_list,10002);
for(var i=0;i<30;i++){
	ds_list_add(_list,irandom(1));
}
ds_list_add(_list,10003);
for(var i=0;i<30;i++){
	ds_list_add(_list,irandom(2));
}
sLog("oServer.Create","地形生成完毕");

ds_map_add(global.serverWorld,"terrain",_list);

if (global.serverSock <0){
    sLog("oServer.Create","服务器开启【失败】");
}else{
	sLog("oServer.Create","服务器开启【成功】！");
}

genedPlant=false;