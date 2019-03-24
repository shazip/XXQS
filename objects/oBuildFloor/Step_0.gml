
event_inherited();

switch(level){
	case 0:
		sprite_index=rLevelFloor;
		image_index=1;
		break;
	case 1:
		sprite_index=rLevelFloor;
		image_index=2;
		break;
}

clUp=collision_point(x,y,oBuildBkgWall,false,false);
clDown=collision_point(x,y+40,oBuildBkgWall,false,false);
leftWall=collision_point(x-19,y,oBuildHWall,true,false);
rightWall=collision_point(x+19,y,oBuildHWall,true,false);
leftWall2=collision_point(x-19,y+40,oBuildHWall,true,false);
rightWall2=collision_point(x+19,y+40,oBuildHWall,true,false);