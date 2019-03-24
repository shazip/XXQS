if(terrtype==__lastterrtype){
	exit;
}
__lastterrtype=terrtype;


switch(terrtype){
	case 0:
		sprite_index=rSandTerrain;
		break;
	case 1:
		sprite_index=rYellowTerrain;
		break;
	case 2:
		sprite_index=rHotTerrain;
		break;
}