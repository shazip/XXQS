/// @params command

var arr=string_split(argument0," ");

var buff = buffer_create(256, buffer_grow, 1);
buffer_seek(buff, buffer_seek_start, 0);
buffer_write(buff , buffer_u16, ST_PLAYER_CMD);
buffer_write(buff , buffer_u8, array_length_1d(arr));

for(var i=0;i<array_length_1d(arr);i++){
	buffer_write(buff , buffer_string, arr[i]);
}

network_send_packet(global.clientSock, buff, buffer_tell(buff));
buffer_delete(buff);