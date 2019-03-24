/// @params player
var buff = buffer_create(256, buffer_grow, 1);
buffer_seek(buff, buffer_seek_start, 0);
buffer_write(buff , buffer_u16, ST_PLAYER_JOIN);
buffer_write(buff , buffer_string, global.serverDataList[|0]);
buffer_write(buff , buffer_string, global.serverDataList[|1]);

network_send_packet(global.clientSock, buff, buffer_tell(buff));

buffer_delete(buff);