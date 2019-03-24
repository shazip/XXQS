/// @params player
var buff = buffer_create(256, buffer_grow, 1);
buffer_seek(buff, buffer_seek_start, 0);
buffer_write(buff , buffer_u16, ST_PLAYER_LOCATION);
buffer_write(buff , buffer_u16, global.iThePlayer.faceAngle);
buffer_write(buff , buffer_u16, global.iThePlayer.x);
buffer_write(buff , buffer_u16, global.iThePlayer.y);
buffer_write(buff , buffer_bool, global.iThePlayer.running);
buffer_write(buff , buffer_u16, global.iThePlayer.ming);
buffer_write(buff , buffer_u16, global.iThePlayer.energy);
buffer_write(buff , buffer_u16, global.iThePlayer.depth);
buffer_write(buff , buffer_u16, global.iThePlayer.hot);

network_send_packet(global.clientSock, buff, buffer_tell(buff));

buffer_delete(buff);