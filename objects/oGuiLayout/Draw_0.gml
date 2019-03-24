if(global.showDebugInfo and canSee){
	draw_self();
}

#region 更新位置
if(ok){
	#region 更新自己的位置
	ww=camera_get_view_width(view_camera[0]);
	wh=camera_get_view_height(view_camera[0]);

	switch(dir){
		case layoutDir.leftTop:
			x=getXView();
			y=getYView();
			break;
		case layoutDir.rightTop:
			x=(getXView()+ww)-w;
			y=getYView();
			break;
		case layoutDir.leftBottom: 
			x=getXView();
			y=(getYView()+wh)-h;
			break;
		case layoutDir.rightBottom: 
			x=(getXView()+ww)-w;
			y=(getYView()+wh)-h;
			break;
		case layoutDir.leftCenter: 
			x=getXView();
			y=(getYView()+(wh/2))-(h/2);
			break;
		case layoutDir.rightCenter: 
			x=(getXView()+ww)-w;
			y=(getYView()+(wh/2))-(h/2);
			break;
		case layoutDir.topCenter: 
			x=(getXView()+(ww/2))-(w/2);
			y=getYView();
			break;
		case layoutDir.bottomCenter: 
			x=(getXView()+(ww/2))-(w/2);
			y=(getYView()+wh)-h;
			break;
		case layoutDir.centerCenter: 
			x=(getXView()+(ww/2))-(w/2);
			y=(getYView()+(wh/2))-(h/2);
			break;
	}
	
	y+=customH;
	#endregion

	#region 更新子控件的位置
	if(lastX!=x or lastY!=y){
		for(var i=0;i<sonNum;i++){
			var map=dataList[|i];
			var inst=map[?"inst"];
			inst.x=x+map[?"w"];
			inst.y=y+map[?"h"];
		}
	}
	#endregion

}
#endregion

lastX=x;
lastY=y;