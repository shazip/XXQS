/// @params player
/// @params nameColor
/// @params name
/// @params msgColor
/// @params message

var buff = buffer_create(256, buffer_grow, 1);
buffer_seek(buff, buffer_seek_start, 0);
var player=argument0;
buffer_write(buff , buffer_u16, CT_PLAYER_CHAT);
buffer_write(buff , buffer_u32, argument1); //nameColor
buffer_write(buff , buffer_string, argument2); //name
buffer_write(buff , buffer_u32, argument3); //msgColor
buffer_write(buff , buffer_string, argument4); //message

network_send_packet(player[?"sock"], buff, buffer_tell(buff));

buffer_delete(buff);
