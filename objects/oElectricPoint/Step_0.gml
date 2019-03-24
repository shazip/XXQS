
if(in){
	if(otpoint!=noone){
		energy=otpoint.energy;
	}else if(tpoint!=noone){
		energy=tpoint.energy;
	}else{
		energy=0;
	}

}else{
	energy=owner.energy;
}

owner.energy=energy;
