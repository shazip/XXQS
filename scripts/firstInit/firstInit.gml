
randomize();

global.showDebugInfo=false;

#region Macro
#macro SINGLE_MODE 0
#macro MANY_MODE 1
#endregion

#region Font
global.SHFONT14=font_add("simhei.ttf",14,false,false,33,11428);
global.SHFONT16=font_add("simhei.ttf",16,false,false,33,11428);
global.SHFONT18=font_add("simhei.ttf",18,false,false,33,11428);
global.SHFONT20=font_add("simhei.ttf",20,false,false,33,11428);
global.SHFONT22=font_add("simhei.ttf",22,false,false,33,11428);
global.SHFONT26=font_add("simhei.ttf",26,false,false,33,11428);
global.SHFONT28=font_add("simhei.ttf",28,false,false,33,11428);
global.SHFONT32=font_add("simhei.ttf",32,false,false,33,11428);
global.SHFONT38=font_add("simhei.ttf",38,false,false,33,11428);
#endregion

#region Macro Gui
enum layoutDir{
	leftTop,
	rightTop,
	leftBottom,
	rightBottom,
	leftCenter,
	rightCenter,
	topCenter,
	bottomCenter,
	centerCenter,
}
#endregion