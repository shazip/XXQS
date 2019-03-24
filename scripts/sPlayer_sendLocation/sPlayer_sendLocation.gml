/// @params player
/// @params otPlayer
var buff = buffer_create(256, buffer_grow, 1);
buffer_seek(buff, buffer_seek_start, 0);
var otPlayer=argument0;
buffer_write(buff , buffer_u16, CT_LOCATION);
buffer_write(buff , buffer_string, otPlayer[?"name"]);
buffer_write(buff , buffer_u16, otPlayer[?"faceAngle"]);
buffer_write(buff , buffer_u16, otPlayer[?"x"]);
buffer_write(buff , buffer_u16, otPlayer[?"y"]);
buffer_write(buff , buffer_bool, otPlayer[?"running"]);
buffer_write(buff , buffer_u16, otPlayer[?"ming"]);
buffer_write(buff , buffer_u16, otPlayer[?"energy"]);
buffer_write(buff , buffer_u16, otPlayer[?"depth"]);
buffer_write(buff , buffer_u8, otPlayer[?"hot"]);

network_send_packet(argument1[?"sock"], buff, buffer_tell(buff));

buffer_delete(buff);

