/// @params player
/// @params otPlayer
var buff = buffer_create(256, buffer_grow, 1);
buffer_seek(buff, buffer_seek_start, 0);
var player=argument0;
buffer_write(buff , buffer_u16, CT_ADD_PLAYER);
buffer_write(buff , buffer_string, player[?"name"]);
buffer_write(buff , buffer_u16, player[?"faceAngle"]);
buffer_write(buff , buffer_u16, player[?"x"]);
buffer_write(buff , buffer_u16, player[?"y"]);

network_send_packet(argument1[?"sock"], buff, buffer_tell(buff));

buffer_delete(buff);

