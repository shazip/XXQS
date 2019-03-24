
event_inherited();

if(clUp){
	if(leftWall and rightWall){
		draw_sprite(rBuildWShadow,7,x,y-3);
	}else if(leftWall){
		draw_sprite(rBuildWShadow,3,x,y-3);
	}else if(rightWall){
		draw_sprite(rBuildWShadow,5,x,y-3);
	}else{
		draw_sprite(rBuildWShadow,1,x,y-3);
	}
}
if(clDown){
	if(leftWall2 and rightWall2){
		draw_sprite(rBuildWShadow,6,x,y+40);
	}else if(leftWall2){
		draw_sprite(rBuildWShadow,2,x,y+40);
	}else if(rightWall2){
		draw_sprite(rBuildWShadow,4,x,y+40);
	}else{
		draw_sprite(rBuildWShadow,0,x,y+40);
	}
}