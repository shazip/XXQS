/// @description 主要绘制背景什么的
// You can write your code in this editor

#region Draw sky and sun
var sunX=getXView()+100;
var sunY=getYView()+40;

for(var i=0;i<10;i++){
	draw_sprite(rSkyBkg, bkg,getXView()+(300*i),getYView());
}
draw_sprite_ext(rSun,bkg,sunX,sunY,1,1,18,c_white,1);


#endregion

#region Draw Backgroup
draw_set_alpha(1);
for(var i=0;i<10;i++){
	draw_sprite(rSandBkg,bkg,(getXView()-(getXView()/50))+i*300,getYView()-(getYView()/50)+80);
	draw_sprite(rHillBkg,bkg,(getXView()-(getXView()/30))+i*300,getYView()-(getYView()/25)+130);
	draw_sprite(rMountainBkg,bkg,(getXView()-(getXView()/15))+i*300,getYView()-(getYView()/10)+360);
}


#endregion