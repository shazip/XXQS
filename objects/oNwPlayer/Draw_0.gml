/// @description 其他玩家绘制事件
// You can write your code in this editor

draw_set_alpha(1);
switch(faceAngle){
	case 0:
		draw_sprite(rNwPlayerLeftRun,-1,x,y);
		break;
	case 1:
		draw_sprite(rNwPlayerDefault,-1,x,y);
		break;
	case 2:
		draw_sprite(rNwPlayerRightRun,-1,x,y);
		break;
	case 3:
		draw_sprite(rNwPlayerLeftRun,1,x,y);
		break;
	case 4:
		draw_sprite(rNwPlayerRightRun,1,x,y);
		break;
}

global.infoLine=name;