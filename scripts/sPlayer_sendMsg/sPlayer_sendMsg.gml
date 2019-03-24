/// @params player
/// @params msgColor
/// @params message
var buff = buffer_create(256, buffer_grow, 1);
buffer_seek(buff, buffer_seek_start, 0);
var player=argument0;
buffer_write(buff , buffer_u16, CT_PLAYER_MSG);
buffer_write(buff , buffer_u32, argument1); //msgColor
buffer_write(buff , buffer_string, argument2); //message

network_send_packet(player[?"sock"], buff, buffer_tell(buff));

buffer_delete(buff);
