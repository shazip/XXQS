/// @description 根据游戏模式不同初始游戏
// You can write your code in this editor

switch(global.playMode){
	case SINGLE_MODE:
		global.iServer=instance_create_depth(0,0,0,oServer);

		global.iClient=instance_create_depth(0,0,0,oClient);
		global.iThePlayer=instance_create_depth(139,4683,100,oThePlayer);
		global.iCamera=instance_create_depth(x,y,depth,oCamera);
		global.iManager=instance_create_depth(0,0,0,oManager);

		cPlayer_sendInfo();
		cPlayer_sendGenTerrain()
		break;
		
	case MANY_MODE:
		global.iClient=instance_create_depth(0,0,0,oClient);
		global.iThePlayer=instance_create_depth(139,4683,100,oThePlayer);
		global.iCamera=instance_create_depth(x,y,depth,oCamera);
		global.iManager=instance_create_depth(0,0,0,oManager);
		
		cPlayer_sendInfo();
		cPlayer_sendGenTerrain()
		break;
}

cPlayer_sendCommandStr("give @s electric_light 100");
cPlayer_sendCommandStr("give @s quantum_generator 1");
cPlayer_sendCommandStr("give @s avometer 1");
cPlayer_sendCommandStr("give @s wrench 1");
cPlayer_sendCommandStr("give @s shears 1");
cPlayer_sendCommandStr("give @s yellow_couplet 10");
cPlayer_sendCommandStr("give @s lamp 10");
cPlayer_sendCommandStr("give @s wood_big_chest 1");
cPlayer_sendCommandStr("give @s dead_log 255");
cPlayer_sendCommandStr("give @s bluepaper 1");
cPlayer_sendCommandStr("give @s wood_hammer 1");
cPlayer_sendCommandStr("give @s stone 255");
cPlayer_sendCommandStr("give @s blue_log 255");
cPlayer_sendCommandStr("give @s warn_sign 20");
cPlayer_sendCommandStr("give @s green_sign 20");
cPlayer_sendCommandStr("give @s stop_sign 20");
cPlayer_sendCommandStr("give @s yellow_couplet 10");