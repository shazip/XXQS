/// @description 主要绘制GUI和文字什么的
// You can write your code in this editor
/*
#region GUI 工具
var _w=x-getXView();
var _h=y-getYView();
var _s=4;
var _ws=_w*_s;
var _hs=_h*_s;
#endregion
*/

#region Draw Debug Info
if(global.showDebugInfo){

	var arr;
	arr[0]="";
	arr[1]="";
	arr[2]="碰撞: 下["+stringBool(global.iThePlayer.collDown==true)+"],"
		+"下中["+stringBool(global.iThePlayer.collDown2==true)+"],"
		+"中["+stringBool(global.iThePlayer.collCenter==true)+"]";
	arr[3]="相机: ["+string(global.iCamera.x)+","+string(global.iCamera.y)+"]";
	arr[4]="世界指针: ["+string(mouse_x)+","+string(mouse_y)+"]";
	arr[5]="底层: ["+stringBool(global.iThePlayer.hideMode)+"]";
	arr[6]="掠夺: ["+stringBool(global.iThePlayer.harryMode)+"]";
	arr[7]="深度: ["+string(global.iThePlayer.depth)+"]";
	arr[8]="跳跃: ["+stringBool(global.iThePlayer.jumping)+"]";
	arr[9]="屏幕指针: ["+string(window_mouse_get_x())+","+string(window_mouse_get_y())+"]";
	arr[10]="奔跑: ["+stringBool(global.iThePlayer.running)+"]";
	arr[11]="位置: ["+string(global.iThePlayer.x)+","+string(global.iThePlayer.y)+"]";
	arr[12]="名字: ["+global.iThePlayer.name+"]";
	arr[13]="FPS: ["+string(fps)+"]";

	var size=array_length_1d(arr);
	for(var i=0;i<size;i++){
		var str=arr[i];
		draw_set_halign(fa_right);
		draw_set_valign(fa_left);
		draw_set_color(c_black);
		draw_set_alpha(0.6);
		draw_rectangle(global.WIN_WIDTH-2,(i*20),global.WIN_WIDTH-(string_width(str)+5),(i*20)+19,false);
		draw_set_alpha(1);
		draw_set_color(c_white);
		draw_set_font(global.SHFONT14)
		draw_text(global.WIN_WIDTH-2,(i*20)+2,str);	
	}
}
#endregion

#region Draw Chat

draw_set_font(global.SHFONT18);

draw_set_halign(fa_left);
draw_set_valign(fa_left);

var _chatList=global.chatList;
var _t=false
if(global.iThePlayer.openChat){
	_chatList=global.chatList2;
		_t=true;
}
var _list=ds_list_create();
for(var i=ds_list_size(_chatList)-1;i>-1;i--){
	ds_list_add(_list,_chatList[|i]);
}

var _y=60;

for(var i=0;i<ds_list_size(_list);i++){
	var msg=_list[|i];
	if(msg!=noone and msg!=undefined){
		var nameStr=msg[?"name"];
		var msgStr=msg[?"message"];
		if(_t){
			draw_set_color(c_black);
			draw_set_alpha(0.5);
			draw_rectangle(6,global.WIN_HEIGHT-(i*30)-63,700,global.WIN_HEIGHT-(i*30)-34,false);
		}
		if(msg[?"type"]=="chat"){
			draw_set_alpha(1);
			draw_set_color(msg[?"nameColor"]);
			draw_text_shadow(6,global.WIN_HEIGHT-(i*30)-_y,nameStr);
			draw_set_color(msg[?"msgColor"]);
			draw_text_shadow(string_width(nameStr)+6,global.WIN_HEIGHT-(i*30)-_y,":"+msgStr);
		}else if(msg[?"type"]=="cinfo"){
			draw_set_alpha(1);
			draw_set_color(msg[?"msgColor"]);
			draw_text_shadow(6,global.WIN_HEIGHT-(i*30)-_y,msgStr);
		}
	}
}
ds_list_destroy(_list);

#endregion

#region 画BuildFace
if(cGetItemInHand()==global.item[?"bluepaper"]
or cGetItemInHand()==global.item[?"wood_hammer"]){
	draw_set_font(global.SHFONT26);
	draw_set_halign(fa_right);
	draw_set_valign(fa_top);
	draw_text_shadow(window_get_width()-4,4,"§d"+cGetBuildFaceStr());
}
#endregion

#region 建筑菜单
if(global.iThePlayer.openBuildMenu){
	var size=array_length_1d(linearBuild);
	var _x=(window_get_width()/2);
	var _y=((window_get_height()/2)-size*22);
	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
	draw_set_font(global.SHFONT26);
	for(var i=0;i<size;i++){
		if(buildXuan!=i){
			draw_set_color(c_dkgray);
		}else{
			draw_set_color(c_maroon);
		}
		draw_set_alpha(0.9);
		draw_rectangle(_x-150,(_y-30)+i*50,_x+150,(_y+20)+i*50,false);
		draw_set_color(c_white);
		draw_text_shadow(_x,_y+i*50,linearBuild[i]);
	}
}
#endregion