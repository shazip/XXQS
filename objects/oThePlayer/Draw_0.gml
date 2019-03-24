/// @description 绘制事件
// You can write your code in this editor


if(harryMode){
	draw_sprite(rPlayerBilibili,-1,x+7,y);
}

#region FaceAngle
draw_set_alpha(1);
switch(faceAngle){
	case 0:
		draw_sprite_ext(rPlayerLeftRun,-1,x,y,1,1,image_angle,drawCol,1);
		break;
	case 1:
		draw_sprite_ext(rPlayerDefault,-1,x,y,1,1,image_angle,drawCol,1);
		break;
	case 2:
		draw_sprite_ext(rPlayerRightRun,-1,x,y,1,1,image_angle,drawCol,1);
		break;
	case 3:
		draw_sprite_ext(rPlayerLeftRun,1,x,y,1,1,image_angle,drawCol,1);
		break;
	case 4:
		draw_sprite_ext(rPlayerRightRun,1,x,y,1,1,image_angle,drawCol,1);
		break;
}
#endregion
