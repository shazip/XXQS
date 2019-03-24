/// @params player
/// @params otPlayer
var buff = buffer_create(256, buffer_grow, 1);
buffer_seek(buff, buffer_seek_start, 0);
var player=argument0;
var _otPlayer=argument1;
buffer_write(buff , buffer_u16, CT_PLAYER_INV);

for(var i=0;i<36;i++){
	var _inv=player[?"inv"];
	if(_inv[|i]!=noone){
		var _itemEnt=_inv[|i];
		buffer_write(buff , buffer_u16, _itemEnt[?"item"]);
		buffer_write(buff , buffer_u8, _itemEnt[?"count"]);
	}else{
		buffer_write(buff , buffer_u16, global.item[?"err"]);
		buffer_write(buff , buffer_u8, 0);
	}
}

network_send_packet(_otPlayer[?"sock"], buff, buffer_tell(buff));

buffer_delete(buff);

