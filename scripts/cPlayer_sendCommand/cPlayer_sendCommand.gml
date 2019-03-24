/// @params command

var buff = buffer_create(256, buffer_grow, 1);
buffer_seek(buff, buffer_seek_start, 0);
buffer_write(buff , buffer_u16, ST_PLAYER_CMD);
buffer_write(buff , buffer_u8, array_length_1d(argument0));

for(var i=0;i<array_length_1d(argument0);i++){
	buffer_write(buff , buffer_string, argument0[i]);
}

network_send_packet(global.clientSock, buff, buffer_tell(buff));
buffer_delete(buff);