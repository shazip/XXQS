/// @description 地形绘制
// You can write your code in this editor
draw_self();
for(var i=0;i<60;i++){
	if(i<5){
		draw_sprite(rSandTerrainBkg,terrtype+2,x,y+300+(i*300));
	}else{
		draw_sprite(rSandTerrainBkg,1,x,y+300+(i*300));
		if(i==5){
			draw_sprite(rSandTerrainBkg,0,x,y+300+(i*300));
		}
	}
}