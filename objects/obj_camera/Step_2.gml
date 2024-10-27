camera_set_view_size(view_camera[0], width, height);

if (instance_exists(global.view_target)){
	var x_to = global.view_target.x - width/2;
	var y_to = global.view_target.y - height/2 - sprite_get_height(spr_shadow_idle)/2;
	
	x_to = clamp(x_to, 0, room_width - width);
	y_to = clamp(y_to, 0, room_height - height);
	
	if (shake_legnth != 0){
		x_to += random_range(-shake_legnth, shake_legnth);
		y_to += random_range(-shake_legnth, shake_legnth);
	}
	
	var c_x = camera_get_view_x(view_camera[0]);
	var c_y = camera_get_view_y(view_camera[0]);
	
	var n_x = lerp(c_x, x_to, cam_spd);
	var n_y = lerp(c_y, y_to, cam_spd);
	
	camera_set_view_pos(view_camera[0], n_x, n_y);
}

if (keyboard_check_pressed(vk_f4)){
	window_set_fullscreen(!window_get_fullscreen());
}