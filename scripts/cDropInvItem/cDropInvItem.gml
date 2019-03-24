/// @params slot

var player_=global.iThePlayer;
var inv_= player_.inventory;
var inst_=instance_create_depth(player_.x,player_.y,10,oDropItem);
inst_.itemEnt=cSlotItemEnt(argument0);
inv_[|argument0]=noone;
