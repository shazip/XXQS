/// @params player
/// @params item
/// @params count

var buff = buffer_create(256, buffer_grow, 1);
buffer_seek(buff, buffer_seek_start, 0);
var player=argument0;
buffer_write(buff , buffer_u16, CT_ADD_ITEMENT);
buffer_write(buff , buffer_u16, argument1);
buffer_write(buff , buffer_u8, argument2);

network_send_packet(player[?"sock"], buff, buffer_tell(buff));

buffer_delete(buff);

