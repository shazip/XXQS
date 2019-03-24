/// @params player
var buff = buffer_create(256, buffer_grow, 1);
buffer_seek(buff, buffer_seek_start, 0);
var player=argument0;
buffer_write(buff , buffer_u16, CT_GEN_TERRAIN);

var terrain=global.serverWorld[?"terrain"];
buffer_write(buff , buffer_u8, ds_list_size(terrain));
for(var i=0;i<ds_list_size(terrain);i++){
	buffer_write(buff , buffer_u16, terrain[|i]);
}

network_send_packet(player[?"sock"], buff, buffer_tell(buff));

buffer_delete(buff);

