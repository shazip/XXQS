if(global.iThePlayer.harryTarget==self){
	if(cCanHarry(x,y)){
		if(!alarmRun){
			alarmRun=true;
			alarm[0]=30;
		}
	}
}