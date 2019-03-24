/// @params player
/// @params quitPlayer
var buff = buffer_create(256, buffer_grow, 1);
buffer_seek(buff, buffer_seek_start, 0);
buffer_write(buff , buffer_u16, CT_DEL_PLAYER);
buffer_write(buff , buffer_string, argument1[?"name"]);

network_send_packet(argument0[?"sock"], buff, buffer_tell(buff));

buffer_delete(buff);

