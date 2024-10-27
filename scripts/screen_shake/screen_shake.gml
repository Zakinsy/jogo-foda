// Os recursos de script mudaram para a v2.3.0; veja
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para obter mais informações
function screen_shake(length, time){
	with(obj_camera){
		shake_legnth = length;
		shake_time = time;
		
		alarm [1] = shake_time;
	}
}