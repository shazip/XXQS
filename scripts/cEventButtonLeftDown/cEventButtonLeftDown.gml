var rid=argument0;
var layout=argument1;
var inst=argument2;
switch(layout){
	#region startMenu
	case "startMenu":
		switch(rid){
			case "dryx":
				global.playMode=SINGLE_MODE;
				room_goto(mGame);
				break;
			case "tc":
				game_end();
				break;
		}
		break;
	#endregion
	
	#region HammerLayout
	case "HammerLayout":
		switch(rid){
			case "zheng":
				global.iThePlayer.buildFace=3;
				cCloseInv();
				break;
			case "qian":
				global.iThePlayer.buildFace=0;
				cCloseInv();
				break;
			case "hou":
				global.iThePlayer.buildFace=1;
				cCloseInv();
				break;
			case "zuo":
				global.iThePlayer.buildFace=2;
				cCloseInv();
				break;
		}
		break;
	#endregion
	
	#region UpBuildLayout
	case "UpBuildLayout":
		var buildInst=global.iThePlayer.upBuild;
		if(rid==string("chai")){
			instance_destroy(buildInst);
			global.iThePlayer.upBuild=noone;
			break;
		}
		buildInst.level=rid;
		cCloseInv();
		break;
	#endregion
	
}